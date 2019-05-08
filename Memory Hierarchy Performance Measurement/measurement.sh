echo "*************************Ravi Bhushan ASU#1214347783*************************"
echo "*************************CSE 520 Computer Architecture – Spring 2019*************************"
echo "        *************************Programming Assignment 1*************************"
echo "*************************Task 1: Memory Hierarchy Performance Measurement*************************"
echo
echo
echo "We will be building the following files"
echo "memory_performance_measurement_clock.c"
echo "code_performance_measurement_perf_gem5.c"
echo "memory_Performance_measurement_perf_gem5.c files."
echo "Please ensure that these files is located in the same folder as this script. Else, next step will throw error."
read -p "Press any key to continue...."
gcc -D _GNU_SOURCE -o measurement memory_performance_measurement_clock.c
gcc -D _GNU_SOURCE -o code_performance code_performance_measurement_perf_gem5.c
gcc -D _GNU_SOURCE -o memory_performance memory_performance_measurement_perf_gem5.c
echo "Generated output files ==>measurement, code_performance and memory_performance in the current folder"
echo "Which tool would you like to use for Memory Hierarchy Performance Measurement?"
echo "1 : clock()"
echo "2 : perf"
read -p "Enter your choice: [1-2]" option

echo "What measurements would you like to perform?"
echo "1 : Write to memory using linear access"
echo "2 : Read from memory using linear access"
echo "3 : Write to memory using random access"
echo "4 : Read from memory using linear access"
read -p "Enter your choice: [1-4]" choice 


if [ "$option" -eq 1 ] && [ "$choice" -eq 1 ]
then
	  	echo "clock write linear"
	  	echo "stride : 1"
		echo "Array Size  Read Time of Single Element"
		echo "----------  ---------------------------"
		./measurement 1 1 1
		./measurement 1 1 2
		./measurement 1 1 4
		./measurement 1 1 8
		./measurement 1 1 16
		./measurement 1 1 32
		./measurement 1 1 64
		./measurement 1 1 128
		./measurement 1 1 256
		./measurement 1 1 512
		./measurement 1 1 1024
		./measurement 1 1 2048
		./measurement 1 1 4096
		./measurement 1 1 8192
		./measurement 1 1 16384
		./measurement 1 1 32768
		./measurement 1 1 65536
		./measurement 1 1 131072
		./measurement 1 1 262144
		./measurement 1 1 524288
		./measurement 1 1 1048576
		./measurement 1 1 2097152
		./measurement 1 1 4194304
		echo "stride : 10"
		echo "Array Size  Read Time of Single Element"
		echo "----------  ---------------------------"
		./measurement 1 10 1
		./measurement 1 10 2
		./measurement 1 10 4
		./measurement 1 10 8
		./measurement 1 10 16
		./measurement 1 10 32
		./measurement 1 10 64
		./measurement 1 10 128
		./measurement 1 10 256
		./measurement 1 10 512
		./measurement 1 10 1024
		./measurement 1 10 2048
		./measurement 1 10 4096
		./measurement 1 10 8192
		./measurement 1 10 16384
		./measurement 1 10 32768
		./measurement 1 10 65536
		./measurement 1 10 131072
		./measurement 1 10 262144
		./measurement 1 10 524288
		./measurement 1 10 1048576
		./measurement 1 10 2097152
		./measurement 1 10 4194304
		echo "stride : 20"
		echo "Array Size  Read Time of Single Element"
		echo "----------  ---------------------------"
		./measurement 1 20 1
		./measurement 1 20 2
		./measurement 1 20 4
		./measurement 1 20 8
		./measurement 1 20 16
		./measurement 1 20 32
		./measurement 1 20 64
		./measurement 1 20 128
		./measurement 1 20 256
		./measurement 1 20 512
		./measurement 1 20 1024
		./measurement 1 20 2048
		./measurement 1 20 4096
		./measurement 1 20 8192
		./measurement 1 20 16384
		./measurement 1 20 32768
		./measurement 1 20 65536
		./measurement 1 20 131072
		./measurement 1 20 262144
		./measurement 1 20 524288
		./measurement 1 20 1048576
		./measurement 1 20 2097152
		./measurement 1 20 4194304
