function attackSlash(){
	if (sprite_index != spr_player_cast)
	{
		//Setup correct animation
		sprite_index = spr_player_cast;
		localFrame = 0;
		image_index = 0;
		
		//Clear hit list
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
	}
	
	count_move_arr();
	if (inputMagnitude) move_modifier=movement_array(movement_arr);


	//Handle Player Movement
	var spdmod = 0.5;
	hSpeed=lengthdir_x(inputMagnitude*move_speed*move_modifier*spdmod,inputDirection);
	vSpeed=lengthdir_y(inputMagnitude*move_speed*move_modifier*spdmod,inputDirection);

	playerCollision();

	move_wrap(true,true,sprite_width);

	/*//Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude !=0) {
		direction = inputDirection;
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;
	if(_oldSprite != sprite_index) localFrame = 0;*/
	
	//Spawn a projectile object to attack.
	if !((instance_exists(obj_swipe)) && (obj_swipe.parent == self))
	{
		attackCooldown = 15;
		var swipe = instance_create_layer(x,y,"Instances",obj_swipe);
		swipe.parent = self;
		swipe.maxLifetime = 12;
		swipe.offsetY = 45;
		swipe.image_angle = point_direction(x,y-swipe.offsetY,mouse_x,mouse_y);
	}
	
	//calAttack(spr_player_attack_slash_hb);
	
	//Update sprite
	playerAnimateSprite();
	
	if (animationEnd)
	{
		state = playerStateFree;
		animationEnd = false;
	}
}

function calAttack(mask){

	mask_index = mask;

	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,par_entity,hitByAttackNow,false);
	if(hits > 0) {	
		for(var i = 0; i < hits; i++) {
			//if this instance has not yet been hit by this attack, hit it!
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1) {
				ds_list_add(hitByAttack, hitID);
				with(hitID) {
					if (object_is_ancestor(object_index, par_enemy))
					{
						hurtEnemy(id, 5, other.id, 50);
					}
					else if (entityHitScript != -1) script_execute(entityHitScript);
				
				}
			}
		}
	
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = spr_player_idle;

}

function hurtEnemy(_enemy, _damage, _source, _knockback) {
	
	with(_enemy)
	{
		if (state != ENEMYSTATE.DIE)
		{
			enemyHP -= _damage;
			flash = 1;
			
			var dmg_num = instance_create_depth(x,y,-5,obj_damage_number);
			dmg_num.damage = _damage;
			
			//Hurt or dead?
			if (enemyHP <= 0)
			{
				state = ENEMYSTATE.DIE;
			}
			else
			{
				if (state != ENEMYSTATE.HURT) statePrevious = state;
				state = ENEMYSTATE.HURT;
			}
			
			image_index = 0;
			if (_knockback != 0) 
			{
				var _knockDirection = point_direction(x,y,_source.x,_source.y);
				xTo = x - lengthdir_x(_knockback, _knockDirection);
				yTo = y - lengthdir_y(_knockback, _knockDirection);
			}
		}
	}
}

function hurtPlayer(_direction,_force,_damage) {
	
	if (obj_player.invulnerable <= 0)
	{
		global.playerHealth = max(0, global.playerHealth-_damage);
		
		if(global.playerHealth > 0)
		{
			with(obj_player)
			{
				state = playerStateBonk;
				direction = _direction - 180;
				moveDistanceRemaining = _force;
				screenShake(8,10);
				flash = 0.7;
				invulnerable = 90;
				flashShader = sha_RedFlash;
			}
		}
		else
		{
			//kill the player
			with (obj_player) state = playerStateDead;
		}
	}
}