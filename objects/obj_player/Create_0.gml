event_inherited();

state = playerStateFree;
stateAttack = attackSlash;
attackCooldown = 0;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;

spriteDash = spr_player_dash;
spriteRun = spr_player_run;
spriteIdle = spr_player_idle;
localFrame = 0;

intial_speed = 8.0;
hSpeed=0;
vSpeed=0;
move_speed = intial_speed;
speedDash = 15.0;
distanceDash = 300;
distanceBonk = 40;
distanceBonkHeight = 12;
speedBonk = 4;
z = 0;
invulnerable = 0;
flash = 0;
flashShader = sha_WhiteFlash;
activate = noone;

animationEndScript = -1;

if (global.targetX != -1) {
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}


move_modifier = 1;

movement_arr[0][0] = 0; // Set movement multiplier, timeing amount -1 = endless 
for (var i = 0; i < 10; ++i;) {
	movement_arr[i][0] = 1;
	movement_arr[i][1] = 0;
}