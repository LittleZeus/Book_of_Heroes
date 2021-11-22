// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item(_id,_type,_sprite,_amount,_name,_desc,_rarity,_value,_equipmentSlot,_stats) constructor {
	
		if (_id == undefined) identifier = -1;
		else identifier = _id;
		if (_type == undefined) type = -1;
		else type = _type;
		if (_sprite == undefined) sprite = -1;
		else sprite = _sprite;
		if (_amount == undefined) amount = -1;
		else amount = _amount;
		if (_name == undefined) name = -1;
		else name = _name;
		if (_desc == undefined) desc = -1;
		else desc = _desc;
		if (_rarity == undefined) rarity = -1;
		else rarity = _rarity;
		if (_value == undefined) value = -1;
		else value = _value;
		if (_equipmentSlot == undefined) equipmentSlot = -1;
		else equipmentSlot = _equipmentSlot;
		if (_stats == undefined) stats = -1;
		else stats = _stats;
			
		equipable = false;
	
	set = function(_id,_type, _sprite, _amount, _name, _desc, _rarity, _value, _equipmentSlot, _stats)
	{
		identifier = _id;
		type = _type;
		sprite = _sprite;
		amount = _amount;
		name = _name;
		desc = _desc;
		rarity = _rarity;
		value = _value;
		equipmentSlot = _equipmentSlot;
		stats = _stats;
	}
	
	use = function()
	{
	show_debug_message("Use function triggered.")	
	};
}

