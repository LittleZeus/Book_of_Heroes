
if ((greyout)or(!clicked)) {
	exit;
}
clicked = false;

var button_amount = 4;
var xx = global.displayWidth*0.6;
var yy = global.displayHeight*0.35;

layer_destroy_instances("Menu_Buttons");

var dropdown_window = instance_create_layer(xx,yy,"Menu_Buttons",obj_dropdown_button);
dropdown_window.listValues[0] = "Fullscreen";
dropdown_window.listText[0] = "Fullscreen";
dropdown_window.listValues[1] = "Windowed";
dropdown_window.listText[1] = "Windowed";
dropdown_window.listValues[2] = "Borderless";
dropdown_window.listText[2] = "Borderless";

var index = -1;
for (var i=0;i<=array_length(dropdown_window.listValues);i++;) {
	if (global.option_window == dropdown_window.listValues[i]) {
		index = i;
	}
}
if (index != -1) {
	dropdown_window.value = dropdown_window.listValues[index];
	dropdown_window.text = dropdown_window.listText[index];
}


var dropdown_resolution = instance_create_layer(xx,yy+150,"Menu_Buttons",obj_dropdown_button);
dropdown_resolution.listValues[0] = "3840 x 2160";
dropdown_resolution.listText[0] = "3840 x 2160";
dropdown_resolution.listValues[1] = "3440 x 1440";
dropdown_resolution.listText[1] = "3440 x 1440";
dropdown_resolution.listValues[2] = "2560 x 1440";
dropdown_resolution.listText[2] = "2560 x 1440";
dropdown_resolution.listValues[3] = "1920 x 1200";
dropdown_resolution.listText[3] = "1920 x 1200";
dropdown_resolution.listValues[4] = "1920 x 1080";
dropdown_resolution.listText[4] = "1920 x 1080";
dropdown_resolution.listValues[5] = "1600 x 900";
dropdown_resolution.listText[5] = "1600 x 900";
dropdown_resolution.listValues[6] = "1366 x 768";
dropdown_resolution.listText[6] = "1366 x 768";
dropdown_resolution.listValues[7] = "1280 x 1024";
dropdown_resolution.listText[7] = "1280 x 1024";

var index = -1;
for (var i=0;i<=array_length(dropdown_resolution.listValues);i++;) {
	if (global.option_resolution == dropdown_resolution.listValues[i]) {
		index = i;
	}
}
if (index != -1) {
	dropdown_resolution.value = dropdown_resolution.listValues[index];
	dropdown_resolution.text = dropdown_resolution.listText[index];
}

var apply = instance_create_layer(xx,yy+300,"Menu_Buttons",obj_apply_options_button);
apply.dropdown_window = dropdown_window;
apply.dropdown_resolution = dropdown_resolution;

var back = instance_create_layer(xx,yy+450,"Menu_Buttons",obj_back_button);

var container = instance_create_layer(xx-50,yy-25,"Menu_Buttons",obj_button_container);

container.height = button_amount*150;