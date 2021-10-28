/// @description Pause the Game
if ((keyboard_check_pressed(vk_escape)) &&
	(!instance_exists(obj_transition)) &&
	(obj_UI.visible != false)) 
{
	
	pauseGame();
	
}

if(global.gameState == GAMESTATE.GAMEPLAY)
{
	global.playTime++;
}

if ((keyboard_check_pressed(vk_tab)) &&
	(!instance_exists(obj_transition)) &&
	(obj_UI.visible != false)) 
{
	show_debug_message("pressed tab");
	if (global.playerInventory.visible)
	{
		global.playerInventory.visible = false;
		global.playerEquipment.visible = false;
	}
	else
	{
		global.playerInventory.visible = true;
		global.playerEquipment.visible = true;
	}
	
}