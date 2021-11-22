
function removeMenuButtons() 
{
	instance_destroy(obj_button);
	global.mainmenuButtons = -1;
}

function mainmenu() 
{

	removeMenuButtons();
	
	var xx = RESOLUTION_W*0.6;
	var yy = 150;
	
	if (global.mainmenuButtons == -1)
	{
		global.mainmenuButtons = array_create(5);

		global.mainmenuButtons[0] = instance_create_layer(
				xx,
				yy,
				"Instances",
				obj_button
				);
		global.mainmenuButtons[0].text = "New Game";
		global.mainmenuButtons[0].onClickFunc = newMenuButton;
		global.mainmenuButtons[0].sprite = spr_Button_NoEdge;
		
		global.mainmenuButtons[1] = instance_create_layer(
				xx,
				yy+(global.mainmenuButtons[0].height + 10),
				"Instances",
				obj_button
				);
		global.mainmenuButtons[1].text = "Continue";
		global.mainmenuButtons[1].onClickFunc = continueMenuButton;
		global.mainmenuButtons[1].loadSlot = getLatestSave();
		global.mainmenuButtons[1].sprite = spr_Button_NoEdge;
		if (global.mainmenuButtons[1].loadSlot == -1) global.mainmenuButtons[1].greyout = true;

		global.mainmenuButtons[2] = instance_create_layer(
				xx,
				yy+(global.mainmenuButtons[0].height + 10)*2,
				"Instances",
				obj_button
				);
		global.mainmenuButtons[2].text = "Load Game";
		global.mainmenuButtons[2].onClickFunc = loadMenuButton;
		global.mainmenuButtons[2].sprite = spr_Button_NoEdge;

		global.mainmenuButtons[3] = instance_create_layer(
				xx,
				yy+(global.mainmenuButtons[0].height + 10)*3,
				"Instances",
				obj_button
				);
		global.mainmenuButtons[3].text = "Options";
		global.mainmenuButtons[3].onClickFunc = optionMenuButton;
		global.mainmenuButtons[3].sprite = spr_Button_NoEdge;
		
		global.mainmenuButtons[4] = instance_create_layer(
				xx,
				yy+(global.mainmenuButtons[0].height + 10)*4,
				"Instances",
				obj_button
				);
		global.mainmenuButtons[4].text = "Exit";
		global.mainmenuButtons[4].onClickFunc = exitMenuButton;
		global.mainmenuButtons[4].sprite = spr_Button_NoEdge;
	}	
	
	return global.mainmenuButtons;	
}

function newMenuButton()
{
	//Newgame button
	//global.gameSaveSlot set as empty one
	global.gameState = GAMESTATE.GAMEPLAY;

	roomTransition(TRANS_TYPE.SLIDE,rm_landing);

	loadingStarted = true;
}

function continueMenuButton()
{
	//load the latest save	
	if (loadSlot != -1)
	{
		global.gameState = GAMESTATE.GAMEPLAY;
		loadGame(loadSlot); 
	}
}

function loadMenuButton()
{
	removeMenuButtons();
	
	var xx = RESOLUTION_W*0.6;
	var yy = 80;
	
	global.mainmenuButtons[0] = instance_create_layer(
			xx,
			yy,
			"Instances",
			obj_loadgame_button
			);
	
	global.mainmenuButtons[0].loadButton.loadSlot = "Auto";
	global.mainmenuButtons[0].deleteButton.loadSlot = "Auto";
	global.mainmenuButtons[0].loadButton.container = global.mainmenuButtons[0];
	global.mainmenuButtons[0].deleteButton.container = global.mainmenuButtons[0];
	if (saveExists(global.mainmenuButtons[0].loadButton.loadSlot)) 
	{
		//If save is found
		global.mainmenuButtons[0].loadButton.text = "Auto";
	} 
	else 
	{
		global.mainmenuButtons[0].loadButton.text = "-Empty-";
		global.mainmenuButtons[0].loadButton.onClickFunc = emptyLoadGameButton;
	}
	
	
	global.mainmenuButtons[1] = instance_create_layer(
			xx,
			yy+global.mainmenuButtons[0].loadButton.height + 10,
			"Instances",
			obj_loadgame_button
			);
	
	global.mainmenuButtons[1].loadButton.loadSlot = 0;
	global.mainmenuButtons[1].deleteButton.loadSlot = 0;
	global.mainmenuButtons[1].loadButton.container = global.mainmenuButtons[1];
	global.mainmenuButtons[1].deleteButton.container = global.mainmenuButtons[1];
	if (saveExists(global.mainmenuButtons[1].loadButton.loadSlot)) 
	{
		//If save is found
		global.mainmenuButtons[1].loadButton.text = "1";
	} 
	else 
	{
		global.mainmenuButtons[1].loadButton.text = "-Empty-";
		global.mainmenuButtons[1].loadButton.onClickFunc = emptyLoadGameButton;
	}
	
	global.mainmenuButtons[2] = instance_create_layer(
			xx,
			yy+(global.mainmenuButtons[0].loadButton.height + 10)*2,
			"Instances",
			obj_loadgame_button
			);
	global.mainmenuButtons[2].loadButton.loadSlot = 1;
	global.mainmenuButtons[2].deleteButton.loadSlot = 1;
	global.mainmenuButtons[2].loadButton.container = global.mainmenuButtons[2];
	global.mainmenuButtons[2].deleteButton.container = global.mainmenuButtons[2];
	if (saveExists(global.mainmenuButtons[2].loadButton.loadSlot)) 
	{
		//If save is found
		global.mainmenuButtons[2].loadButton.text = "2";
	} 
	else 
	{
		global.mainmenuButtons[2].loadButton.text = "-Empty-";
		global.mainmenuButtons[2].loadButton.onClickFunc = emptyLoadGameButton;
	}
	
	
	global.mainmenuButtons[3] = instance_create_layer(
			xx,
			yy+(global.mainmenuButtons[0].loadButton.height + 10)*3,
			"Instances",
			obj_loadgame_button
			);
	global.mainmenuButtons[3].loadButton.loadSlot = 2;
	global.mainmenuButtons[3].deleteButton.loadSlot = 2;
	global.mainmenuButtons[3].loadButton.container = global.mainmenuButtons[3];
	global.mainmenuButtons[3].deleteButton.container = global.mainmenuButtons[3];
	if (saveExists(global.mainmenuButtons[3].loadButton.loadSlot)) 
	{
		//If save is found
		global.mainmenuButtons[3].loadButton.text = "3";
	} 
	else 
	{
		global.mainmenuButtons[3].loadButton.text = "-Empty-";
		global.mainmenuButtons[3].loadButton.onClickFunc = emptyLoadGameButton;
	}
	
	
	global.mainmenuButtons[4] = instance_create_layer(
			xx,
			yy+(global.mainmenuButtons[0].loadButton.height + 10)*4,
			"Instances",
			obj_button
			);
	global.mainmenuButtons[4].text = "Back";
	global.mainmenuButtons[4].onClickFunc = mainmenu;
	global.mainmenuButtons[4].sprite = spr_Button_NoEdge;
}