fi
if [ "$option" -eq 1 ] && [ "$choice" -eq 2 ]
then
	  echo "clock read linear"
echo "stride : 1"
		echo "Array Size  Read Time of Single Element"
		echo "----------  ---------------------------"
		./measurement 2 1 1
		./measurement 2 1 2
		./measurement 2 1 4
		./measurement 2 1 8
		./measurement 2 1 16
		./measurement 2 1 32
		./measurement 2 1 64
		./measurement 2 1 128
		./measurement 2 1 256
		./measurement 2 1 512
		./measurement 2 1 1024
		./measurement 2 1 2048
		./measurement 2 1 4096
		./measurement 2 1 8192
		./measurement 2 1 16384
		./measurement 2 1 32768
		./measurement 2 1 65536
		./measurement 2 1 131072
		./measurement 2 1 262144
		./measurement 2 1 524288
		./measurement 2 1 1048576
		./measurement 2 1 2097152
		./measurement 2 1 4194304
		echo "stride : 10"
		echo "Array Size  Read Time of Single Element"
		echo "----------  ---------------------------"
		./measurement 2 10 1
		./measurement 2 10 2
		./measurement 2 10 4
		./measurement 2 10 8
		./measurement 2 10 16
		./measurement 2 10 32
		./measurement 2 10 64
		./measurement 2 10 128
		./measurement 2 10 256
		./measurement 2 10 512
		./measurement 2 10 1024
		./measurement 2 10 2048
		./measurement 2 10 4096
		./measurement 2 10 8192
		./measurement 2 10 16384
		./measurement 2 10 32768
		./measurement 2 10 65536
		./measurement 2 10 131072
		./measurement 2 10 262144
		./measurement 2 10 524288
		./measurement 2 10 1048576
		./measurement 2 10 2097152
		./measurement 2 10 4194304
		echo "stride : 20"
		echo "Array Size  Read Time of Single Element"
		echo "----------  ---------------------------"
		./measurement 2 20 1
		./measurement 2 20 2
		./measurement 2 20 4
		./measurement 2 20 8
		./measurement 2 20 16
		./measurement 2 20 32
		./measurement 2 20 64
		./measurement 2 20 128
		./measurement 2 20 256
		./measurement 2 20 512
		./measurement 2 20 1024
		./measurement 2 20 2048
		./measurement 2 20 4096
		./measurement 2 20 8192
		./measurement 2 20 16384
		./measurement 2 20 32768
		./measurement 2 20 65536
		./measurement 2 20 131072
		./measurement 2 20 262144
		./measurement 2 20 524288
		./measurement 2 20 1048576
		./measurement 2 20 2097152
		./measurement 2 20 4194304
fi
if [ "$option" -eq 1 ] && [ "$choice" -eq 3 ]
then
	  echo "clock write random"
	  echo "Array Size  Read Time of Single Element"
	  echo "----------  ---------------------------"
	  	./measurement 3 1
		./measurement 3 2
		./measurement 3 4
		./measurement 3 8
		./measurement 3 16
		./measurement 3 32
		./measurement 3 64
		./measurement 3 128
		./measurement 3 256
		./measurement 3 512
		./measurement 3 1024
		./measurement 3 2048
		./measurement 3 4096
		./measurement 3 8192
		./measurement 3 16384
		./measurement 3 32768
		./measurement 3 65536
		./measurement 3 131072
		./measurement 3 262144
		./measurement 3 524288
		./measurement 3 1048576
		./measurement 3 2097152
		./measurement 3 4194304
