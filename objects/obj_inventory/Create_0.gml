
child = -1;
parent = -1;

depth = -10
visible = false;

border = 15;
margin = 5;

rowLength = 6;

heightOffset = 0;

width = (border*2)+(rowLength)*(50+margin) + margin;
height = (border*2)+(((INVENTORY_SLOTS-1) div rowLength)+1)*(50+margin) + margin;

inventory = array_create(INVENTORY_SLOTS);
//Defaulting array
for (var i = 0; i < INVENTORY_SLOTS; i += 1)
{
	inventory[i] = new item();
}

inventory[0].set(ITEMTYPE.USE,spr_item_test,1,"Bomb","Desc: ...Test...","Common",10,EQUIPMENT.HELMET,"Armor:10");
inventory[0].equipable = true;

inventory[1].set(ITEMTYPE.USE,spr_item_test2,1,"Arrow","Desc: ...Test...","Rare",20,EQUIPMENT.CHEST,"Attack:10");
inventory[1].equipable = true;