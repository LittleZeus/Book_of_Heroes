
function batChase(){
	sprite_index = sprMove;
	
	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		if (_distanceToGo > enemySpeed)
		{
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		}
		else
		{
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		//Collide & Move
		enemyTileCollision();
		
	}
	
}

function batChaseRanged(){
	sprite_index = sprMove;
	
	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		if (_distanceToGo > enemySpeed)
		{
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		}
		else
		{
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		//Collide & Move
		enemyTileCollision();
		
		
		if (point_distance(x,y,target.x,target.y) <= enemyAttackRadius)
		{
			if (attackCooldown == 0) 
			{
				// spawn projectile
				var projectile = instance_create_layer(x,y,"Instances",obj_screech);
				projectile.parent = self;
				projectile.offsetY = 50;
				projectile.speed = 4;
				projectile.direction = point_direction(x,y-projectile.offsetY,target.x,target.y-45);
				attackCooldown = 90;
			}
		}
		attackCooldown--;
		attackCooldown = max(0,attackCooldown);
	}
	
}

function batWander(){
	sprite_index = sprMove;
	image_speed = 1.0;
	
	//At destination or given up
	if ((x == xTo) && (y ==yTo)) || (timePassed > enemyWanderDistance / enemySpeed)
	{
		hSpeed = 0;
		vSpeed = 0;

		
		//Set new target destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45,45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	}
	else //Move towards new destination
	{
		timePassed++;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_speedThisFrame,dir);
		vSpeed = lengthdir_y(_speedThisFrame,dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Collide & move
		var _collided = enemyTileCollision();
	}
	
	//Check for aggro
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(obj_player)) && (point_distance(x,y,obj_player.x,obj_player.y) <= enemyAggroRadius)
		{
			state = ENEMYSTATE.CHASE;
			target = obj_player;
		}
	}
}