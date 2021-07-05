/// @description Insert description here
// You can write your code in this editor
if(point_distance(x,y, obj_player.x,obj_player.y) < pickup_range){
	//Turn to look at player ship
	var new_angle =  point_direction(x,y, obj_player.x,obj_player.y);
	new_angle = image_angle - angle_difference(image_angle, new_angle);
	image_angle = lerp(image_angle, new_angle, 0.2);
	direction = image_angle;
	
	speed += 0.05;
	
} else {
	speed = lerp(speed,originalSpeed,0.1)
}