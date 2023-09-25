#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include "p3200155-p3200156-res.h"
#include <math.h>


pthread_mutex_t theater, prints, sums, tels, cashs;
pthread_cond_t cond, cond1;
int seats [NUM_ZONE_A + NUM_ZONE_B][NUM_SEAT];
int n_tel = NUM_TEL; 	//diathesimoi tilefwnites
int n_cash = NUM_CASH;	//diathesimoi tamies
unsigned int seed;
int income = 0;
double sum_for_success = 0;
double sum_for_uns_seats = 0;
double sum_for_uns_payment = 0;
int c_a = 0;
long xronos_anamonis = 0;
long xronos_eksypiretisis = 0;

void elegxos(int rc)
{	
	if (rc != 0) 
	{
		printf("ERROR: return code is %d\n", rc);
		exit(-1);
	}
}

typedef struct customers
{
	int id, row, initial, final, zone, cost;
} CUSTOMERS ;

CUSTOMERS* customers_array; //for the final prints

double random_number(int x, int y, int id)
{
	unsigned int seed1 = seed + id;
	int random = rand_r(&seed1);
	
	if (x == 0 && y == 1)
	{
		return random*1.0f / RAND_MAX;
	}
	else 
	{
		return random%(y-x+1)+x;	
	}
}

