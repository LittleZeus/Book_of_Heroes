#macro FRAME_RATE 60
//Collision Tile size
#macro TILE_SIZE 25
#macro CARDINAL_DIR round(direction/90)
#macro ROOM_START rm_title

#macro RESOLUTION_W 1280
#macro RESOLUTION_H 720

#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1

#macro INVENTORY_SLOTS 30
#macro CARRY_HEIGHT 100

#macro USE_ITEM_OPTIONS 3

#macro DARKBLUE $282a36
#macro WHITE $dfdfdf
#macro ORANGE $c8883c

enum GAMESTATE 
{
	MAINMENU,
	GAMEPLAY,
	PAUSED,
	TYPE_COUNT
}

enum ENEMYSTATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT	
}

enum ITEMTYPE
{
	USE,
	EQUIPMENT
}

// Each unique Item, will stack if same.
enum ITEMID
{
	BOMB,
	ARROW,
	TYPE_COUNT
}

enum STATE
{
	FREE,
	STEP,
	DRAW,
	TYPE_COUNT
}

enum EQUIPMENT 
{
	HELMET,
	CHEST,
	LEGS,
	BOOTS,
	WEAPON,
	TYPE_COUNT
}
