for (var i = 0; i < INVENTORY_SLOTS; i+= 1)
{
	
	if (obj_mouse.inventoryHover == id) //&& (inventory[i].type != -1)
	{
		if (obj_mouse.slotHover == i) && (inventory[i].type != -1) && (global.playerInventory.visible == true) && (obj_mouse.mouseOver == mouseOverState)
		{
			var xx = x + ((i mod rowLength) * (50+margin)) + border + margin;
			var yy = y + ((i div rowLength) * (50+margin)) + border + margin;
			global.itemHoverInventory.hoverX = xx;
			global.itemHoverInventory.hoverY = yy;
			global.itemHoverInventory.hoverX2 = xx + sprite_get_width(spr_inv_box);
			global.itemHoverInventory.hoverY = yy + sprite_get_height(spr_inv_box);
			global.itemHoverInventory.x = mouse_x-global.cameraX;
			global.itemHoverInventory.y = mouse_y-global.cameraY;
			global.itemHoverInventory.itemSelected = inventory[i];
			windowVisible(global.itemHoverInventory, true);
		}
	}
	else 
	{//TODO might move to obj_itemHover
		windowVisible(global.itemHoverInventory, false);
	}
}