function loadGameButton()
{
	if (loadSlot != -1)
	{
		global.gameState = GAMESTATE.GAMEPLAY;
		loadGame(loadSlot); 
	}
}

function emptyLoadGameButton()
{
	var popup = instance_create_layer(
				x,
				y,
				"Instances",
				obj_popup
				);
	with (popup)
	{
		x = (global.cameraWidth*0.5) - (width*0.5);
		y = (global.cameraHeight*0.5) - (height*0.5);
		descText = "This slot is empty.\nDo you want to start a new game?";
		acceptText = "Yes";
		declineText = "No";
		acceptScript = function() 
		{
			newMenuButton();
			instance_destroy();
		}
	}
}

function deleteGameButton()
{
	if (loadSlot != -1)
	{
		var _loadSlot = loadSlot;
		var popup = instance_create_layer(
				x,
				y,
				"Instances",
				obj_popup
				);
			
		with (popup)
		{
			container = other.container;
			loadSlot = _loadSlot;
			x = (global.cameraWidth*0.5) - (width*0.5);
			y = (global.cameraHeight*0.5) - (height*0.5);
			descText = "Are you sure you want to delete " + string(_loadSlot) + "?";
			acceptText = "Yes";
			declineText = "No";
			show_debug_message(string(_loadSlot))
			acceptScript = function() 
			{
				if (container != -1) container.loadButton.text = "-Empty-";
				deleteGame(loadSlot); 
				instance_destroy();
			}
		}
	}
}

function optionMenuButton()
{
	//TODO
}

function exitMenuButton()
{
	var popup = instance_create_layer(
			x,
			y,
			"Instances",
			obj_popup
			);
			
	with (popup)
	{
		x = (global.cameraWidth*0.5) - (width*0.5);
		y = (global.cameraHeight*0.5) - (height*0.5);
		descText = "Are you sure you want to quit?";
		acceptText = "Yes";
		declineText = "No";
		acceptScript = function() 
		{
			game_end();
		}
	}
}

function drawPopupYesNo()
{
	draw_set_colour(WHITE);
	var xx = x + (width*0.5);
	var yy = y + height - buttonHeight - 20;

	//Accept Button
	draw_sprite_stretched
	(	
		spr_Button,
		acceptHover,
		xx - buttonWidth - 10,
		yy,
		buttonWidth,
		buttonHeight
	);
	draw_text(xx - (buttonWidth*0.5) - 10, yy + (buttonHeight*0.5), acceptText);

	//Cancel Button
	draw_sprite_stretched
	(	
		spr_Button,
		declineHover,
		xx + 10,
		yy,
		buttonWidth,
		buttonHeight
	);
	draw_text(xx + (buttonWidth*0.5) + 10, yy + (buttonHeight*0.5), declineText);
}

function drawPopupOk()
{
	draw_set_colour(WHITE);
	var xx = x + (width*0.5);
	var yy = y + height - buttonHeight - 20;
	
	//Accept Button
	draw_sprite_stretched
	(	
		spr_Button,
		acceptHover,
		xx - (buttonWidth*0.5),
		yy,
		buttonWidth,
		buttonHeight
	);
	draw_text(xx - (buttonWidth*0.25), yy + (buttonHeight*0.5), acceptText);

}
