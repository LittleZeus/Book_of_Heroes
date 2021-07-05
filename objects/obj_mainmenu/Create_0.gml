// Retrieve options somehow

global.option_window = "Windowed";
global.option_resolution = "3840 x 2160";

if (global.option_window=="Fullscreen")
{
	window_set_fullscreen(true);
} else if (global.option_window=="Windowed") {
	window_set_fullscreen(false);
} else if (global.option_window=="Borderless") {
	//TODO borderless
	window_set_fullscreen(false);
}
