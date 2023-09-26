#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

static void *T();
int r = 3;
int x = 3;
int c = 3;

typedef struct tdata_s {
    int i;
    int j;
    int **c;
    int **a;
    int **b;
    pthread_t t;
}tdata_t;

void mat_mul (int **A,  int  **B, int r, int x, int c, int **C){

    tdata_t *temp_v;
    pthread_t t;
    temp_v = malloc((r+c) * sizeof(tdata_t));

    for(int i = 0; i< r; i++){
        for(int j = 0; j< c; j++){
                temp_v[i+j].i = i;
                temp_v[i+j].j = j;
                temp_v[i+j].c = C;
                temp_v[i+j].a = A;
                temp_v[i+j].b = B;

                pthread_create(&temp_v[i+j].t, NULL,T,(void *)&temp_v[i+j]);
                pthread_join(temp_v[i+j].t,NULL);
                //printf("\n %d \n ",C[i][j]);
            }
        }
    return;
};

void *T(void *p){
    tdata_t *current = (tdata_t*) p;
    int **A= current->a;
    int **B= current->b;
    int **C= current->c;
    int i  = current->i;
    int j  = current->j;
    C[i][j] = 0;
    for(int k= 0; k< x;k++) {
        C[i][j]+= A[i][k] * B[k][j];
    }
    pthread_exit(NULL);
}


int main(int argc, char **argv) {
    int **matrix_C;
    int **matrix_A;
    int **matrix_B;
    matrix_A = malloc(r * sizeof(int *));
    for (int i = 0; i< r; i++ ){
        matrix_A[i] = malloc(x *sizeof(int));
    }
    matrix_B = malloc(r * sizeof(int *));
    for (int i = 0; i< x; i++ ) {
        matrix_B[i] = malloc(c * sizeof(int));
    }
    matrix_C = malloc(r*sizeof(int *));

    for(int i = 0;i<r; i++){
        matrix_C[i] = malloc(c*sizeof(int));
    }
    for (int i = 0; i<r ; i++){
        for (int j = 0; j<x; j++){
            matrix_A[i][j] = (i+j);
        }
    }
    for (int i = 0; i<x ; i++){
        for (int j = 0; j<c; j++){
            matrix_B[i][j] = (i+j);
        }
    }

    setbuf(stdout,0);
    mat_mul (matrix_A,matrix_B, r ,x,c,matrix_C);
    for(int i= 0; i< r; i++) {
        for (int j= 0; j< c; j++) {
            printf("%d ", matrix_C[i][j]);
        }
        printf("\n");
    }
    return 0;
}
