//Carry out an animtion and option carry out script when the animation ends
function playerActOutAnimation(_sprite){
	
	state = playerStateAct;
	sprite_index = _sprite;
	if (argument_count > 1 ) animationEndScript = argument[1];
	localFrame = 0;
	image_index = 0;
	playerAnimateSprite();
	
}