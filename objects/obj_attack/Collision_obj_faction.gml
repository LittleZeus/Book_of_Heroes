/// @description Insert description here
// You can write your code in this editor

if(other.id == _creator )exit;

//Check if the object is part of our faction
if(other.faction == faction) exit;

//Damage Object
//if not damaged before
if !ds_list_empty(collision_list) {
	for(var i=0; i<=ds_list_size(collision_list); i++;) {
		if (other==collision_list[| i]) {
			exit;
		}
	}
}
	
ds_list_add(collision_list,other);
take_damage(other,damage);
knockback(x,y,other,_knockback);