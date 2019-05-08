#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sched.h>
#include <time.h>

struct data {
	double data;
	double random_access_enables;
	double dummy[5];
	struct data * next;
};

struct data * data_array, *temp_data;
int index1,index2,rand_index,result,array_size,measure,stride,elements_accessed;
double read_data;
double read_time;
long start, stop;

void write_linear() {
	
	data_array = (struct data *)malloc (array_size * sizeof(struct data));
	
	for(index2=0;index2<array_size;index2+=stride) {
		//data_array[index2].data = (double)index2+1;
	}
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

	for(index2=0;index2<array_size;index2+=stride) {
		//read_data = data_array[index2].data;
	}
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

	temp_data = &(data_array[0]);
	index1 = 0;
	while (temp_data != NULL) {
		//temp_data->data = index1;
		index1++;
		temp_data = temp_data->next;
	}
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

	temp_data = &(data_array[0]);
	while (temp_data != NULL) {
		//printf("data is %.0f\n",temp_data->data);
		//read_data = temp_data->data;
		temp_data = temp_data->next;
	}
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
