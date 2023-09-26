#include <stdio.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/unistd.h>
#include <stdlib.h>

int sig1;
int sig2;
int finish = 0;

void signal_handler(int sig){
    if(sig ==SIGUSR2 && sig1 == SIGUSR1){
        printf("success \n");
    }
    if((sig == SIGUSR1 && sig1 == SIGUSR1) || (sig == SIGUSR2 && sig1 == SIGUSR2) ){
        printf("error \n");
    }
    if((sig == SIGUSR1 && sig1 == SIGUSR1 && sig2 == SIGUSR1) ||
        (sig == SIGUSR2 && sig1 == SIGUSR2 && sig2 == SIGUSR2)) {
        finish = 1;
    }
        sig2 = sig1;
        sig1 = sig;

}

int main() {
    int pid1,pid2;
    char cmd[100];
    if (signal(SIGUSR1, signal_handler) == SIG_ERR ||
            signal(SIGUSR2, signal_handler) == SIG_ERR )
    {
        printf("Error initializing signal handler");
        return -1;
    }
    pid1 = fork();
    if(!pid1){
        while(1){
            sleep(rand()%2);
            kill(getppid(),SIGUSR1);
        }
    }else {
        pid2 = fork();
        if(!pid2) {
            while (1) {
                sleep(rand() % 3);
                kill(getppid(), SIGUSR2);
            }
        }
    }
    while(1){
        pause();
        if(finish) {
            sprintf(cmd,"kill -9 %d",pid1);
            system(cmd);
            sprintf(cmd,"kill -9 %d",pid1);
            printf("Done");
            system(cmd);
            exit(0);
        }
    };
}
