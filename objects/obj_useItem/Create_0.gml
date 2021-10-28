with(obj_itemHover) 
{
	visible = false;
}
with (obj_mouse)
{
	mouseOver = mouseOverUseItem;
	inventoryHover = -1;
	slotHover = -1;
	inventoryDrag = -1;
	slotDrag = -1;
	itemDrag = -1;
}

x = mouse_x-global.cameraX;
y = mouse_y-global.cameraY;

buttonHover = array_create(USE_ITEM_OPTIONS,0);
border = 10;
width = 100;
buttonHeight = 50;
itemNameHeight = 25;
height = itemNameHeight+(buttonHeight*USE_ITEM_OPTIONS);

itemSelected = -1;
invParent = -1;
invSlot = -1;

optionFunctions = array_create(USE_ITEM_OPTIONS,-1);
optionName = array_create(USE_ITEM_OPTIONS,-1);

optionName[0] = "Use";
optionName[1] = "Something";
optionName[2] = "Drop";

optionFunctions[0] = function() //use
{
	invParent.inventory[invSlot].use();
	instance_destroy();
}

optionFunctions[1] = function() //Something
{
	
}

optionFunctions[2] = function() //drop
{
	inventoryDrop(obj_player.x,obj_player.y,itemSelected,invParent,invSlot);
	instance_destroy();
}