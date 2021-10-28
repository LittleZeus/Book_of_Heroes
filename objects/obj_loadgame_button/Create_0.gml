// Hold buttons for loading game
loadButton = instance_create_layer(x,y,layer,obj_button);
loadButton.text = "Load";
loadButton.loadSlot = -1;
loadButton.height = 120;
loadButton.onClickFunc = loadGameButton;

	
deleteButton = instance_create_layer(x+loadButton.width+5,y,layer,obj_button);
deleteButton.text = "Delete";
deleteButton.loadSlot = -1;
deleteButton.height = loadButton.height;
deleteButton.width = deleteButton.height*1.2;
deleteButton.onClickFunc = deleteGameButton;
