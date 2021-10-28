if (itemDrag != -1)
{
	draw_set_alpha(0.5);
	draw_sprite(itemDrag.sprite,0,mouse_x-global.cameraX ,mouse_y-global.cameraY);
	draw_set_alpha(1.0);
}