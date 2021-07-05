
if ((mouse_check_button_pressed(mb_left)) and 
	(!point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width,y+sprite_height)) and
	(open)) {
	instance_destroy(container);
	container = undefined;
	
	for ( var i=0; i<=array_length(option)-1; i++) {
		if (option[i] != undefined) {
			instance_destroy(option[i]);
			option[i] = undefined;
		}
	}
	open = false;
}

//Button Clicked

if ((greyout)or(!clicked)) {
	exit;
}
clicked = false;

//create/remove dropdown container
if (!open) {
	container = instance_create_layer(
			draw_x,
			draw_y + 100,
			"Menu_Buttons",
			obj_dropdown_container
			);
		
	container.depth = 0;
	container.listValues = listValues;
	container.listSize = array_length(listValues);
	
	for ( var i=0; i<=array_length(listValues)-1; i++) {
		option[i] = instance_create_layer(
				draw_x,
				draw_y + 120 + 100*i,
				"Menu_Buttons",
				obj_dropdown_option
				);
		option[i].text = listText[i];
		option[i].value = listValues[i];
		option[i].depth = -1;
		option[i]._creator = self;
	}
	
	open = true;
} else {
	instance_destroy(container);
	container = undefined;
	
	for ( var i=0; i<=array_length(option)-1; i++) {
		if (option[i] != undefined) {
			instance_destroy(option[i]);
			option[i] = undefined;
		}
	}
	open = false;
}