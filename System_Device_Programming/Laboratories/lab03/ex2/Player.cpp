#include "Player.h"

string Player::getName(){
    return name;
}
int Player::getScore(){
    return score;
}

bool Player::operator< ( const Player& other) const
{   if(score != other.score)
        return score < other.score;
    else
        return name < other.name;
}
bool Player::operator= ( const Player& other) const
{   return name.compare( other.name );
}