void cashier(void * customer1, int rc, struct timespec * start_eksypiretisi, struct timespec * stop_eksypiretisi)
{
	struct timespec  start_anamoni, stop_anamoni;
	clock_gettime(CLOCK_REALTIME, &start_anamoni); 
	
	/*	for cashiers 	*/
	CUSTOMERS* customer = customer1;

	/*********************************************    krisimi perioxi    *****************************************/
	rc = pthread_mutex_lock(&cashs);
	elegxos(rc);
 	while (n_cash == 0) 
 	{
	 	rc = pthread_cond_wait(&cond1, &cashs);
		elegxos(rc);
	}
	n_cash--;
	
	clock_gettime(CLOCK_REALTIME, &stop_anamoni); //anamoni
	
	xronos_anamonis += stop_anamoni.tv_sec - start_anamoni.tv_sec ;
	rc = pthread_mutex_unlock(&cashs);
	elegxos(rc);
	/*******************************************    telos krisimis perioxis    *****************************************/
	
	
	int sleep1 = random_number(T_CASH_LOW, T_CASH_HIGH, customer->id);
	sleep(sleep1); //xronos dokimis tis pliromis
	
	double pithanotita = random_number(0,1,customer->id);
	
	if (pithanotita <= P_CARD_SUCCES) //	Dekti synallagi
	{
		customers_array[c_a++] = *customer;

		/*********************************************    krisimi perioxi    *****************************************/
		rc = pthread_mutex_lock(&sums);
		elegxos(rc);
		sum_for_success ++;
		income += customer->cost;
		rc = pthread_mutex_unlock(&sums);
		elegxos(rc);
		/*********************************************    telos krisimis perioxis    *****************************************/

		char z;
		if (customer->zone==0)
		{
			z = 'A';
		}
		else
		{
			z = 'B';
		}
		/*********************************************    krisimi perioxi    *****************************************/
		rc = pthread_mutex_lock(&prints);
		elegxos(rc);
		printf("Πελάτης %d:\tΗ κράτηση ολοκληρώθηκε επιτυχώς. Οι θέσεις σας είναι στη ζώνη <%c>, σειρά <%d>, αριθμός <", customer->id, z, customer->row + 1 );
		for(int i = customer->initial; i < customer->final;i++)
		{	
			printf("%d,", i+1);
		}
		printf("%d", customer->final + 1);
		printf("> και το κόστος της συναλλαγής είναι <%d> ευρώ\n", customer->cost);
		rc = pthread_mutex_unlock(&prints);
		elegxos(rc);
		/*********************************************    telos krisimis perioxis    *****************************************/

	}
	else		// apotyxia plirwmis
	{
		/*********************************************    krisimi perioxi    *****************************************/
		rc = pthread_mutex_lock(&sums);
		elegxos(rc);
		sum_for_uns_payment++;
		rc = pthread_mutex_unlock(&sums);
		elegxos(rc);
		/*********************************************    telos krisimis perioxis    *****************************************/

		/*********************************************    krisimi perioxi    *****************************************/
		rc = pthread_mutex_lock(&theater);
		elegxos(rc);
	
		for (int i = customer->initial; i <= customer->final;i++)
		{
			seats[customer->row][i] = 0;
		}

		rc = pthread_mutex_unlock(&theater);
		elegxos(rc);
		/*********************************************    telos krisimis perioxis    *****************************************/


		printf("Πελάτης %d:\tΗ κράτηση απέτυχε γιατί η συναλλαγή με την πιστωτική κάρτα δεν έγινε αποδεκτή.\n", customer->id);
		clock_gettime(CLOCK_REALTIME, stop_eksypiretisi);
		
		/*********************************************    krisimi perioxi    *****************************************/
		rc = pthread_mutex_lock(&sums);
		elegxos(rc);
		xronos_eksypiretisis += stop_eksypiretisi->tv_sec - start_eksypiretisi->tv_sec;
		rc = pthread_mutex_unlock(&sums);
		elegxos(rc);
		/*********************************************    telos krisimis perioxis    *****************************************/


		/*********************************************    krisimi perioxi    *****************************************/
		rc = pthread_mutex_lock(&cashs);
		elegxos(rc);
		n_cash++;
		rc = pthread_cond_signal(&cond1);
		elegxos(rc);
		rc = pthread_mutex_unlock(&cashs);
		elegxos(rc);
		/*********************************************    telos krisimis perioxis    *****************************************/
		return;
	}

	clock_gettime(CLOCK_REALTIME, stop_eksypiretisi);
	
	/*********************************************    krisimi perioxi    *****************************************/
	rc = pthread_mutex_lock(&sums);
	elegxos(rc);
	xronos_eksypiretisis += stop_eksypiretisi->tv_sec - start_eksypiretisi->tv_sec;
	rc = pthread_mutex_unlock(&sums);
	elegxos(rc);
	/*********************************************    telos krisimis perioxis    *****************************************/
	
	/*********************************************    krisimi perioxi    *****************************************/
	rc = pthread_mutex_lock(&cashs);
	elegxos(rc);
	n_cash++;
	rc = pthread_cond_signal(&cond1);
	elegxos(rc);
	rc = pthread_mutex_unlock(&cashs);
	elegxos(rc);
	/*********************************************    telos krisimis perioxis    *****************************************/
}
void *call(void *x){

	//	for times
	struct timespec start_anamoni; 
	struct timespec stop_anamoni; 
	struct timespec start_eksypiretisi; 
	struct timespec stop_eksypiretisi ;

	clock_gettime(CLOCK_REALTIME, &start_anamoni);
	clock_gettime(CLOCK_REALTIME, &start_eksypiretisi);
	
	//	for call 
	int rc;
	int *tid;
	tid = (int *)x;
 	CUSTOMERS customers;
	customers.id = *tid;
	
 	/************************************************    krisimi perioxi    *********************************************/
 	rc = pthread_mutex_lock(&tels);
	elegxos(rc);
 	while (n_tel == 0) 
 	{	
	 	rc = pthread_cond_wait(&cond, &tels);
		elegxos(rc);
	}
	
	n_tel--;
	
	clock_gettime(CLOCK_REALTIME, &stop_anamoni);
	xronos_anamonis += stop_anamoni.tv_sec - start_anamoni.tv_sec;///BILLION;	//finish_time - start_time;
	
	rc = pthread_mutex_unlock(&tels);
	elegxos(rc);
	
	/*******************************************    telos krisimis perioxis    *****************************************/
	
	int zitoumenes_tseseis = (int)random_number(NUM_SEAT_LOW, NUM_SEAT_HIGH, customers.id); 
	double zoni = random_number(0,1, customers.id);
	int sleep_time = (int) random_number(T_SEAT_LOW, T_SEAT_HIGH, customers.id);
	sleep(sleep_time); //xronos anazitisis
	
	int available=0 ;

	int start , finish;
	if (zoni <= P_ZONE_A) 
	{
		start = 0;
		finish = NUM_ZONE_A ;
		customers.zone = 0;  //	0 for zone A  	and 1 fot zone B
	}
	else 
	{
		start = NUM_ZONE_A;
		finish = NUM_ZONE_B + NUM_ZONE_A ;
		customers.zone = 1;
	}
	
	int flag = 0; //boolean gia na elegksoume an yparxoun diathesimes synexomenes theseis.
	int j,i;

	/************************************************    krisimi perioxi    *********************************************/
	rc = pthread_mutex_lock(&theater);
	elegxos(rc);

	for(i = start; i < finish ; i++)
	{
		for(j = 0; j<NUM_SEAT; j++)
		{
			if (seats[i][j] == 0) available++;
			else available = 0;
			if (available == zitoumenes_tseseis) break;
		}
		if (available == zitoumenes_tseseis)
		{
			flag = 1;
			for (int k = j; k > j-available; k--)
			{
				seats[i][k] = 1;
			}
			rc = pthread_mutex_unlock(&theater);
			elegxos(rc);
			customers.initial = j-zitoumenes_tseseis +1;
			customers.final = j;
			customers.row = i;
			break;
		}
		available = 0;
	}
	
	if(flag == 0) 	//den yparxoun diathesimes theseis
	{
		rc = pthread_mutex_unlock(&theater);
		elegxos(rc);
		rc = pthread_mutex_lock(&sums);
		elegxos(rc);
		sum_for_uns_seats++;
		rc = pthread_mutex_unlock(&sums);
		elegxos(rc);
	
		printf("Πελάτης %d:\tΗ κράτηση απέτυχε γιατί δεν υπάρχουν κατάλληλες θέσεις.\n",*tid);
		clock_gettime(CLOCK_REALTIME, &stop_eksypiretisi);

		rc = pthread_mutex_lock(&sums);
		elegxos(rc);
		xronos_eksypiretisis += stop_eksypiretisi.tv_sec -start_eksypiretisi.tv_sec;
		rc = pthread_mutex_unlock(&sums);
		elegxos(rc);
		
		rc = pthread_mutex_lock(&tels);
		elegxos(rc);
		n_tel++;
		rc = pthread_cond_signal(&cond);
		elegxos(rc);
		rc = pthread_mutex_unlock(&tels);
		elegxos(rc);
		pthread_exit(NULL);
	}
	else
	{
		customers.cost = customers.zone == 0 ? C_ZONE_A *zitoumenes_tseseis : C_ZONE_B *zitoumenes_tseseis;
	}	
	rc = pthread_mutex_lock(&tels);
	
	n_tel++;

	rc = pthread_cond_signal(&cond);
	rc = pthread_mutex_unlock(&tels);

	if(flag == 1)
	{
		cashier(&customers, rc, &start_eksypiretisi, &stop_eksypiretisi);	
	}
	
	/******************************************    telos krisimis perioxis    *********************************************/
	pthread_exit(NULL);
 }

