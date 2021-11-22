// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function activateHatCat(){
	
	//var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == obj_hat);
	switch (global.questStatus[? "TheHatQuest"])
	{
		case 0: //not started
		{
			//player might have brought the hat back anyway
			/*if (_hasHat)
			{
				//complete quest
				newTextBox("Thanks, you found my hat without even asking!",2);
				newTextBox("You are a true hero",2);
				global.questStatus[? "TheHatQuest"] = 2;
				with (obj_questNPC) sprite_index = spr_quest_hat;
				with (obj_hat) instance_destroy();
				global.iLifted = noone;
				with (obj_player)
				{
					spriteIdle = spr_player_idle;
					spriteRun = spr_player_run;
				}
			}
			else
			{
				//offer quest
				newTextBox("Hello there! You look like an adventurer!",2);
				newTextBox("Could you help me find my missing hat?",2,
							["4:Of course!","5:This task is beneath me"]);
			}*/
			
		} break;
		
		case 1: //quest in progress
		{
			if (_hasHat)
			{
				//complete quest
				newTextBox("Thanks, you found my hat!",2);
				newTextBox("You are a true hero",2);
				global.questStatus[? "TheHatQuest"] = 2;
				with (obj_questNPC) sprite_index = spr_quest_hat;
				with (obj_hat) instance_destroy();
				//global.iLifted = noone;
				with (obj_player)
				{
					spriteIdle = spr_player_idle;
					spriteRun = spr_player_run;
				}
			}
			else
			{
				//clue reminder
				newTextBox("I think I left it in that scary cave to the north west!", 2);
				newTextBox("You might need some items to get there!", 2);
				
			}
			
		} break;
		
		case 2: //quest already complete
		{
			newTextBox("Thanks again!", 2);
		} break;
		
		
		
	}
	
	
	
}