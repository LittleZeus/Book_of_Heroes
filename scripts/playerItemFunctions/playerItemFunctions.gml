// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerThrow(){
	with (global.iLifted) {
		lifted = false;
		persistent = false;
		thrown = true;
		z = CARRY_HEIGHT;
		throwPeakHeight = z + 50;
		throwDistance = entityThrowDistance;
		throwDistanceTravelled = 0;
		throwStartPercent = (CARRY_HEIGHT/throwPeakHeight) * 0.5;
		throwPercent = throwStartPercent;
		direction = other.direction;
		xstart = x;
		ystart = y;
	}
	playerActOutAnimation(spr_player_idle);
	global.iLifted = noone;
	spriteIdle = spr_player_idle;
	spriteRun = spr_player_run;
}

function playerDropItem(){
	with (obj_player)
	{
		global.iLifted = noone;
		spriteIdle = spr_player_idle;
		spriteRun = spr_player_run;
	}
}
