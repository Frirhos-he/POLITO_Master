#include "Leaderboard.h"

using std::set;
int main() {
    Leaderboard ld;
    set<Player> players;



    Player x("sICCIO",3);
    Player y("eweqe",2);
    Player z("Sempronio",2);
    players.insert(x);
    players.insert(y);
    players.insert(z);
    ld.setPlayers(players);
    ld.addPlayer( "csos", 1);
    ld.removePlayer("CAio");
    ld.visit();

    return 0;
}
