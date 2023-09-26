#ifndef _GENERICCLASS
#define _GENERICCLASS

#include <iostream>
#include <string>
#include <list>
#include <vector>

using std::cout;
using std::endl;
using std::string;
using std::list;
using std::vector;


template <typename T, class U>  class GenericClass {
public:
    void add(const T &e);
    T del();
    void visit();
    int getSize();
    bool empty();
private:
    U container;
};


template<typename T,class U>
void GenericClass<T,U>::add(const T &e) {
    container.push_back(e);
    return;
}

template<typename T,class U>
bool GenericClass<T,U>::empty() {
    return  (container.getSize()==0);
}



template<typename T,class U>
void GenericClass<T,U>::visit() {
    int n;
    cout << "Container visit: " << endl;
    n = 0;
    for (auto e : container)  {
        cout << n++ << ". " << e << endl;
    }
    return;
}

template<typename T,class U>
int GenericClass<T,U>::getSize() {
    return container.size();
}


template<typename T,class U>
T GenericClass<T,U>::del() {
    T e;
    e = container.back();
    container.pop_back();
    return e ;
}

#endif
