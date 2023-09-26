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
    FILE *fr,*fwb;
    int fw,frb;
    int end_f;


    int id;
    long reg;
    char surname[S];
    char name[S];
    int mark;
    record_t *tmp;

    if(argc != 4) return -1;

    fr = fopen(argv[1],"r");
    fw = open(argv[2], O_WRONLY | O_CREAT);

    if(fr == NULL || fw == NULL) return -1;

    while((end_f = fscanf(fr,"%d %ld %s %s %d", &id,&reg,surname,name,&mark)) != EOF){

            tmp = (record_t *) malloc(1 * sizeof(record_t));
            tmp->id = id;
            tmp->reg = reg;
            strcpy(tmp->surname, surname);
            strcpy(tmp->name, name);
            tmp->mark = mark;
            write(fw, tmp, sizeof(record_t));
    }

    fclose(fr);
    close(fw);

    frb = open(argv[2],O_RDONLY);
    fwb = fopen(argv[3],"w");

    if(frb == NULL || fwb == NULL) return -1;
    end_f = read(frb, tmp, sizeof(record_t));
    while (end_f != 0){
            fprintf(fwb, "%d %ld %s %s %d", tmp->id, tmp->reg, tmp->surname, tmp->name, tmp->mark);
            end_f = read(frb, tmp, sizeof(record_t));
            if(end_f!=0) fprintf(fwb,"\n");
    };

    close(frb);
    fclose(fwb);
    return 0;
}
