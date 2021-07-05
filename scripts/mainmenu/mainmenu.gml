// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mainmenu(){

var xx = global.displayWidth*0.6;
var yy = global.displayHeight*0.35;

layer_destroy_instances("Menu_Buttons");



instance_create_layer(
		xx,
		yy,
		"Menu_Buttons",
		obj_start_button
		);
		
instance_create_layer(
		xx,
		yy+150,
		"Menu_Buttons",
		obj_continue_button
		);

instance_create_layer(
		xx,
		yy+300,
		"Menu_Buttons",
		obj_options_button
		);

instance_create_layer(
		xx,
		yy+450,
		"Menu_Buttons",
		obj_exit_button
		);
		
instance_create_layer(
		xx-50,
		yy-25,
		"Menu_Buttons",
		obj_button_container
		);
		
}