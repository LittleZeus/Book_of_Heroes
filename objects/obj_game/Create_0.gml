randomize();

enum factions {
	neutral,
	ally,
	enemy
}

global.gamePaused = false;


player_level = 1;
money = 0;
EXP = 0;

room_goto(ROOM_START);