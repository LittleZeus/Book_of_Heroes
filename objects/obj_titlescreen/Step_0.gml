
if (!keyPressed)
{
	titleVisible = min(1,titleVisible + 0.01);
}
else
{
	titleVisible = min(1,titleVisible + 0.01);
	menuVisible = min(1,menuVisible + 0.01);
}

if ((keyboard_check_pressed(vk_anykey)) || (mouse_check_button(mb_any))) 
{
	if (keyPressed == false) global.mainmenuButtons = instance_create_layer(x,y,"Instances",obj_mainmenu);
	keyPressed = true;
}
