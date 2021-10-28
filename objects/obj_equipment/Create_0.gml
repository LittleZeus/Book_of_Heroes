parent = -1;
child = -1;

depth = -10

border = 20;
margin = 10;

rowLength = 5;

equipmentSlots = EQUIPMENT.TYPE_COUNT;

width = (border*2)+(rowLength)*(50+margin) + margin;
height = (border*2)+(((equipmentSlots-1) div rowLength)+1)*(50+margin) + margin;

y -= height;

inventory = array_create(equipmentSlots);
//Defaulting array
for (var i = 0; i < equipmentSlots; i += 1)
{
	inventory[i] = new item();
}
