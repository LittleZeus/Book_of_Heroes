function mouseOverState(){
	//empty hover results
	slotHover = -1;
	inventoryHover = -1;
	
	var mouseInMenuButton = false;
	var mouseInMenuInventory = false;
	var mouseInMenuEquipment = false;
	var mouseInMenuWindow = false;
	
	//mouse coordinates
	var mx = mouse_x;
	var my = mouse_y;
	
	with(obj_popup)
	{
		if (point_in_rectangle(
				mx,
				my,
				x+global.cameraX,
				y+global.cameraY,
				x+width+global.cameraX,
				y+height+global.cameraY))
		{
			popup = true;
			var xx = x + (width*0.5) + global.cameraX;
			var yy = y + height - buttonHeight - 20 + global.cameraY;
			
			//Accept Button
			if (point_in_rectangle(mx,my,xx - buttonWidth - 10,yy,xx - 10,yy + buttonHeight))
			{
				acceptHover = true;
				if (mouse_check_button_pressed(mb_left)) 
				{
					if (acceptScript != -1)
					{
						acceptScript();
					}
				}
			} else acceptHover = false;
			
			//Decline Button
			if (point_in_rectangle(mx,my,xx + 10,yy,xx + 10 + buttonWidth,yy + buttonHeight))
			{
				declineHover = true;
				if (mouse_check_button_pressed(mb_left)) 
				{
					if (declineScript != -1)
					{
						declineScript();
					}
				}
			} else declineHover = false;
		}
		else popup = false;
	}
	
	if (!popup)
	{
		//check for inventory slot hover
		with(obj_inventory)
		{
			if (point_in_rectangle(
					mx,
					my,
					x+global.cameraX,
					y+global.cameraY,
					x+width+global.cameraX,
					y+height+heightOffset+global.cameraY))
			{
				if (visible) mouseInMenuInventory = true;
				//check for mouseover in each slot
				for (var i = 0; i < INVENTORY_SLOTS; i += 1)
				{
					var xx = x + global.cameraX + ((i mod rowLength) * (50+margin)) + border + margin;
					var yy = y + global.cameraY + ((i div rowLength) * (50+margin)) + border + margin + heightOffset;
					if (point_in_rectangle(mx,my,xx,yy,xx+50,yy+50))
					{
						other.slotHover = i;
						other.inventoryHover = id;
						if (mouse_check_button(mb_right)) && (inventory[i].name != -1)
						{
							createUseItemMenu(inventory[i],other.inventoryHover,other.slotHover);
						}
					}
				}
			} else if (visible) mouseInMenuInventory = false;
					
		}
	
		with(obj_equipment)
		{
			if (point_in_rectangle(
					mx,
					my,
					x+global.cameraX,
					y+global.cameraY,
					x+width+global.cameraX,
					y+height+global.cameraY))
			{
				if (visible) mouseInMenuEquipment = true;
				//check for mouseover in each slot
				for (var i = 0; i < equipmentSlots; i += 1)
				{
					var xx = x + global.cameraX + ((i mod rowLength) * (50+margin)) + border + margin;
					var yy = y + global.cameraY + ((i div rowLength) * (50+margin)) + border + margin;
					if (point_in_rectangle(mx,my,xx,yy,xx+50,yy+50))
					{
						other.slotHover = i;
						other.inventoryHover = id;
						if (mouse_check_button(mb_right)) && (inventory[i].name != -1)
						{
							createUseItemMenu(inventory[i],other.inventoryHover,other.slotHover);
						}
					}
				}
			} else mouseInMenuEquipment = false;
					
		}
	
		with(obj_button)
		{
			//Check mouse over button
			if (point_in_rectangle(mx,my,self.xx,self.yy,self.xx+width,self.yy+height))
			{
				if (visible) mouseInMenuButton = true;
				if (hoverFunc != -1) hoverFunc();
				if (mouse_check_button_pressed(mb_left)) 
				{
					image_blend = c_grey;
					clicked = true;
				}
				if (mouse_check_button(mb_left)) && (greyout == false) && (interactTime <= 0)
				{
					if (onClickFunc != -1) onClickFunc();
				}
			
			} else mouseInMenuButton = false;
			if (mouse_check_button_released(mb_left)) 
			{
				image_blend = c_white;
				clicked = false;
			}
		}
	}
	
	global.mouseInMenu = min(1,mouseInMenuInventory+mouseInMenuEquipment+mouseInMenuButton+mouseInMenuWindow);
}

function mouseOverUseItem(){
	//mouse coordinates
	var mx = mouse_x;
	var my = mouse_y;
	
	with (obj_useItem)
	{
		if (point_in_rectangle(
					mx,
					my,
					x-border+global.cameraX,
					y-border+global.cameraY,
					x+width+(border*2)+global.cameraX,
					y+height+(border*2)+global.cameraY))
		{
			for (var i=0; i<USE_ITEM_OPTIONS;i++)
			{
				if (point_in_rectangle(
						mx,
						my,
						x+global.cameraX,
						y+itemNameHeight+(buttonHeight*i)+global.cameraY,
						x+width+global.cameraX,
						y+itemNameHeight+(buttonHeight*i)+buttonHeight+global.cameraY))
				{
					//button slot hover
					buttonHover[i] = 1;
					if (mouse_check_button_released(mb_left)) 
					{
						optionFunctions[i]();
					}
				} else buttonHover[i] = 0;
			}
		}
		else
		{
			if (mouse_check_button_released(mb_left)) 
			{
				//clicked off close self
				instance_destroy();
			}
		}
		if (mouse_check_button_pressed(mb_right))
		{
			instance_destroy();
		}
	}
}