//
// Created by bruno on 18/04/2023.
//

#include "Graph.h"
#include <fstream>
#include <list>
#include <vector>

using std::cout;
using std::cerr;
using std::endl;
using std::ifstream;
using std::list;
using std::vector;

int Graph::insertGraph(const string& filename){
    ifstream infile(filename);
    string s,s1,s2;
    if(!infile.is_open()) {
        cerr << "Error:" << filename << endl;
        return EXIT_FAILURE;
    }
    while(infile >> s1 >> s2){ //insert on s1 and s2 << insert to file

        if(graph.find(s1) == graph.end()) { //not found
            graph.insert({s1,{}});
            dimension++;

        }
        if(graph.find(s2) == graph.end()){
            graph.insert({s2,{}});
            dimension++;
        }
        graph.find(s1)->second.push_front(s2);
        graph.find(s2)->second.push_front(s1);
    }
    infile.close();
    return 0;
}
map<string,forward_list<string>> Graph::getGraph(){
    return graph;
}
void Graph::visit(){
    for(auto element: graph){
        cout << element.first << " is friend with" << endl;
        for (auto fra: element.second){
            cout << fra << " " << endl;
        }
    }
    return;
}

void Graph::displayOrdered(){
    for(auto pair: graph){
        cout << pair.first << endl;
    }
    return;
}

void Graph::displayFriends(const string &person){
    forward_list<string> list;

    if(graph.find(person) == graph.end()){
        return;
    }
    cout << "Friends of "<< person << " are " << endl;
    list = graph.find(person)->second;
    list.sort();
    for(auto person: list){
        cout << person << endl;
    }
    return;
}

void Graph::areTheyRelated(const string& s1,const string& s2){
    map<string,bool> visited={};
    string s;
    // Create a queue for BFS
    list<string> queue;

    if(graph.find(s1) == graph.end()) return;
    if(graph.find(s2) == graph.end()) return;

    for(auto pair: graph){
        visited.insert({pair.first,false});
    }

    // Mark the current node as visited and enqueue it
    visited.find(s1)->second= true;
    queue.push_back(s1);

    while (!queue.empty()) {
        // Dequeue a vertex from queue and print it
        s = queue.front();
       // cout << s << " ";
        queue.pop_front();

        // Get all adjacent vertices of the dequeued
        // vertex s. If a adjacent has not been visited,
        // then mark it visited and enqueue it
        for (auto adjacent : graph.find(s1)->second) {
            if (!visited.find(adjacent)->second) {
                visited.find(adjacent)->second = true;
                if(s2 == adjacent){
                    cout << "Found" << endl;
                }
                queue.push_back(adjacent);
            }
        }
    }

    return;
}