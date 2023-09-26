#ifndef _LEADERBOARDCLASS
#define _LEADERBOARDCLASS
#include "Player.h"
#include <iostream>
#include <string>
#include <set>

using std::set;

class Leaderboard{
public:
    Leaderboard(){
        players={};
    };
    set<Player> getPlayers();
    void setPlayers(set<Player> );
    void visit();
    void addPlayer(const std::string& , int );
    void removePlayer(const std::string& );
private:
    set<Player> players;
};

#endif