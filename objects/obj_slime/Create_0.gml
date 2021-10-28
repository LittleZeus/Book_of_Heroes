// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprite
sprMove = spr_slime;
sprAttack = spr_slime_attack;
sprDie = spr_slime_die;
sprHurt = spr_slime_hurt;

//Enemy scripts
enemyScript[ENEMYSTATE.WANDER] = slimeWander;
enemyScript[ENEMYSTATE.CHASE] = slimeChase;
enemyScript[ENEMYSTATE.ATTACK] = slimeAttack;
enemyScript[ENEMYSTATE.HURT] = slimeHurt;
enemyScript[ENEMYSTATE.DIE] = slimeDie;

entityDropList = choose
					(	[obj_coin],
						[obj_coin,obj_coin],
						[obj_bomb_drop],
						[obj_arrow_drop]
					);