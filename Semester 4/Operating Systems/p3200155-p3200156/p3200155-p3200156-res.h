#define NUM_TEL  3
#define NUM_SEAT 10
#define NUM_ZONE_A 10
#define NUM_ZONE_B 20
#define NUM_CASH 2
#define P_ZONE_A 0.3
#define P_ZONE_B 0.7
#define C_ZONE_A 30
#define C_ZONE_B 20
#define NUM_SEAT_LOW 1
#define NUM_SEAT_HIGH 5
#define T_RES_LOW 1
#define T_RES_HIGH 5
#define T_SEAT_LOW 5
#define T_SEAT_HIGH 13
#define T_CASH_LOW 4
#define T_CASH_HIGH 8
#define P_CARD_SUCCES 0.9

void elegxos(int rc);
double random_number(int x, int y, int id);
void cashier(void * customer1, int rc, struct timespec * start_eksypiretisi, struct timespec * stop_eksypiretisi);
void *call(void *x);