// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function knockback(sourceX,sourceY,_target,distance){

	var knockbackAngle = point_direction(sourceX,sourceY,_target.x,_target.y);
	with (_target) { //Need to redo with a better movement system
		x = x + lengthdir_x(distance, knockbackAngle);
		y = y + lengthdir_y(distance, knockbackAngle);
	}
}