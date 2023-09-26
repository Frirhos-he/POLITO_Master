#include <stdio.h>
#include <stdlib.h>
#include <sys/unistd.h>
#include <sys/wait.h>


int main(int args, char **argv) {
    int h,n,i;
    char str[10];
    char str1[10];


    if(args != 3) return -1;


    h = atoi(argv[1]);
    n = atoi(argv[2]);

    if(h == 0) {
        printf("Child terminating %d \n",getpid());
        exit(0);
    }

    for( i = 0; i<n; i++){
        if(fork() == 0){
            sprintf(str,"%d",h-1);
            sprintf(str1,"%d",n);
            execlp(argv[0],argv[0],str,str1, NULL); // 2 arguments
            printf(" \n on");
            break;
        }
    }
    wait((int *) 0);
    return 1;
}
