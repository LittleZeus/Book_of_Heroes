/// @description Insert description here
// You can write your code in this editor

if instance_exists(obj_player) {
	HP = obj_player.HP;
	MaxHP = obj_player.MaxHP;
}

//draw_healthbar(20+1,35+1,805-1,220-1,HitPoints,c_white,c_red,c_green,0,false,false);
draw_sprite_general(spr_health, 0, 0, 0, (800)*HP/MaxHP, 
					220, 13, 15, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
draw_sprite(spr_health_bar,0,10,10);
draw_text_transformed(410,130, string(HP),2,2,0);