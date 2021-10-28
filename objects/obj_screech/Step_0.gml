/// @description Hit things

//Spawn particles

part_particles_create(global.pSystem,x,y,projectileParticle,1);

var _entity = instance_place(x,y,obj_player);
var _break = false;
if (_entity != noone)
{
	with (_entity)
	{
		if (object_index == obj_player)
		{
			hurtPlayer(point_direction(other.x,other.y,x,y),50,2);
			_break = true;
		}
		else
		{
			if (entityHitScript != -1)
			{
				script_execute(entityHitScript);
				_break = true;
			}
		}		
	}
	if (_break) instance_destroy();	
}

//destroy if we leave the camera bounds
var _cam = view_camera[0];
var _camX = camera_get_view_x(_cam);
var _camY = camera_get_view_y(_cam);
if (!point_in_rectangle(x,y,_camX,_camY,_camX+camera_get_view_width(_cam),_camY+camera_get_view_height(_cam)))
{
	instance_destroy();
}