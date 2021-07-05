// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerStateDash(){
	//Movement
	hSpeed = lengthdir_x(speedDash, direction);
	vSpeed = lengthdir_y(speedDash, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedDash);
	var _collided = playerCollision();
	
	//Update Sprite
	sprite_index = spriteDash;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1-(moveDistanceRemaining / distanceDash)) * _totalFrames), _totalFrames - 1);
	
	//Change State
	if (moveDistanceRemaining <= 0) {
		state = playerStateFree;	
	}
}