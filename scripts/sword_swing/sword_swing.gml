// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sword_swing(_creator,angle,lifetime,offset){

	var swing = instance_create_layer(x,y+offset,"Instances",obj_sword_swing);
	var player_angle = point_direction(_creator.x,_creator.y+offset,mouse_x,mouse_y) + angle/2;
	var angle_incr = angle/lifetime;
	with(swing) {
		image_angle = player_angle;
		swing.offset = offset;
		swing._creator = _creator;
		swing.lifetime = lifetime;
		swing.angle_incr = angle_incr;
	}

}