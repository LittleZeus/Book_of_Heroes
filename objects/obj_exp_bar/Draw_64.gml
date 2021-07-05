/// @description Insert description here
// You can write your code in this editor

var height = sprite_get_height(spr_exp);
var width = sprite_get_width(spr_exp);

if instance_exists(obj_game) {
	EXP = obj_game.EXP;
	NextLevel = obj_game.player_level*10; //TODO add global exp system
}

draw_sprite_general(spr_exp, 0, 0, 0, (2020)*EXP/NextLevel, height, 
					(display_get_gui_width()-width)/2, 
					display_get_gui_height()-height, 
					1, 1, 0, c_white, c_white, c_white, c_white, 1);					
draw_sprite(spr_exp_bar,0,global.displayWidth/2,global.displayHeight);