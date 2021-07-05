/// @description Insert description here
// You can write your code in this editor

if(other.id == _creator )exit;

//Check if the object is part of our faction
if(other.faction == faction) exit;

//Damage Object
//if not damaged before
if !faction_collided {
	faction_collided = true;
	take_damage(other,1);
	knockback(x,y,other,50);
}