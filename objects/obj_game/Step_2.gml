/// @description Pause the Game
if (keyboard_check_pressed(vk_escape) and room != rm_mainmenu) {
	
	global.gamePaused = !global.gamePaused;
	
	if (global.gamePaused) {
		with (all)
		{	
			gamePausedImageSpeed = image_speed;
			if (gamePausedImageSpeed == image_speed) image_speed = 0;
		}
	} else {
		with (all)
		{	
			image_speed = gamePausedImageSpeed;
		}
	}
	
}