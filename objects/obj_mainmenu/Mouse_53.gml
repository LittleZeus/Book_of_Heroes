/// @description Insert description here
// You can write your code in this editor
with(obj_button) {
	clicked = false;	
}

var instance = top_instance_position(mouse_x, mouse_y, obj_button);
if instance_exists(instance) {
	instance.clicked = true;
}