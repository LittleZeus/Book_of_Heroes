event_inherited();

state = playerStateFree;

image_speed = 0;

spriteDash = spr_player_dash;
spriteRun = spr_player_run;
spriteIdle = spr_player_idle;
localFrame = 0;

MaxHP = 100;
HP = 100;
EXP=0;
intial_speed = 10.0;
hSpeed=0;
vSpeed=0;
move_speed = intial_speed;
speedDash = 15.0;
distanceDash = 300;
swingCounter = 0;
move_modifier = 1;

movement_arr[0][0] = 0; // Set movement multiplier, timeing amount -1 = endless 
for (var i = 0; i < 10; ++i;) {
	movement_arr[i][0] = 1;
	movement_arr[i][1] = 0;
}