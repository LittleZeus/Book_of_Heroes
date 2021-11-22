randomize();

global.gameSaveSlot = 0;

global.gamePaused = false;
global.textSpeed = .75;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.playTime = 0;
global.gameState = GAMESTATE.MAINMENU;
global.prevGameState = -1;

global.playerHealthMax = 10;
global.playerHealth = global.playerHealthMax;
global.playerMoney = 0;

global.questStatus = ds_map_create();
global.questStatus[? "TheHatQuest"] = 0;

//Inventory
global.playerInventory = instance_create_layer(50,250,"Instances",obj_inventory);
global.playerEquipment = instance_create_layer(60,250,"Instances",obj_equipment);

global.playerEquipment.child = global.playerInventory;
windowVisible(global.playerEquipment,false);

global.itemHoverEquipment = instance_create_layer(50,50,"Instances",obj_itemHover);
global.itemHoverEquipment.visible = false;

global.itemHoverInventory = instance_create_layer(50,50,"Instances",obj_itemHover);
global.itemHoverInventory.visible = false;


global.mouseInMenu = false;

global.mainmenuButtons = -1;

global.iCamera = instance_create_layer(0,0,layer,obj_camera);
global.iUI = instance_create_layer(0,0,layer,obj_UI);

global.pSystem = part_system_create_layer(layer, true);
global.dashParticle = part_type_create();
	part_type_shape(global.dashParticle, pt_shape_flare);
	part_type_size(global.dashParticle, 0.01, 0.05, 0, 0.5);
	part_type_color3(global.dashParticle, DARKBLUE, c_orange, WHITE);
	part_type_alpha3(global.dashParticle, 0.5, 1, 0.1);
	part_type_speed(global.dashParticle, 2, 5, -0.10, 0);
	part_type_direction(global.dashParticle, 0, 359, 0, 10);
	part_type_blend(global.dashParticle, false);
	part_type_life(global.dashParticle, 5, 20);

window_set_cursor(cr_none);
cursor_sprite = spr_cursor;

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);