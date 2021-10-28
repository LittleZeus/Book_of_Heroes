for (var i = 0; i < equipmentSlots; i+= 1)
{
	
	if (obj_mouse.inventoryHover == id) //&& (inventory[i].type != -1)
	{
		if (obj_mouse.slotHover == i) && (inventory[i].type != -1) && (global.playerEquipment.visible == true) && (obj_mouse.mouseOver == mouseOverState)
		{
			var xx = x + ((i mod rowLength) * (50+margin)) + border + margin;
			var yy = y + (((i div rowLength) * (50+margin)) + border + margin);
			global.itemHoverEquipment.hoverX = xx;
			global.itemHoverEquipment.hoverY = yy;
			global.itemHoverEquipment.hoverX2 = xx + sprite_get_width(spr_inv_box);
			global.itemHoverEquipment.hoverY = yy + sprite_get_height(spr_inv_box);
			global.itemHoverEquipment.x = mouse_x-global.cameraX;
			global.itemHoverEquipment.y = mouse_y-global.cameraY;
			global.itemHoverEquipment.itemSelected = inventory[i];
			global.itemHoverEquipment.visible = true;
		}
	}
	else 
	{//TODO might move to obj_itemHover
		global.itemHoverEquipment.visible = false;
	}
}