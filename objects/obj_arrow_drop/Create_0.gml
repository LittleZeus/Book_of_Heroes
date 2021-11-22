// Inherit the parent event
event_inherited();

itemPickup.set(ITEMID.ARROW,ITEMTYPE.USE,spr_item_test2,1,"Arrow","Desc: ...Test...","Rare",20,EQUIPMENT.CHEST,"Attack:10");

collectScriptArg = [global.playerInventory, itemPickup];
