// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function top_instance_position(xx,yy,object){

	var instance_list = ds_list_create();

	var inst = instance_position(xx,yy,object);

	var top_instance = inst;

	while instance_exists(inst) {
		ds_list_add(instance_list,inst);
		instance_deactivate_object(inst);
		if inst.depth < top_instance.depth {
			top_instance = inst;
		}
	inst = instance_position(xx,yy,object);
	}
	
	while ds_list_size(instance_list) > 0 {
		instance_activate_object(instance_list[| 0]);
		ds_list_delete(instance_list,0);
	}
	
	ds_list_destroy(instance_list);
	
	return top_instance;
}