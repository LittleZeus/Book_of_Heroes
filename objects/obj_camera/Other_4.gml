/// @description Camera Setup

global.cameraX = 0;
global.cameraY = 0;
target = obj_player;

global.cameraWidth = 1280;
global.cameraHeight = 720;

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], global.cameraWidth, global.cameraHeight);

if(instance_exists(target)){
	global.cameraX = target.x - global.cameraWidth/2;
	global.cameraY = target.y - global.cameraHeight/2;
	
	global.cameraX = clamp(global.cameraX, 0, room_width-global.cameraWidth);
	global.cameraY = clamp(global.cameraY, 0, room_height-global.cameraHeight);
}

camera_set_view_pos(view_camera[0], global.cameraX, global.cameraY);

//Display
//TODO spilt displayscale
global.displayScale = 2;
global.displayWidth = global.cameraWidth * global.displayScale;
global.displayHeight = global.cameraHeight * global.displayScale;

display_set_gui_size(global.displayWidth,global.displayHeight);
window_set_size(global.displayWidth,global.displayHeight);
surface_resize(application_surface,global.displayWidth,global.displayHeight);
//room_set_viewport(room,0,0,0,0,global.cameraWidth,global.cameraHeight);

//GUI


//display_set_gui_maximise();

alarm[0] = 1;