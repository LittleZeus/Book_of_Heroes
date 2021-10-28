//Handle Player Input 
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyDown = keyboard_check(ord("S"));
keyUp = keyboard_check(ord("W"));
keyDash = keyboard_check(vk_space);
keyAct = keyboard_check_pressed(ord("E"));
keyAttack = mouse_check_button(mb_left);
keySecondaryAttack = mouse_check_button_pressed(mb_right);
keyItem = keyboard_check_pressed(vk_control);

inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight-keyLeft!=0) || (keyDown-keyUp!=0);

if (!global.gamePaused) 
{
	script_execute(state);
	invulnerable = max(invulnerable-1,0);
	flash = max(flash-0.05,0);
}

depth = -bbox_bottom;
