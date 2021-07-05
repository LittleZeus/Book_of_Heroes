/// @description Insert description here
// You can write your code in this editor

draw_text(50,50, "Money: " + string(money));
draw_text(50,100, "Experience: " + string(EXP));

if instance_exists(obj_player) {
	draw_text(50,150, "move mod: " + string(obj_player.move_modifier));
	draw_text(50,200, "move mod time: " + string(obj_player.movement_arr[0][1]));
}

/*if instance_exists(obj_slime) {
	draw_text(50,250, "move X: " + string(obj_slime.moveX));
	draw_text(50,300, "move Y: " + string(obj_slime.moveY));
	draw_text(50,350, "X: " + string(obj_slime.x));
	draw_text(50,400, "Y: " + string(obj_slime.y));
	draw_text(50,450, "HP: " + string(obj_slime.HP));
}*/

draw_text(50,500, "Room: " + string(room_get_name(room)));