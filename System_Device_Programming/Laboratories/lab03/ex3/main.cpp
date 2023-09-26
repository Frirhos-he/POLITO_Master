#include <iostream>
#include <fstream>
#include "forward_list"
#include "Graph.h"

using std::forward_list;
using std::cout;
using std::cerr;
using std::endl;
using std::ifstream;

int main() {
    Graph solution;
    ifstream infile;
    float *p2;


    string filename("../relation.txt");
    if(solution.insertGraph(filename) == EXIT_FAILURE) return -1;
    //solution.displayOrdered();
    //solution.displayFriends("Palermo_Bruno");
    solution.areTheyRelated("Palermo_Enrico","Giacalone_Elisa");

    int p1;

    return 0;
}
