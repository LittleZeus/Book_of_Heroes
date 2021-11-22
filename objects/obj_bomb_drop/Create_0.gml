// Inherit the parent event
event_inherited();

itemPickup.set(ITEMID.ARROW,ITEMTYPE.USE,spr_item_test,1,"Bomb","Desc: ...Test...","Common",10,EQUIPMENT.HELMET,"Armor:10");

collectScriptArg = [global.playerInventory, itemPickup];