int main(int argc, char** argv)
{
	if (argc != 3)
	{
		printf("Λάθος αριθμός παραμέτρων. Παρακαλώ εισάγετε το όνομα του αρχείου, τον αριθμό των πελατών και τον αρχικό σπόρο.\t");
		return 0;
	}
	int i, j, rc; 
	int N = atoi(argv[1]);
	seed = atoi(argv[2]);
	
	int* id; //pinakas me id's twn pelatwn
	id = (int*) malloc(N*sizeof(int));
	
	//arxikopoihsh twn thesewn me 0 (ws diathesimes).
	for(i = 0 ; i < NUM_ZONE_A + NUM_ZONE_B ; i++)
	{
		for(j = 0 ; j < NUM_SEAT; j++)
		{
			seats[i][j] = 0;
		}
	}
	
	pthread_t* threads; // every customer is a thread. N customers.
	threads = (pthread_t*) malloc(N * sizeof(pthread_t));
	customers_array = (CUSTOMERS*) malloc(N *sizeof(CUSTOMERS));	
	
	pthread_mutex_init(&tels, NULL);
	pthread_mutex_init(&cashs, NULL);
	pthread_mutex_init(&theater, NULL);
	pthread_mutex_init(&prints, NULL);
	pthread_mutex_init(&sums, NULL);
	
	pthread_cond_init(&cond, NULL);
	pthread_cond_init(&cond1, NULL);

 	for (int i = 0; i < N; i++) 
 	{
 		id[i] = i+1;
 		rc = pthread_create(&threads[i], NULL, call, &id[i]);
    	elegxos(rc);
		sleep(random_number(T_RES_LOW, T_RES_HIGH, id[i])); // kathe klisi pragmatopoieitai kata enan tyxaio arithmo deyteroleptwn
 	}
 	for (int i = 0; i < N; i++) 
 	{
 		pthread_join(threads[i], NULL);
 	}


	for (int i = 0; i < c_a; i++)
	{
		char z;
		if (customers_array[i].zone==0)
		{
			z = 'A';
		}
		else
		{
			z = 'B';
		}
		
		for (int j = customers_array[i].initial; j <= customers_array[i].final; j++)
		{
			printf("Ζώνη %c / Σειρά %d / Θέση %d / Πελάτης %d\n", z, customers_array[i].row + 1, j+1, customers_array[i].id);
		}
	}
	
	printf("Συνολικά έσοδα:\t%d\n", income);
	printf("Ποσοστό συναλλαγών που ολοκληρώθηκαν με επιτυχία:\t%.2f %%\n", (sum_for_success/N)*100.0);
	printf("Ποσοστό συναλλαγών που απέτυχαν λόγω ελλειψης θέσεων:\t%.2f %%\n", (sum_for_uns_seats/N)*100);
	printf("Ποσοστό συναλλαγών που απέτυχαν λόγω άκυρης συναλλαγής:\t%.2f %%\n", (sum_for_uns_payment/N)*100);
	printf("Μέσος χρόνος Αναμονής Πελατών:\t%.3f secs\n", xronos_anamonis*1.0f/N);
	printf("Μέσος χρόνος ΕΞυπηρέτησης Πελατών:\t%.3f secs\n", xronos_eksypiretisis*1.0f/N);

	pthread_mutex_destroy(&tels);
	pthread_mutex_destroy(&cashs);
	pthread_mutex_destroy(&theater);
	pthread_mutex_destroy(&sums);
	pthread_mutex_destroy(&prints);

	pthread_cond_destroy(&cond);
	pthread_cond_destroy(&cond1);
	free(threads);
	free(customers_array);
	free(id);
	return 0;
}