randomize();
titleVisible = 0.0;
keyPressed = false;
menuVisible = 0.0;
loadingStarted = false;
fragAmount = 20;
fragPositionX = array_create(fragAmount,0);
fragPositionY = array_create(fragAmount,0);
fragIndex = array_create(fragAmount,-1);
fragSpeed = array_create(fragAmount,1);
fragRotation = array_create(fragAmount,0);
fragRotationSpeed = array_create(fragAmount,1);
fragScale = array_create(fragAmount,1);

depth = 1;

for (var _slot = 0; _slot <= 2; _slot++)
{
	var _filename = "save" + string(_slot) + ".sav";
	if (file_exists(_filename))
	{
		slotData[_slot] = loadJSONFromFile(_filename);
	}
	else slotData[_slot] = -1;
}