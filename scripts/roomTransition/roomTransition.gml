
function roomTransition(_type, targetroom){
	if (!instance_exists(obj_transition)) {
		with (instance_create_depth(0,0,-9999,obj_transition)) {
			type = _type;
			target = targetroom;
		}
	} else show_debug_message("Trying to transition while transition is happening!");
}