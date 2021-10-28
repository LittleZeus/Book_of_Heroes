
//Follow Target
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
	
	global.cameraX += (xTo - global.cameraX - viewWidthHalf)/8;
	global.cameraY += (yTo - global.cameraY - viewHeightHalf)/8;
	
	global.cameraX = clamp(global.cameraX, 0, room_width-global.cameraWidth);
	global.cameraY = clamp(global.cameraY, 0, room_height-global.cameraHeight);
}

//Camera Shake
global.cameraX += random_range(-shakeRemain,shakeRemain);
global.cameraY += random_range(-shakeRemain,shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

//Set Camera Pos
camera_set_view_pos(cam, global.cameraX, global.cameraY);

//Parallax
//layer_x("Background_Sky", -display_mouse_get_x()*.01);
//layer_y("Background_Sky", -display_mouse_get_y()*.01);

//layer_x("Background_Clouds", -display_mouse_get_x()*.03);
//layer_y("Background_Clouds", -display_mouse_get_y()*.03);

//layer_x("Background_Ground", -display_mouse_get_x()*.01);
//layer_y("Background_Ground", -display_mouse_get_y()*.01);
