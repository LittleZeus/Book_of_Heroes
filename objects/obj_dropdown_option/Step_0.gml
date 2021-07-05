/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(_creator)) {
	instance_destroy();
}


//Button Clicked

if ((greyout)or(!clicked)) {
	exit;
}
clicked = false;

//return text to original
_creator.text = text;
_creator.value = value;