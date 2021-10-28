
function enemyTileCollision(){
	
	var _collision = false;
	
	//Horizontal Tiles
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y)) {
		x -= x mod TILE_SIZE;
		if(sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
		_collision = true;
		
	}
	x += hSpeed;
	
	//Vertical Tiles
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed)) {
		y -= y mod TILE_SIZE;
		if(sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	}
	y += vSpeed;
	
	return _collision;
}

function enemyWait(){
	if (++stateWait >= stateWaitDuration)
	{
		stateWait = 0;
		state = stateTarget;
	}
}

function enemyHurt() {
	
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	if (_distanceToGo > enemySpeed)
	{
		image_speed = 1;
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(enemySpeed,dir);
		vSpeed = lengthdir_y(enemySpeed,dir);
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		//Collide & move, if theres a collision, then stop knockback
		if (enemyTileCollision())
		{
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		if (statePrevious != ENEMYSTATE.ATTACK) state = statePrevious; else state = ENEMYSTATE.CHASE;
	}
}

function enemyDie(){
	
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	if (_distanceToGo > enemySpeed)
	{
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(enemySpeed,dir);
		vSpeed = lengthdir_y(enemySpeed,dir);
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		//Collide & move, if theres a collision, then stop knockback
		if (enemyTileCollision())
		{
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
	}
	
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)
	{
		instance_destroy();
	}
}