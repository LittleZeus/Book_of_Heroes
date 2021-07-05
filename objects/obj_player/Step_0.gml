//Handle Player Input 
keyLeft=keyboard_check(ord("A"));
keyRight=keyboard_check(ord("D"));
keyDown=keyboard_check(ord("S"));
keyUp=keyboard_check(ord("W"));
keyDash=keyboard_check(vk_space);

inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight-keyLeft!=0) || (keyDown-keyUp!=0);

if (!global.gamePaused) script_execute(state);


