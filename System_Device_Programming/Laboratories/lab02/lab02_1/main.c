#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

static void *T();
int n;
sem_t mux;



void *T(void *p){
    pthread_t t1;
    pthread_t t2;
    int current_n;
    long int *current = (long int*) p;
    long int *vect1;
    current_n = sizeof(current) /sizeof(long int);
    current_n++;
    vect1 = malloc((current_n)*sizeof(long int));

    for (int i = 0; i<(current_n-1);i++){
        vect1[i]=current[i];
    }
    vect1[current_n-1]=pthread_self();
    if(current_n > n ){
        sem_wait(&mux);
        printf("\n");
        for(int i = 0; i<current_n; i++)
            printf("%ld ",vect1[i]);
        sem_post(&mux);
        pthread_exit(NULL);
    }
    pthread_create(&t1,NULL, T,&vect1);
    pthread_create(&t2,NULL, T,&vect1);
    pthread_join(t1,NULL);
    pthread_join(t2,NULL);
    free(vect1);
    pthread_exit(NULL);
}


int main(int argc, char **argv) {
    pthread_t t1;
    pthread_t t2;
    long int *vect1;
    setbuf(stdout,0);
    if(argc != 2) return -1;
    n = atoi(argv[1]);
    sem_init(&mux, 0, 1);
    vect1 = malloc(sizeof(long int));
    vect1[0]=pthread_self();
    if(n == 0) {
        pthread_create(&t1,NULL, T,&vect1);
        free(vect1);
        pthread_join(t1,NULL);
    }
    else {

        pthread_create(&t1, NULL, T, &vect1);
        pthread_create(&t2, NULL, T, &vect1);
        free(vect1);
        pthread_join(t1, NULL);
        pthread_join(t2, NULL);
    }
    return 0;
}
