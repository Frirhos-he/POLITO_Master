#ifndef _PLAYERCLASS
#define _PLAYERCLASS

#include <iostream>
#include <string>
using std::string;

class Player{
public:
    Player(string n, int s) {
        name=n;
        score= s;
    }
    string getName();
    int getScore();
    bool operator<( const Player& other) const;
    bool operator=( const Player& other) const;
private:
    string name;
    int score;
};

#endif