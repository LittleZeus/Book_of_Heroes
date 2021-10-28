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

	//Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude !=0) {
		direction = inputDirection;
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;
	if(_oldSprite != sprite_index) localFrame = 0;

	//Update Iamge Index
	playerAnimateSprite();
	
	//Attack key logic
	attackCooldown = max(0,attackCooldown-1);
	if (keyAttack) && (attackCooldown <= 0) && (!global.mouseInMenu) && (obj_mouse.itemDrag == -1){
		state = playerStateAttack;
		stateAttack = attackSlash;
	}
	
	//Active key logic
	if (keyAct) {
		//1. check for entity to activate
		//2. If there is nothing, or no script 
			//2a. If we are carrying something, throw it!
			//2b. Otherwise, Roll!
		//3. Otherwise, Activate script
		//4. If NPC, face towards us
		
		var _activateX = x + lengthdir_x(40, direction);
		var _activateY = y + lengthdir_y(40, direction);
		var _activateSize = 16;
		var _activateList = ds_list_create();
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
								_activateX - _activateSize,
								_activateY - _activateSize,
								_activateX + _activateSize,
								_activateY + _activateSize,
								par_entity,
								false,
								true,
								_activateList,
								true);
		//if the first instance we find is either our lifted entity or it has no script: try the next one.
		while (_entitiesFound > 0)
		{
			var _check = _activateList[| --_entitiesFound];
			if (_check != global.iLifted) && (_check.entityActivateScript != -1)
			{
				activate = _check;
				break;
			}
		}	
		
		ds_list_destroy(_activateList);
		
		if (activate != noone) {
			//Activate Entity
			scriptExecuteArray(activate.entityActivateScript, activate.entityActiveArgs);
			//Make NPC face Player
			if (activate.entityNPC) {
				with(activate) {
					direction = point_direction(x,y,other.x,other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
		
		
	}
	
	//Dash key logic
	if (keyDash) {
		if (state == playerStateFree) {
			state = playerStateDash;
			moveDistanceRemaining = distanceDash;
		}
	}
	
	//Use Items
	if (keyItem) && (!keyAct)
	{
		
	}

}


function playerStateLocked(){
	//Do nothing
}


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
	
	part_particles_create(global.pSystem,x,y-10,global.dashParticle,10);
	part_particles_create(global.pSystem,x,y,global.dashParticle,10);
	
	//Change State
	if (moveDistanceRemaining <= 0) {
		state = playerStateFree;	
	}
	
	if (_collided) {
	 	state = playerStateBonk;
		moveDistanceRemaining = distanceBonk;
		screenShake(6,30);
	}
}


function playerStateBonk(){
	//Movement
	hSpeed = lengthdir_x(speedBonk, direction - 180);
	vSpeed = lengthdir_y(speedBonk, direction - 180);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedBonk);
	var _collided = playerCollision();
	
	//Update Sprite
	sprite_index = spr_player_idle; //TODO change for hurt sprite
	image_index = CARDINAL_DIR; // - 2 to reverse
	
	//Change Height
	z = sin(((moveDistanceRemaining / distanceBonk) * pi)) * distanceBonkHeight;
	
	//Change State
	if (moveDistanceRemaining <= 0) {
		state = playerStateFree;	
	}
	
}


function playerStateAttack(){
	script_execute(stateAttack);
}

function playerStateTransition(){
	
	playerCollision();
	
	playerAnimateSprite();
	
}

function playerStateAct(){

	playerAnimateSprite();
	
	if (animationEnd) {
		state = playerStateFree;
		animationEnd = false;
		if (animationEndScript != -1) {
			script_execute(animationEndScript);
			animationEndScript = -1;
		}
	}

}


function playerStateDead()
{
	hSpeed = 0;
	vSpeed = 0;
	
	//if just arriving in this state
	if (sprite_index != spr_player_die) && (sprite_index != spr_player_dead)
	{
		//update the sprite
		sprite_index = spr_player_die;
		image_index = 0;
		image_speed = 0.9;
	}
	
	//Animation ending this frame?
	if (image_index + image_speed > image_number)
	{
		if (sprite_index == spr_player_die)
		{
			image_speed = max(0, image_speed-0.05);
			if (image_speed < 0.07)
			{
				image_index = 0;
				sprite_index = spr_player_dead;
				image_speed = 1.0;
			}
		}
		else
		{
			image_speed = 0;
			image_index = image_number-1;
			global.targetX = -1;
			global.targetY = -1;
			roomTransition(TRANS_TYPE.SLIDE, rm_grass);
		}
	}
}