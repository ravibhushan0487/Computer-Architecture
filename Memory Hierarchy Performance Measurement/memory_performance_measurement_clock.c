#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sched.h>
#include <time.h>

int test_iteration = 100;

struct data {
	double data;
	double random_access_enables;
	double dummy[5];
	struct data * next;
};

struct data * data_array, *temp_data;
int index1,index2,rand_index,result,array_size,measure,stride,elements_accessed;
double read_data;
double for_iter_time,read_time,write_time;
long start, stop;

void write_linear() {
	
	data_array = (struct data *)malloc (array_size * sizeof(struct data));
	
	//Calculate Write Time
	start = clock();
	for(index1=0;index1<test_iteration;index1++) {
		for(index2=0;index2<array_size;index2+=stride) {
			data_array[index2].data = (double)index2+1;
		}
	}
	stop = clock();

	//CLOCKS_PER_SEC = 1000000
	read_time = (double)(stop - start)*(1000000000/CLOCKS_PER_SEC);
	elements_accessed = array_size/stride;
	if(elements_accessed == 0)
		elements_accessed = 1;
	read_time = read_time/(elements_accessed*test_iteration);
	printf("%d\t\t%.10f \n",array_size,read_time);
}

void read_linear() {
	
	//Populate Array
	data_array = (struct data *)malloc (array_size * sizeof(struct data));
	for(index1=0;index1<array_size;index1++) {
		data_array[index1].data = (double)index1+1;
		data_array[index1].random_access_enables = 0.0;
	}
	
	//Populate Cache
	for(index2=0;index2<array_size;index2++) {
		read_data = data_array[index2].data;
	}

	//Calculate Read Time
	start = clock();
	for(index1=0;index1<test_iteration;index1++) {
		for(index2=0;index2<array_size;index2+=stride) {
			read_data = data_array[index2].data;
		}
	}
	stop = clock();

	//CLOCKS_PER_SEC = 1000000
	read_time = (double)(stop - start)*(1000000000/CLOCKS_PER_SEC);
	elements_accessed = array_size/stride;
	if(elements_accessed == 0)
		elements_accessed = 1;
	read_time = read_time/(elements_accessed*test_iteration);
	printf("%d\t\t%.10f \n",array_size,read_time);
}

void write_random() {

	data_array = (struct data *)malloc (array_size * sizeof(struct data));

	//Populate pointer to next element for random access
	temp_data = &(data_array[0]);
	temp_data->random_access_enables = 1.0;
	index1 = 0;
	while(temp_data->next == NULL) {
		
		if((array_size - index1) == 1) {
			temp_data->next = NULL;
			break;
		}

		rand_index = rand()%array_size;

		while(data_array[rand_index].random_access_enables == 1.0) {
			rand_index = rand()%array_size;
		}
		//printf("random index %d\n",rand_index);
		data_array[rand_index].random_access_enables = 1.0;
		
		temp_data->next = &(data_array[rand_index]);
		
		temp_data = temp_data->next;
		index1++;
	}

	//Calculate Write Time
	start = clock();
	for(index2=0;index2<test_iteration;index2++) {
		temp_data = &(data_array[0]);
		index1 = 0;
		while (temp_data != NULL) {
			//printf("data is %.0f\n",temp_data->data);
			temp_data->data = index1;
			index1++;
			temp_data = temp_data->next;
		}
	}
	stop = clock();
	//CLOCKS_PER_SEC = 1000000
	read_time = (double)(stop - start)*(1000000000/CLOCKS_PER_SEC);
	read_time = read_time/(array_size*test_iteration);
	printf(" %d\t\t%.10f \n",array_size,read_time);
	
}

void read_random() {

	//Populate Array
	data_array = (struct data *)malloc (array_size * sizeof(struct data));
	for(index1=0;index1<array_size;index1++) {
		data_array[index1].data = (double)index1+1;
		data_array[index1].random_access_enables = 0.0;
	}
	
	//Populate pointer to next element for random access
	temp_data = &(data_array[0]);
	temp_data->random_access_enables = 1.0;
	index1 = 0;
	while(temp_data->next == NULL) {
		
		if((array_size - index1) == 1) {
			temp_data->next = NULL;
			break;
		}

		rand_index = rand()%array_size;

		while(data_array[rand_index].random_access_enables == 1.0) {
			rand_index = rand()%array_size;
		}
		//printf("random index %d\n",rand_index);
		data_array[rand_index].random_access_enables = 1.0;
		
		temp_data->next = &(data_array[rand_index]);
		
		temp_data = temp_data->next;
		index1++;
	}

	//Populate Cache
	temp_data = &(data_array[0]);
	while (temp_data != NULL) {
		//printf("data is %.0f\n",temp_data->data);
		read_data = temp_data->data;
		temp_data = temp_data->next;
	}

	//Calculate Read Time
	start = clock();
	for(index1=0; index1<test_iteration; index1++) {
		temp_data = &(data_array[0]);
		while (temp_data != NULL) {
			//printf("data is %.0f\n",temp_data->data);
			read_data = temp_data->data;
			temp_data = temp_data->next;
		}
	}
	stop = clock();
	//CLOCKS_PER_SEC = 1000000
	read_time = (double)(stop - start)*(1000000000/CLOCKS_PER_SEC);
	read_time = read_time/(array_size*test_iteration);
	printf(" %d\t\t%.10f \n",array_size,read_time);

}

int main(int argc,char* argv[])
{

	srand(time(0));

	//CPU Affinity to one CPU
	cpu_set_t  mask;
	CPU_ZERO(&mask);
	CPU_SET(0, &mask);
	result = sched_setaffinity(0, sizeof(mask), &mask);
 	
 	//What Measurement
 	measure = atoi(argv[1]);

 	//Array Size input during runtime
 	if (argc == 4)
 		array_size = atoi(argv[3]);
 	else
 		array_size = atoi(argv[2]);

 	if(array_size < 16384) {
 		test_iteration = test_iteration*1000;
 	}
 	if(array_size > 2097152) {
 		test_iteration = test_iteration/10;
 	}

 	//Stride
 	if (argc == 4) {
 		stride = atoi(argv[2]);
 	}

 	if(measure == 1) 
 		write_linear();
 	else if(measure == 2)
 		read_linear();
 	else if(measure ==3)
 		write_random();
 	else if (measure == 4)
 		read_random();

	return 0;
}
