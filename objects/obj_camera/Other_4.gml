/// @description Camera Setup

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(cam, global.cameraWidth, global.cameraHeight);

if(instance_exists(follow)){
	global.cameraX = follow.x - global.cameraWidth/2;
	global.cameraY = follow.y - global.cameraHeight/2;
	
	global.cameraX = clamp(global.cameraX, 0, room_width-global.cameraWidth);
	global.cameraY = clamp(global.cameraY, 0, room_height-global.cameraHeight);
}

camera_set_view_pos(view_camera[0], global.cameraX, global.cameraY);

window_set_size(global.displayWidth,global.displayHeight);

alarm[0] = 1;