fi
if [ "$option" -eq 1 ] && [ "$choice" -eq 4 ]
then
	  echo "clock read random"
	  echo "Array Size  Read Time of Single Element"
	  echo "----------  ---------------------------"
	  	./measurement 4 1
		./measurement 4 2
		./measurement 4 4
		./measurement 4 8
		./measurement 4 16
		./measurement 4 32
		./measurement 4 64
		./measurement 4 128
		./measurement 4 256
		./measurement 4 512
		./measurement 4 1024
		./measurement 4 2048
		./measurement 4 4096
		./measurement 4 8192
		./measurement 4 16384
		./measurement 4 32768
		./measurement 4 65536
		./measurement 4 131072
		./measurement 4 262144
		./measurement 4 524288
		./measurement 4 1048576
		./measurement 4 2097152
		./measurement 4 4194304
		./measurement 4 8388608
fi
if [ "$option" -eq 2 ] && [ "$choice" -eq 1 ]
then
	  echo "perf write linear stride 1"
	  echo "code performance"
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 1
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 2
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 4
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 8
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 16
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 32
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 64
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 128
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 256
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 512
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 1024
	  perf stat -r 100000 -o perf_output --append  code_performance 1 1 2048
	  perf stat -r 100 -o perf_output --append  code_performance 1 1 4096
	  perf stat -r 100 -o perf_output --append  code_performance 1 1 8192
	  perf stat -r 100 -o perf_output --append  code_performance 1 1 16384
	  perf stat -r 100 -o perf_output --append  code_performance 1 1 32768
	  perf stat -r 100 -o perf_output --append  code_performance 1 1 65536
	  perf stat -r 100 -o perf_output --append  code_performance 1 1 131072
	  perf stat -r 10 -o perf_output --append  code_performance 1 1 262144
	  perf stat -r 10 -o perf_output --append  code_performance 1 1 524288
	  perf stat -r 10 -o perf_output --append  code_performance 1 1 1048576
	  perf stat -r 10 -o perf_output --append  code_performance 1 1 2097152
	  perf stat -r 10 -o perf_output --append  code_performance 1 1 4194304
	  echo "memory performance"
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 1
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 2
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 4
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 8
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 16
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 32
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 64
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 128
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 256
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 512
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 1024
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 1 2048
	  perf stat -r 100 -o perf_output --append  memory_performance 1 1 4096
	  perf stat -r 100 -o perf_output --append  memory_performance 1 1 8192
	  perf stat -r 100 -o perf_output --append  memory_performance 1 1 16384
	  perf stat -r 100 -o perf_output --append  memory_performance 1 1 32768
	  perf stat -r 100 -o perf_output --append  memory_performance 1 1 65536
	  perf stat -r 100 -o perf_output --append  memory_performance 1 1 131072
	  perf stat -r 10 -o perf_output --append  memory_performance 1 1 262144
	  perf stat -r 10 -o perf_output --append  memory_performance 1 1 524288
	  perf stat -r 10 -o perf_output --append  memory_performance 1 1 1048576
	  perf stat -r 10 -o perf_output --append  memory_performance 1 1 2097152
	  perf stat -r 10 -o perf_output --append  memory_performance 1 1 4194304

	  echo "perf write linear stride 10"
	  echo "code performance"
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 1
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 2
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 4
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 8
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 16
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 32
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 64
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 128
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 256
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 512
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 1024
	  perf stat -r 100000 -o perf_output --append  code_performance 1 10 2048
	  perf stat -r 100 -o perf_output --append  code_performance 1 10 4096
	  perf stat -r 100 -o perf_output --append  code_performance 1 10 8192
	  perf stat -r 100 -o perf_output --append  code_performance 1 10 16384
	  perf stat -r 100 -o perf_output --append  code_performance 1 10 32768
	  perf stat -r 100 -o perf_output --append  code_performance 1 10 65536
	  perf stat -r 100 -o perf_output --append  code_performance 1 10 131072
	  perf stat -r 10 -o perf_output --append  code_performance 1 10 262144
	  perf stat -r 10 -o perf_output --append  code_performance 1 10 524288
	  perf stat -r 10 -o perf_output --append  code_performance 1 10 1048576
	  perf stat -r 10 -o perf_output --append  code_performance 1 10 2097152
	  perf stat -r 10 -o perf_output --append  code_performance 1 10 4194304
	  echo "memory performance"
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 1
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 2
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 4
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 8
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 16
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 32
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 64
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 128
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 256
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 512
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 1024
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 10 2048
	  perf stat -r 100 -o perf_output --append  memory_performance 1 10 4096
	  perf stat -r 100 -o perf_output --append  memory_performance 1 10 8192
	  perf stat -r 100 -o perf_output --append  memory_performance 1 10 16384
	  perf stat -r 100 -o perf_output --append  memory_performance 1 10 32768
	  perf stat -r 100 -o perf_output --append  memory_performance 1 10 65536
	  perf stat -r 100 -o perf_output --append  memory_performance 1 10 131072
	  perf stat -r 10 -o perf_output --append  memory_performance 1 10 262144
	  perf stat -r 10 -o perf_output --append  memory_performance 1 10 524288
	  perf stat -r 10 -o perf_output --append  memory_performance 1 10 1048576
	  perf stat -r 10 -o perf_output --append  memory_performance 1 10 2097152
	  perf stat -r 10 -o perf_output --append  memory_performance 1 10 4194304

	  echo "perf write linear stride 20"
	  echo "code performance"
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 1
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 2
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 4
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 8
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 16
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 32
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 64
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 128
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 256
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 512
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 1024
	  perf stat -r 100000 -o perf_output --append  code_performance 1 20 2048
	  perf stat -r 100 -o perf_output --append  code_performance 1 20 4096
	  perf stat -r 100 -o perf_output --append  code_performance 1 20 8192
	  perf stat -r 100 -o perf_output --append  code_performance 1 20 16384
	  perf stat -r 100 -o perf_output --append  code_performance 1 20 32768
	  perf stat -r 100 -o perf_output --append  code_performance 1 20 65536
	  perf stat -r 100 -o perf_output --append  code_performance 1 20 131072
	  perf stat -r 10 -o perf_output --append  code_performance 1 20 262144
	  perf stat -r 10 -o perf_output --append  code_performance 1 20 524288
	  perf stat -r 10 -o perf_output --append  code_performance 1 20 1048576
	  perf stat -r 10 -o perf_output --append  code_performance 1 20 2097152
	  perf stat -r 10 -o perf_output --append  code_performance 1 20 4194304
	  echo "memory performance"
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 1
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 2
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 4
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 8
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 16
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 32
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 64
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 128
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 256
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 512
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 1024
	  perf stat -r 100000 -o perf_output --append  memory_performance 1 20 2048
	  perf stat -r 100 -o perf_output --append  memory_performance 1 20 4096
	  perf stat -r 100 -o perf_output --append  memory_performance 1 20 8192
	  perf stat -r 100 -o perf_output --append  memory_performance 1 20 16384
	  perf stat -r 100 -o perf_output --append  memory_performance 1 20 32768
	  perf stat -r 100 -o perf_output --append  memory_performance 1 20 65536
	  perf stat -r 100 -o perf_output --append  memory_performance 1 20 131072
	  perf stat -r 10 -o perf_output --append  memory_performance 1 20 262144
	  perf stat -r 10 -o perf_output --append  memory_performance 1 20 524288
	  perf stat -r 10 -o perf_output --append  memory_performance 1 20 1048576
	  perf stat -r 10 -o perf_output --append  memory_performance 1 20 2097152
	  perf stat -r 10 -o perf_output --append  memory_performance 1 20 4194304
