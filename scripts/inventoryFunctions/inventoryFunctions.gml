
function inventorySearch(rootObject,itemType){
	for (var i = 0; i < INVENTORY_SLOTS; i += 1)
	{
		if (rootObject.inventory[i].type == itemType)
		{
			return(i);
		}
	}
	return(-1);
}

function inventoryRemove(rootObject,itemType) {
	var _slot = inventorySearch(rootObject,itemType);
	if (_slot != -1)
	{
		with(rootObject)
		{
			inventory[_slot].type  = -1;
			inventory[_slot].sprite = -1;
			inventory[_slot].amount = -1;
		}
		return true;
	}
	else return false;
}

function inventoryAdd(rootObject,item) {
	//Search for stack
	var _found = true;
	if (item.amount != -1)
	{
		var _slot = inventorySearch(rootObject,item.type);

		if (_slot == -1)
		{
			_found = false;
			var _slot = inventorySearch(rootObject,-1);
		}
	}
	else var _slot = inventorySearch(rootObject,-1);
	show_debug_message("slot: "+string(_slot));
	
	if (_slot != -1)
	{
		with(rootObject) 
		{
			if (_found)
			{
				inventory[_slot].amount += item.amount;
			}
			else inventory[_slot] = item;
			show_debug_message("itemType: "+string(item.type)+" itemSprite: "+string(item.sprite)+" itemAmount: "+string(item.amount));
		}
		return true;
	}
	else return false;
}

function inventorySwap(objectFrom,slotFrom,objectTo,slotTo){
	var _itemFrom = objectFrom.inventory[slotFrom];
	objectFrom.inventory[slotFrom] = objectTo.inventory[slotTo];
	objectTo.inventory[slotTo] = _itemFrom;
}

function inventoryDrop(xx,yy,itemDrop,inventoryDrag,slotDrag,dropSpeed = 4.5){
	var _angle = random(360);
	if (inventoryDrag.inventory[slotDrag].type != -1)
	{
		if (itemDrop.type != -1)
		{
			with (instance_create_layer(xx,yy,"Instances",obj_item)) {
				direction = _angle;
				spd = dropSpeed + random(1.5);
				itemPickup.set(	itemDrop.type,
								itemDrop.sprite,
								itemDrop.amount,
								itemDrop.name,
								itemDrop.desc,
								itemDrop.rarity,
								itemDrop.value,
								itemDrop.equipmentSlot,
								itemDrop.stats);
				if (itemDrop.sprite != -1) sprite_index = itemDrop.sprite;
				collectScriptArg = [global.playerInventory, itemPickup];
				show_debug_message("itemType: "+string(itemPickup.type)+" itemSprite: "+string(itemPickup.sprite)+" itemAmount: "+string(itemPickup.amount));
				inventoryDrag.inventory[slotDrag] = new item();
			}
		}
	}
	
}

function createUseItemMenu(_item,_parent,_slot)
{
	var _useItem = instance_create_depth(x,y,-11,obj_useItem);
	_useItem.itemSelected = _item;
	_useItem.invParent = _parent;
	_useItem.invSlot = _slot;
}

function createItem()
{
	var _item = new item();
	
	
	
	return _item;
}