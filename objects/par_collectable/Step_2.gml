if ((current_time mod 22) == 0) part_particles_create(global.pSystem,x,y,collectableParticle,1);

flash = max(0,flash-0.05);
fric = 0.05;
if (z == 0) fric = 0.10;
lifetime++;

//magnetise
if (instance_exists(obj_player))
{
	var _px = obj_player.x;
	var _py = obj_player.y;
	var _dist = point_distance(x,y,_px,_py);
	if (_dist < magnetRadius) && (lifetime > interactionTime) //Magnet radius
	{
		spd += 0.10;
		direction = point_direction(x,y,_px,_py);
		spd = min(spd, 6);
		fric = 0;
		if (_dist < collectRadius) //Collect radius
		{
			if (collectScriptArg != -1)
			{
				scriptExecuteArray(collectScript,collectScriptArg);
			}
			else
			{
				if (collectScript != -1) script_execute(collectScript);
			}
			instance_destroy();
		}
	}
}


//Bounce
if(bounceCount != 0) {
	bounce += (pi * bounceSpeed);
	if (bounce > pi) {
		bounce -= pi;
		bounceHeight *= bounceReduction;
		bounceCount--;
	}
	z = sin(bounce) * bounceHeight;
}
else z = 0;

x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);
spd = max(spd-fric,0);
depth = -bbox_bottom;
