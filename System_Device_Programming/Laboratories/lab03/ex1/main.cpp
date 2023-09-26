#include "GenericClass.h"


using std::list;
int main() {
    GenericClass<int, list<int>> myStack;
    GenericClass<string, vector<string>> myQueue;
    int n, val;
    string vals;

    myStack.add(2);
    myStack.del();
    myStack.visit();
    std::cout << "Stack Size: " << myStack.getSize() << endl;

    n = 0;


    myQueue.visit();
    std::cout << "Queue Size: " << myQueue.getSize() << endl;

    n = 0;


    return 0;
}
