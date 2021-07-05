/// @description Insert description here
// You can write your code in this editor
image_angle -= angle_incr;

x = _creator.x;
y = _creator.y + offset;

lifetimeCounter++;
if(lifetimeCounter>=lifetime) {	
	instance_destroy();
	lifetimeCounter = 0;
}