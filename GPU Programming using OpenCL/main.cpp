#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <chrono>
#include <string>

#include <CL/cl.h>

#define MAX_SOURCE_SIZE (0x100000)

// C version of matrix multiplcation. Use this function for result validation and execution time comaprison
void matrix_mul_sequence (int *A_mat,
                          int *B_mat,
                          int *C_mat,
                          int size)
{
	for (int j=0; j<size; j++) {
		for (int i=0; i<size; i++)
			for (int k=0; k<size; k++)
				C_mat[j*size + i] += A_mat[j*size + k] * B_mat[k*size + i];
	}
}

 void perform_mult (cl_device_id device_id,
				 	char *source_str,
				    size_t source_size,
 					int *A,
 					int *B,
 					int *C,
 					int *C_seq,
    				int cpu,
    				int size,
    				int tile_size,
    				int do_mat_mul_tile)
 {

 	cl_int ret;
    // Create an OpenCL context
    cl_context context = clCreateContext( NULL, 1, &device_id, NULL, NULL, &ret);

    // Create a command queue with the capability of performance profiling for target device
    cl_command_queue command_queue = clCreateCommandQueue(context, device_id, CL_QUEUE_PROFILING_ENABLE, &ret);

    // Create memory buffers on the device for each matrix
    cl_mem a_mem_obj = clCreateBuffer(context, CL_MEM_READ_WRITE, size*size*sizeof(int), NULL, &ret);
    cl_mem b_mem_obj = clCreateBuffer(context, CL_MEM_READ_WRITE, size*size*sizeof(int), NULL, &ret);
    cl_mem c_mem_obj = clCreateBuffer(context, CL_MEM_READ_WRITE, size*size*sizeof(int), NULL, &ret);

    // Copy the matrix A, B and C to each device memory counterpart
    ret = clEnqueueWriteBuffer(command_queue, a_mem_obj, CL_TRUE, 0, size*size*sizeof(int), A, 0, NULL, NULL);
    ret = clEnqueueWriteBuffer(command_queue, b_mem_obj, CL_TRUE, 0, size*size*sizeof(int), B, 0, NULL, NULL);
    ret = clEnqueueWriteBuffer(command_queue, c_mem_obj, CL_TRUE, 0, size*size*sizeof(int), C, 0, NULL, NULL);

    // Create a program from the kernel source
    cl_program program = clCreateProgramWithSource(context, 1, (const char **)&source_str, (const size_t *)&source_size, &ret);

    // Build and compile the OpenCL kernel program
    std::string build_option = "-DTILE_SIZE=" + std::to_string(tile_size);
    ret = clBuildProgram(program, 1, &device_id, build_option.c_str(), NULL, NULL);
    if (ret == CL_BUILD_PROGRAM_FAILURE) { // If compile failed, print the error message
		// Determine the size of the log
		size_t log_size;
		clGetProgramBuildInfo(program, device_id, CL_PROGRAM_BUILD_LOG, 0, NULL, &log_size);
		char *log = (char *) malloc(log_size);

		// Get the log and print it
		clGetProgramBuildInfo(program, device_id, CL_PROGRAM_BUILD_LOG, log_size, log, NULL);
		printf("%s\n", log);
	}

    // Create the OpenCL kernel
    cl_kernel kernel;

    if(do_mat_mul_tile) {
    	printf("Tile Size %d\n", tile_size);
		kernel = clCreateKernel(program, "matrix_mul_tile", &ret);
	} else {
		printf("Normal Kernel\n");
		kernel = clCreateKernel(program, "matrix_mul", &ret);		
	}

    // Set the arguments of the kernel
    ret = clSetKernelArg(kernel, 0, sizeof(cl_mem), (void *)&a_mem_obj);
    ret = clSetKernelArg(kernel, 1, sizeof(cl_mem), (void *)&b_mem_obj);
    ret = clSetKernelArg(kernel, 2, sizeof(cl_mem), (void *)&c_mem_obj);

    int dimention = 2; // In this example, We will use 2 dimention index
    size_t global_item_size[] = {size, size, 1};
    size_t local_item_size[] = {tile_size, tile_size, 1};

	cl_event perf_event;
	cl_ulong start, end;

	// Execute the OpenCL kernel
    ret = clEnqueueNDRangeKernel(command_queue, kernel, dimention, NULL, global_item_size, local_item_size, 0, NULL, &perf_event);
    // Capture performance event from target device. In this case the event is to retrive the execution time.
    ret = clWaitForEvents(1, &perf_event);
    ret = clGetEventProfilingInfo(perf_event, CL_PROFILING_COMMAND_START, sizeof(start), &start, NULL);
    ret = clGetEventProfilingInfo(perf_event, CL_PROFILING_COMMAND_END, sizeof(end), &end, NULL);
    if(cpu == 0) {
    	std::cout << "OpenCL on GPU: " << (float)(end - start)/1000000000 << " sec" << std::endl;
    } else {
    	std::cout << "OpenCL on CPU: " << (float)(end - start)/1000000000 << " sec" << std::endl;
    }

    // Read the memory buffer C from the device into the local variable C
    ret = clEnqueueReadBuffer(command_queue, c_mem_obj, CL_TRUE, 0, size*size*sizeof(int), C, 0, NULL, NULL);

	// Make sure all the command in the command queue has been executed
    ret = clFinish(command_queue);

    bool validate = true;
    for(int j=0; j<size; j++) {
		for(int i=0; i<size; i++) {
			if (C[j*size + i] != C_seq[j*size + i])
				validate = false;
		}
	}

	if (validate == false)
		std::cout << "The results are mismatched !!" << std::endl;

    // Clean up
    ret = clReleaseKernel(kernel);
    ret = clReleaseProgram(program);
    ret = clReleaseMemObject(a_mem_obj);
    ret = clReleaseMemObject(b_mem_obj);
    ret = clReleaseMemObject(c_mem_obj);
    ret = clReleaseCommandQueue(command_queue);
    ret = clReleaseContext(context);

 }

 void perform_mat_mul(int size_of_mat) {
 	// Get platform and device information
    cl_platform_id *platform_id = NULL;
    cl_device_id *device_id = NULL;
    cl_uint ret_num_devices;
    cl_uint ret_num_platforms;
    cl_uint totalDevices;
    cl_int ret;

    printf("Performing Matrix Multiplication for Matirx Size %d*%d\n",size_of_mat,size_of_mat);
    printf("------------------------------------------------------------\n\n");

     // Load the kernel source code into the array source_str
    FILE *fp;
    char *source_str;
    size_t source_size;

    fp = fopen("matrix_mul.cl", "r");
    
    if (!fp) {
        fprintf(stderr, "Failed to load kernel.\n");
        exit(1);
    }
    source_str = (char*)malloc(MAX_SOURCE_SIZE);
    source_size = fread( source_str, 1, MAX_SOURCE_SIZE, fp);
    fclose( fp );

 	 // A, B are input matrix, C is the output matrix for OpenCL, C_seq is the output matrix for reference implementation.
    int *A = new int[size_of_mat*size_of_mat];
    int *B = new int[size_of_mat*size_of_mat];
    int *C = new int[size_of_mat*size_of_mat];
    int *C_seq = new int[size_of_mat*size_of_mat];

    //Initialize matrix
    for(int j=0; j<size_of_mat; j++) {
		for(int i=0; i<size_of_mat; i++) {
			A[j*size_of_mat + i] = 1;
			B[j*size_of_mat + i] = i+1;
			C[j*size_of_mat + i] = 0;
			C_seq[j*size_of_mat + i] = 0;
		}
    }

	std::chrono::high_resolution_clock::time_point t1, t2;
	t1 = std::chrono::high_resolution_clock::now();
    matrix_mul_sequence(A, B, C_seq, size_of_mat);
    t2 = std::chrono::high_resolution_clock::now();
    std::cout << "Reference C matrix multiplication: "
		<< (float)(std::chrono::duration_cast<std::chrono::microseconds>(t2 - t1).count())/1000000
		<< " sec"
		<< std::endl;

    //All Platforms
    clGetPlatformIDs(0, NULL, &ret_num_platforms);
    platform_id = (cl_platform_id*) malloc(sizeof(cl_platform_id) * ret_num_platforms);
    clGetPlatformIDs(ret_num_platforms, platform_id, NULL);

    for (int i = 0; i < ret_num_platforms; i++) {

        //All Devices
        clGetDeviceIDs(platform_id[i], CL_DEVICE_TYPE_ALL, 0, NULL, &totalDevices);
        device_id = (cl_device_id*) malloc(sizeof(cl_device_id) * totalDevices);
        clGetDeviceIDs(platform_id[i], CL_DEVICE_TYPE_ALL, totalDevices, device_id, NULL);

        for (int j = 0; j < totalDevices; j++) {

        	ret = clGetDeviceIDs( platform_id[i], CL_DEVICE_TYPE_GPU, 1, &device_id[j], &ret_num_devices);
        	if(ret == CL_SUCCESS) {
        		perform_mult(device_id[j], source_str, source_size, A, B, C, C_seq, 0, size_of_mat, 8, 0);
        		perform_mult(device_id[j], source_str, source_size, A, B, C, C_seq, 0, size_of_mat, 8, 1);
        		perform_mult(device_id[j], source_str, source_size, A, B, C, C_seq, 0, size_of_mat, 16,1);
        		continue;
        	}
        	ret = clGetDeviceIDs( platform_id[i], CL_DEVICE_TYPE_CPU, 1, &device_id[j], &ret_num_devices);
        	if(ret == CL_SUCCESS) {
        		perform_mult(device_id[j], source_str, source_size, A, B, C, C_seq, 1, size_of_mat, 8, 0);
        		perform_mult(device_id[j], source_str, source_size, A, B, C, C_seq, 1, size_of_mat, 8, 1);
        		perform_mult(device_id[j], source_str, source_size, A, B, C, C_seq, 1, size_of_mat, 16,1);
        	}
        }

    }

 }

int main(void)
{


	perform_mat_mul(512);
	perform_mat_mul(1024);
	perform_mat_mul(2048);

	std::cout << "Press Enter to finish..." << std::endl;
	getchar();
    return 0;
}
