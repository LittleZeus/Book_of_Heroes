
//Follow Target
if(instance_exists(target)){
	global.cameraX = target.x - global.cameraWidth/2;
	global.cameraY = target.y - global.cameraHeight/2;
	
	global.cameraX = clamp(global.cameraX, 0, room_width-global.cameraWidth);
	global.cameraY = clamp(global.cameraY, 0, room_height-global.cameraHeight);
}

//Camera Shake
global.cameraX += random_range(-global.cameraShake,global.cameraShake);
global.cameraY += random_range(-global.cameraShake,global.cameraShake);

if(global.cameraShake> 0){
	global.cameraShake -= 0.2;
	if(global.cameraShake> 0) global.cameraShake = 0;
}

//Set Camera Pos
camera_set_view_pos(view_camera[0], global.cameraX, global.cameraY);

//Parallax
layer_x("Background_Sky", -display_mouse_get_x()*.01);
layer_y("Background_Sky", -display_mouse_get_y()*.01);

layer_x("Background_Clouds", -display_mouse_get_x()*.03);
layer_y("Background_Clouds", -display_mouse_get_y()*.03);

layer_x("Background_Ground", -display_mouse_get_x()*.01);
layer_y("Background_Ground", -display_mouse_get_y()*.01);