fi
if [ "$option" -eq 2 ] && [ "$choice" -eq 2 ]
then
	  echo "perf read linear stride 1"
	  echo "code performance"
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 1
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 2
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 4
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 8
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 16
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 32
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 64
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 128
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 256
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 512
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 1024
	  perf stat -r 100000 -o perf_output --append  code_performance 2 1 2048
	  perf stat -r 100 -o perf_output --append  code_performance 2 1 4096
	  perf stat -r 100 -o perf_output --append  code_performance 2 1 8192
	  perf stat -r 100 -o perf_output --append  code_performance 2 1 16384
	  perf stat -r 100 -o perf_output --append  code_performance 2 1 32768
	  perf stat -r 100 -o perf_output --append  code_performance 2 1 65536
	  perf stat -r 100 -o perf_output --append  code_performance 2 1 131072
	  perf stat -r 10 -o perf_output --append  code_performance 2 1 262144
	  perf stat -r 10 -o perf_output --append  code_performance 2 1 524288
	  perf stat -r 10 -o perf_output --append  code_performance 2 1 1048576
	  perf stat -r 10 -o perf_output --append  code_performance 2 1 2097152
	  perf stat -r 10 -o perf_output --append  code_performance 2 1 4194304
	  echo "memory performance"
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 1
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 2
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 4
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 8
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 16
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 32
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 64
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 128
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 256
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 512
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 1024
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 1 2048
	  perf stat -r 100 -o perf_output --append  memory_performance 2 1 4096
	  perf stat -r 100 -o perf_output --append  memory_performance 2 1 8192
	  perf stat -r 100 -o perf_output --append  memory_performance 2 1 16384
	  perf stat -r 100 -o perf_output --append  memory_performance 2 1 32768
	  perf stat -r 100 -o perf_output --append  memory_performance 2 1 65536
	  perf stat -r 100 -o perf_output --append  memory_performance 2 1 131072
	  perf stat -r 10 -o perf_output --append  memory_performance 2 1 262144
	  perf stat -r 10 -o perf_output --append  memory_performance 2 1 524288
	  perf stat -r 10 -o perf_output --append  memory_performance 2 1 1048576
	  perf stat -r 10 -o perf_output --append  memory_performance 2 1 2097152
	  perf stat -r 10 -o perf_output --append  memory_performance 2 1 4194304

	  echo "perf read linear stride 10"
	  echo "code performance"
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 1
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 2
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 4
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 8
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 16
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 32
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 64
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 128
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 256
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 512
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 1024
	  perf stat -r 100000 -o perf_output --append  code_performance 2 10 2048
	  perf stat -r 100 -o perf_output --append  code_performance 2 10 4096
	  perf stat -r 100 -o perf_output --append  code_performance 2 10 8192
	  perf stat -r 100 -o perf_output --append  code_performance 2 10 16384
	  perf stat -r 100 -o perf_output --append  code_performance 2 10 32768
	  perf stat -r 100 -o perf_output --append  code_performance 2 10 65536
	  perf stat -r 100 -o perf_output --append  code_performance 2 10 131072
	  perf stat -r 10 -o perf_output --append  code_performance 2 10 262144
	  perf stat -r 10 -o perf_output --append  code_performance 2 10 524288
	  perf stat -r 10 -o perf_output --append  code_performance 2 10 1048576
	  perf stat -r 10 -o perf_output --append  code_performance 2 10 2097152
	  perf stat -r 10 -o perf_output --append  code_performance 2 10 4194304
	  echo "memory performance"
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 1
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 2
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 4
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 8
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 16
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 32
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 64
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 128
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 256
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 512
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 1024
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 10 2048
	  perf stat -r 100 -o perf_output --append  memory_performance 2 10 4096
	  perf stat -r 100 -o perf_output --append  memory_performance 2 10 8192
	  perf stat -r 100 -o perf_output --append  memory_performance 2 10 16384
	  perf stat -r 100 -o perf_output --append  memory_performance 2 10 32768
	  perf stat -r 100 -o perf_output --append  memory_performance 2 10 65536
	  perf stat -r 100 -o perf_output --append  memory_performance 2 10 131072
	  perf stat -r 10 -o perf_output --append  memory_performance 2 10 262144
	  perf stat -r 10 -o perf_output --append  memory_performance 2 10 524288
	  perf stat -r 10 -o perf_output --append  memory_performance 2 10 1048576
	  perf stat -r 10 -o perf_output --append  memory_performance 2 10 2097152
	  perf stat -r 10 -o perf_output --append  memory_performance 2 10 4194304

	  echo "perf read linear stride 20"
	  echo "code performance"
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 1
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 2
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 4
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 8
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 16
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 32
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 64
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 128
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 256
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 512
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 1024
	  perf stat -r 100000 -o perf_output --append  code_performance 2 20 2048
	  perf stat -r 100 -o perf_output --append  code_performance 2 20 4096
	  perf stat -r 100 -o perf_output --append  code_performance 2 20 8192
	  perf stat -r 100 -o perf_output --append  code_performance 2 20 16384
	  perf stat -r 100 -o perf_output --append  code_performance 2 20 32768
	  perf stat -r 100 -o perf_output --append  code_performance 2 20 65536
	  perf stat -r 100 -o perf_output --append  code_performance 2 20 131072
	  perf stat -r 10 -o perf_output --append  code_performance 2 20 262144
	  perf stat -r 10 -o perf_output --append  code_performance 2 20 524288
	  perf stat -r 10 -o perf_output --append  code_performance 2 20 1048576
	  perf stat -r 10 -o perf_output --append  code_performance 2 20 2097152
	  perf stat -r 10 -o perf_output --append  code_performance 2 20 4194304
	  echo "memory performance"
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 1
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 2
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 4
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 8
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 16
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 32
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 64
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 128
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 256
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 512
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 1024
	  perf stat -r 100000 -o perf_output --append  memory_performance 2 20 2048
	  perf stat -r 100 -o perf_output --append  memory_performance 2 20 4096
	  perf stat -r 100 -o perf_output --append  memory_performance 2 20 8192
	  perf stat -r 100 -o perf_output --append  memory_performance 2 20 16384
	  perf stat -r 100 -o perf_output --append  memory_performance 2 20 32768
	  perf stat -r 100 -o perf_output --append  memory_performance 2 20 65536
	  perf stat -r 100 -o perf_output --append  memory_performance 2 20 131072
	  perf stat -r 10 -o perf_output --append  memory_performance 2 20 262144
	  perf stat -r 10 -o perf_output --append  memory_performance 2 20 524288
	  perf stat -r 10 -o perf_output --append  memory_performance 2 20 1048576
	  perf stat -r 10 -o perf_output --append  memory_performance 2 20 2097152
	  perf stat -r 10 -o perf_output --append  memory_performance 2 20 4194304
