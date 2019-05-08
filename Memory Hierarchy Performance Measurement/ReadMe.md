CSE 520 Computer Architecture – Spring 2019
Ravi Bhushan ASU#1214347783

Task 1: Memory Hierarchy Performance Measurement
------------------------------------------------
Required Files:
measurement.sh
memory_performance_measurement_clock.c
code_performance_measurement_perf_gem5.c
memory_Performance_measurement_perf_gem5.c

Steps to perform the measurements
---------------------------------
1- Copy measurement.sh, memory_performance_measurement_clock.c, code_performance_measurement_perf_gem5.c and memory_Performance_measurement_perf_gem5.c to a single folder.

2- Run measurement.sh using the below command:
./measurement.sh
Note: If there is an error saying Permission denied while executing the shell file, then type the following command:
chmod +x measurement.sh

3- Press Any Key to continue

4- Script will ask the tool which you would like to use for measurement.
Enter 1 for clock() and 2 for perf

5- Script will then ask what measurement would you like to perform.
You have the following options:
1 : Write to memory using linear access
2 : Read from memory using linear access
3 : Write to memory using random access
4 : Read from memory using linear access

6- For clock 
When option 1 entered the console will display the following:
clock write linear
stride : 1
Array Size  Read Time of Single Element
----------  ---------------------------
1		7.8200000000 
2		5.2400000000 
4		5.8375000000 
8		5.3362500000 
16		5.9893750000 
...............................

It is displaying the access time of a single element of a particular array size in microseconds.
This, it will display for stride 10 and stride 20 also. For chart please refer the report.

When option 2 is entered, it will display the read linear access time for a single element.

When option 3 is entered, it will display dynamic write access time for each element in the array.

When option 4 is entered, it will display dynamic read access time for each element in the array.

7 perf tool was giving erronous results.

Task 2: Gem5 Simulator
----------------------
Required Files:
measurement_gem5.sh
code_performance_measurement_perf_gem5.c
memory_Performance_measurement_perf_gem5.c

Steps to perform the measurements
---------------------------------
1- Copy measurement_gem5.sh, code_performance_measurement_perf_gem5.c and memory_Performance_measurement_perf_gem5.c to gem5 folder.
Note that this script will not run unless you put it inside gem5 folder.
2- Run measurement_gem5.sh using the below command:
./measurement_gem5.sh
Note: If there is an error saying Permission denied while executing the shell file, then type the following command:
chmod +x measurement_gem5.sh
3- Press Any Key to continue

4- Script will ask what measurement would you like to perform.
You have the following options:
1 : Write to memory using linear access
2 : Read from memory using linear access
3 : Write to memory using random access
4 : Read from memory using linear access

5- On selecting any of the mesurements. Gem5 simulator will start executing for different array sizes.
Now, in the console, the simulator will display the following message:

command line: ./build/X86/gem5.opt --outdir=./tests ./configs/example/se.py --cpu-clock=1GHz --cpu-type=DerivO3CPU --caches --l1i_size=32kB --l1i_assoc=2 --l1d_size=64kB --l1d_assoc=4 --l2cache --l2_size=256kB --l2_assoc=16 -c code_performance '--options=2 1 2048'

Global frequency set at 1000000000000 ticks per second
warn: DRAM device capacity (8192 Mbytes) does not match the address range assigned (512 Mbytes)
0: system.remote_gdb: listening for remote gdb on port 7003
**** REAL SIMULATION ****
info: Entering event queue @ 0.  Starting simulation...
warn: ignoring syscall access(...)
warn: ignoring syscall access(...)
warn: ignoring syscall access(...)
warn: ignoring syscall mprotect(...)
warn: ignoring syscall mprotect(...)
warn: ignoring syscall mprotect(...)
warn: ignoring syscall mprotect(...)
Exiting @ tick 609501000 because exiting with last active thread context

.................
........................

command line: ./build/X86/gem5.opt --outdir=./tests ./configs/example/se.py --cpu-clock=1GHz --cpu-type=DerivO3CPU --caches --l1i_size=32kB --l1i_assoc=2 --l1d_size=64kB --l1d_assoc=4 --l2cache --l2_size=256kB --l2_assoc=16 -c memory_performance '--options=2 1 2048'

Global frequency set at 1000000000000 ticks per second
warn: DRAM device capacity (8192 Mbytes) does not match the address range assigned (512 Mbytes)
0: system.remote_gdb: listening for remote gdb on port 7001
**** REAL SIMULATION ****
info: Entering event queue @ 0.  Starting simulation...
warn: ignoring syscall access(...)
warn: ignoring syscall access(...)
warn: ignoring syscall access(...)
warn: ignoring syscall mprotect(...)
warn: ignoring syscall mprotect(...)
warn: ignoring syscall mprotect(...)
warn: ignoring syscall mprotect(...)
Exiting @ tick 610465000 because exiting with last active thread context

Note that the first log is of code_performance and second log is of memory_performance. When we subtract the second tick(610465000) from the first(609501000) we will get the number of ticks required to access the array of size 2048. This tick can be divided by the Global frequency and then size of array to get the access time of a single element.


