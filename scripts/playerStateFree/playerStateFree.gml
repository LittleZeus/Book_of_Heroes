// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerStateFree(){
	count_move_arr();
	if (inputMagnitude) move_modifier=movement_array(movement_arr);


	//Handle Player Movement
	hSpeed=lengthdir_x(inputMagnitude*move_speed*move_modifier,inputDirection);
	vSpeed=lengthdir_y(inputMagnitude*move_speed*move_modifier,inputDirection);

	playerCollision();

	move_wrap(true,true,sprite_width);

	swingCounter++;
	if ((mouse_button = mb_left)and(swingCounter >= 20)) {
		var _self = id;
		var _time = 10;
		sword_swing(_self,160,_time,-(sprite_height/3));
		slow_instance(_self,.25,_time)
		swingCounter = 0;
	}

	//Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude !=0) {
		direction = inputDirection;
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;
	if(_oldSprite != sprite_index) localFrame = 0;

	//Update Iamge Index
	playerAnimateSprite();
	
	//Change State
	if (keyDash) {
		state = playerStateDash;
		moveDistanceRemaining = distanceDash;
	}
}