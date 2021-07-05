
if ((dropdown_window != undefined)and(dropdown_resolution != undefined)) {
	if ((dropdown_window.value==global.option_window)and
		(dropdown_resolution.value==global.option_resolution)) {
		greyout = true;
	} else {
		greyout = false;
	}
}

if ((greyout)or(!clicked)) {
	exit;
}

clicked = false;

if (dropdown_window.value!=global.option_window) {
	if (dropdown_window.value=="Fullscreen")
	{
		window_set_fullscreen(true);
	} else if (dropdown_window.value=="Windowed") {
		window_set_fullscreen(false);
	} else if (dropdown_window.value=="Borderless") {
		//TODO borderless
		window_set_fullscreen(false);
	}
	global.option_window=dropdown_window.value;
}

if (dropdown_resolution.value!=global.option_resolution) {
	var msg = dropdown_resolution.value;
	var splitBy = "x";
	var slot = 0;
	var splits; 
	var str2 = ""; 

	var i;
	for (i = 1; i < (string_length(msg)+1); i++) {
	    var currStr = string_copy(msg, i, 1);
	    if (currStr == splitBy) {
	        splits[slot] = str2; 
	        slot++;
	        str2 = "";
	    } else {
	        str2 = str2 + currStr;
	        splits[slot] = str2;
	    }
	}
	
	var width = real(splits[0]);
	var height = real(splits[1]);
	
	global.option_resolution = dropdown_resolution.value;
	global.displayHeight = height;
	global.displayWidth = width;
	global.displayScale = height/global.cameraHeight;
	display_set_gui_size(width,height);
	window_set_size(width,height);
	surface_resize(application_surface,width,height);
	
	mainmenu();
}
	
