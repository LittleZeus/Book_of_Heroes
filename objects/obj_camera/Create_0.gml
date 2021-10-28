/// @desc Set up Camera

cam = view_camera[0];
follow = obj_player;
viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;

global.cameraX = 0;
global.cameraY = 0;

global.cameraWidth = RESOLUTION_W;
global.cameraHeight = RESOLUTION_H;

//TODO spilt displayscale
global.displayScale = 2;
global.displayWidth = global.cameraWidth * global.displayScale;
global.displayHeight = global.cameraHeight * global.displayScale;