fi
if [ "$option" -eq 2 ] && [ "$choice" -eq 3 ]
then
	  echo "perf write random"
	   echo "code performance"
	  perf stat -r 100000 -o perf_output --append  code_performance 3 1
	  perf stat -r 100000 -o perf_output --append  code_performance 3 2
	  perf stat -r 100000 -o perf_output --append  code_performance 3 4
	  perf stat -r 100000 -o perf_output --append  code_performance 3 8
	  perf stat -r 100000 -o perf_output --append  code_performance 3 16
	  perf stat -r 100000 -o perf_output --append  code_performance 3 32
	  perf stat -r 100000 -o perf_output --append  code_performance 3 64
	  perf stat -r 100000 -o perf_output --append  code_performance 3 128
	  perf stat -r 100000 -o perf_output --append  code_performance 3 256
	  perf stat -r 100000 -o perf_output --append  code_performance 3 512
	  perf stat -r 100000 -o perf_output --append  code_performance 3 1024
	  perf stat -r 100000 -o perf_output --append  code_performance 3 2048
	  perf stat -r 100 -o perf_output --append  code_performance 3 4096
	  perf stat -r 100 -o perf_output --append  code_performance 3 8192
	  perf stat -r 100 -o perf_output --append  code_performance 3 16384
	  perf stat -r 100 -o perf_output --append  code_performance 3 32768
	  perf stat -r 100 -o perf_output --append  code_performance 3 65536
	  perf stat -r 100 -o perf_output --append  code_performance 3 131072
	  perf stat -r 10 -o perf_output --append  code_performance 3 262144
	  perf stat -r 10 -o perf_output --append  code_performance 3 524288
	  perf stat -r 10 -o perf_output --append  code_performance 3 1048576
	  perf stat -r 10 -o perf_output --append  code_performance 3 2097152
	  perf stat -r 10 -o perf_output --append  code_performance 3 4194304
	  echo "memory performance"
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 1
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 2
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 4
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 8
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 16
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 32
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 64
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 128
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 256
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 512
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 1024
	  perf stat -r 100000 -o perf_output --append  memory_performance 3 2048
	  perf stat -r 100 -o perf_output --append  memory_performance 3 4096
	  perf stat -r 100 -o perf_output --append  memory_performance 3 8192
	  perf stat -r 100 -o perf_output --append  memory_performance 3 16384
	  perf stat -r 100 -o perf_output --append  memory_performance 3 32768
	  perf stat -r 100 -o perf_output --append  memory_performance 3 65536
	  perf stat -r 100 -o perf_output --append  memory_performance 3 131072
	  perf stat -r 10 -o perf_output --append  memory_performance 3 262144
	  perf stat -r 10 -o perf_output --append  memory_performance 3 524288
	  perf stat -r 10 -o perf_output --append  memory_performance 3 1048576
	  perf stat -r 10 -o perf_output --append  memory_performance 3 2097152
	  perf stat -r 10 -o perf_output --append  memory_performance 3 4194304

