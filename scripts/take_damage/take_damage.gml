// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function take_damage(_target, damage){

	with (_target){
		
		var dmg_num = instance_create_layer(x,y,"Menu_Buttons",obj_damage_number);
		dmg_num.damage = damage;
		
		HP -= damage;

		if(HP <=0){
			instance_destroy();
		}
	}

}