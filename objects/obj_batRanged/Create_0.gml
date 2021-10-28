// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprite
sprMove = spr_bat;
sprAttack = spr_bat;
sprDie = spr_bat_die;
sprHurt = spr_bat_hurt;

//Enemy scripts
enemyScript[ENEMYSTATE.WANDER] = batWander;
enemyScript[ENEMYSTATE.CHASE] = batChaseRanged;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = enemyHurt;
enemyScript[ENEMYSTATE.DIE] = enemyDie;

entityDropList = choose
					(	[obj_coin],
						[obj_coin,obj_coin],
						[obj_bomb_drop],
						[obj_arrow_drop]
					);