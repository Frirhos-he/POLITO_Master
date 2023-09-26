#include "Leaderboard.h"


set<Player> Leaderboard::getPlayers(){
    return players;
}
void Leaderboard::setPlayers(set<Player> ps){
    players = ps;
    return;
}

void Leaderboard::visit(){
    for (auto p= players.rbegin() ; p!= players.rend() ; p++ ){
        Player tmp = *p;
        std::cout << tmp.getName() <<" "<< tmp.getScore() << std::endl;
    }
}

void Leaderboard::addPlayer(const std::string& name , int score){
    Player x(name,score);
    players.insert(x);
}
/*
void Leaderboard::getPlayerByName(string &name){

    //players.insert(x);
}
*/

void Leaderboard::removePlayer(const std::string& name){
    for(Player p: players){
        if(p.getName() == name){
                players.erase(p);
                break;
        }
    }

}