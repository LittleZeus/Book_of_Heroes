/// @description Insert description here
// You can write your code in this editor
with(obj_button) {
	clicked = false;	
}

var instance = top_instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button);
if instance_exists(instance) {
	instance.clicked = true;
}