#include <iostream>
#include <list>

using std::list;
using std::cout;
using std::endl;


void enqueue(list<int> &vec, int i){
    vec.push_front(i);
}
void dequeue(list<int> &vec){
    vec.pop_front();
}
list<int> visit(list<int> vec) {
    for (int i: vec){
        cout << i << " ";
    }
    cout << endl;
}
int getSize(list<int> vec){
    return vec.size();
}
bool empty(list<int> vec){
    return (vec.empty());
}

int main() {
    list<int> v;

    enqueue(v,1);
    enqueue(v,1);
    enqueue(v,1);
    dequeue(v);
    visit(v);
    cout << getSize(v) <<endl;
    cout << empty(v)  <<endl;
    return 0;
}
