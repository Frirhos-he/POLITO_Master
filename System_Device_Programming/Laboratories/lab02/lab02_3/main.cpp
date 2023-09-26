#include <iostream>
#include <vector>

using std::vector;
using std::cout;
using std::endl;
vector<int> v;


vector<int> visit(vector<int> v) {
    for (int i: v){
        cout << i << " ";
    }
    cout << endl;
}
int getSize(vector<int> v){
    return v.size();
}
bool empty(vector<int> v){
    return (v.empty());
}

int main() {
    std::cout << "Hello, World!" << std::endl;
    v.push_back(1);
    v.push_back(1);
    v.push_back(1);
    v.push_back(1);
    v.pop_back();
    visit(v);
    cout << getSize(v) <<endl;
    cout << empty(v)  <<endl;
    return 0;
}
