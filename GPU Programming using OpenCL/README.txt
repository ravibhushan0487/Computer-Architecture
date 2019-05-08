Assignment Objective:
---------------------
Execute matrix multiplication on different devices (CPU or GPU) using an OpenCL program. The goal of this assignment is to compare the performance of single thread execution with multi-thread execution as well as to experience OpenCL programming framework.
Requirements:
We need to measure the execution time on following configurations:
● Matrix size: 512x512, 1024x1024, 2048x2048
● Reference C/C++ matrix multiplication.
● OpenCL naive matrix multiplication on CPU
● OpenCL naive matrix multiplication on GPU
● OpenCL tiled matrix multiplication on CPU (tile size = 8 and 16)
● OpenCL tiled matrix multiplication on GPU(tile size = 8 and 16)

Environment:
------------
All measured execution time were reported from PC systems with Linux OS. OpenCL SDK/driver was installed on Linux systems.

Steps to Execute the Program:
1. Please install Intel SDK OpenCL/System Studio on the machine where the program is to run
2. Type the following commands in the terminal to build main.cpp:
	g++ -std=c++11 -w -o main main.cpp -lOpenCL
3. To run the program type the following commands:
	./main
4. Output screenshot is included in Report.pdf