fi
if [ "$option" -eq 2 ] && [ "$choice" -eq 4 ]
then
	  echo "perf read random"
	   echo "code performance"
	  perf stat -r 100000 -o perf_output --append  code_performance 4 1
	  perf stat -r 100000 -o perf_output --append  code_performance 4 2
	  perf stat -r 100000 -o perf_output --append  code_performance 4 4
	  perf stat -r 100000 -o perf_output --append  code_performance 4 8
	  perf stat -r 100000 -o perf_output --append  code_performance 4 16
	  perf stat -r 100000 -o perf_output --append  code_performance 4 32
	  perf stat -r 100000 -o perf_output --append  code_performance 4 64
	  perf stat -r 100000 -o perf_output --append  code_performance 4 128
	  perf stat -r 100000 -o perf_output --append  code_performance 4 256
	  perf stat -r 100000 -o perf_output --append  code_performance 4 512
	  perf stat -r 100000 -o perf_output --append  code_performance 4 1024
	  perf stat -r 100000 -o perf_output --append  code_performance 4 2048
	  perf stat -r 100 -o perf_output --append  code_performance 4 4096
	  perf stat -r 100 -o perf_output --append  code_performance 4 8192
	  perf stat -r 100 -o perf_output --append  code_performance 4 16384
	  perf stat -r 100 -o perf_output --append  code_performance 4 32768
	  perf stat -r 100 -o perf_output --append  code_performance 4 65536
	  perf stat -r 100 -o perf_output --append  code_performance 4 131072
	  perf stat -r 10 -o perf_output --append  code_performance 4 262144
	  perf stat -r 10 -o perf_output --append  code_performance 4 524288
	  perf stat -r 10 -o perf_output --append  code_performance 4 1048576
	  perf stat -r 10 -o perf_output --append  code_performance 4 2097152
	  perf stat -r 10 -o perf_output --append  code_performance 4 4194304
	  echo "memory performance"
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 1
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 2
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 4
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 8
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 16
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 32
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 64
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 128
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 256
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 512
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 1024
	  perf stat -r 100000 -o perf_output --append  memory_performance 4 2048
	  perf stat -r 100 -o perf_output --append  memory_performance 4 4096
	  perf stat -r 100 -o perf_output --append  memory_performance 4 8192
	  perf stat -r 100 -o perf_output --append  memory_performance 4 16384
	  perf stat -r 100 -o perf_output --append  memory_performance 4 32768
	  perf stat -r 100 -o perf_output --append  memory_performance 4 65536
	  perf stat -r 100 -o perf_output --append  memory_performance 4 131072
	  perf stat -r 10 -o perf_output --append  memory_performance 4 262144
	  perf stat -r 10 -o perf_output --append  memory_performance 4 524288
	  perf stat -r 10 -o perf_output --append  memory_performance 4 1048576
	  perf stat -r 10 -o perf_output --append  memory_performance 4 2097152
	  perf stat -r 10 -o perf_output --append  memory_performance 4 4194304

fi 