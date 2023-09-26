//
// Created by bruno on 18/04/2023.
//

#ifndef GRAPH_H
#define GRAPH_H
#include <iostream>
#include <map>
#include <forward_list>


using std::forward_list;
using std::map;
using std::string;

class Graph {
public:
        int insertGraph(const string&);
        map<string,forward_list<string>> getGraph();
        void visit();
        void displayOrdered();
        void displayFriends(const string&);
        void areTheyRelated(const string&, const string&);
private:
        map<string,forward_list<string>> graph;
        int dimension;
};


#endif //GRAPH_H
