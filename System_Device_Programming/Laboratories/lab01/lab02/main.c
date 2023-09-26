/*
 *
Exercise 02
Random File Walks
-----------------

File stores *binary* information with *fixed-length* records
using the format of file_2 of Exercise 01.
Write a program to implement a user menu with the following options:

- R n: Where R is the character 'R', and n is an integer value.
       Read from the file the record representing student number n and
       display this information on standard output.

- W n: Where W is the character 'W', and n is an integer value.
       Read from standard input all data fields for the student number
       n and write them on the file in position n.

- E: End the program.

The input file name is given on the command line.

The following is an example of execution (using the file presented in
Exercise 01):

> R 3     // Read info for student 3
3 200000 Verdi Giacomo 15
> R 1     // Read info for student 1
1 100000 Romano Antonio 25
> W 1     // Over-write info for the student in position 1
          // with info read from standard input
          // Read input data
Data: 1 100000 Romano Antonio 27
          // Overwrite record on file ...
> W 5     // Add info for the student in position 5
          // with info read from standard input
          // Read input data
Data: 5 157143 White House 30
          // Overwrite record on file ...
> E       // End program

where
- "//" specifies explanatory comments, not program I/O lines
- "R 3", "R 1", "W 1", etc. are the user inputs
- all other characters belong to the program output.
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#define N 100
#define S 31
typedef struct record_s {
    int id;
    long int reg;
    char surname[S];
    char name[S];
    int mark;
} record_t;

int main(int argc, char **argv) {
    int fd,n;
    int end_f;
    char option;

    record_t *tmp;
    tmp = (record_t *) malloc(1 * sizeof(record_t));


    if(argc != 2) return -1;
    fd = open(argv[1],O_RDWR);
    if(fd == NULL) return -1;
    printf("Select options");
    scanf("%c",&option);
    switch(option){
        case 'R':
            printf("Write integer value");
            scanf("%d",&n);
            lseek(fd, (n-1)*sizeof(record_t), SEEK_SET);
            end_f = read(fd, tmp, sizeof(record_t));
            if(end_f == 0) return -1;
            printf("%d %ld %s %s %d", tmp->id,tmp->reg,tmp->surname,tmp->name,tmp->mark);
            break;
        case 'W':
            printf("Write integer value");
            scanf("%d",&n);
            lseek(fd, (n-1)*sizeof(record_t), SEEK_SET); //otherwise will modify n+1
            tmp->id = n;
            printf("Select reg");
            scanf("%ld",&tmp->reg);
            printf("Select surname");
            scanf("%s",tmp->surname);
            printf("Select name");
            scanf("%s",tmp->name);
            printf("Select mark");
            scanf("%d",&tmp->mark);
            end_f = write(fd, tmp, sizeof(record_t));
            if(end_f == 0) return -1;
            // printf("%d %ld %s %s %d", tmp->id,tmp->reg,tmp->surname,tmp->name,tmp->mark);
            break;
        case 'E':
            return 0;
            break;
        default:
            return -1;
    }


    return 0;

}
