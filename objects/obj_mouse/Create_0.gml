// @desc State Machine
inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;
popup = false;

depth = -11;

mouseOver = mouseOverState;
	
stateFree = function(){
	mouseOver();
	//Start to drag an item if slot is not empty
	if (mouse_check_button(mb_left)) && (slotHover != -1) && (inventoryHover.inventory[slotHover].type != -1)
	{
		//Enter drag state
		state = stateDrag;
		itemDrag = inventoryHover.inventory[slotHover];
		inventoryDrag = inventoryHover;
		slotDrag = slotHover;
	}
}

stateDrag = function(){
	mouseOver();
	if (!mouse_check_button(mb_left))
	{
		//Swap with slot if hovering
		if (slotHover != -1) 
		{
			if (inventoryHover.object_index == obj_equipment)
			{
				// Trying to put item in equipment slot
				if (itemDrag.equipable == true) && (itemDrag.equipmentSlot == slotHover)
				{
					inventorySwap(inventoryDrag,slotDrag,inventoryHover,slotHover);
				}
			}
			else
			{
				inventorySwap(inventoryDrag,slotDrag,inventoryHover,slotHover);
			}
		}
		
		if !(global.mouseInMenu) //Not over any menu
		{
			inventoryDrop(mouse_x,mouse_y,itemDrag,inventoryDrag,slotDrag,0) // drop item at mouse
		}
		
		//Return to free state
		state = stateFree;
		itemDrag = -1;
		inventoryDrag = -1;
		slotDrag = -1;
	}	
}

state = stateFree;