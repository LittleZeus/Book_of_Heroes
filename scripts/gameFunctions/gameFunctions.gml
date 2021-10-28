
function pauseGame(){
	global.gamePaused = !global.gamePaused;
	
	if (global.gamePaused) {
		if (global.gameState != GAMESTATE.PAUSED)
		{
			global.prevGameState = global.gameState;
			global.gameState = GAMESTATE.PAUSED
		}
		else
		{
			if (global.prevGameState != -1) global.gameState = global.prevGameState;
			else show_debug_message("global.prevGameState = " + string(global.prevGameState))
		}
		with (all)
		{	
			gamePausedImageSpeed = image_speed;
			if (gamePausedImageSpeed == image_speed) image_speed = 0;
		}
	} else {
		with (all)
		{	
			image_speed = gamePausedImageSpeed;
		}
	}
}

function saveGame(_auto = false){

	var _slot = global.gameSaveSlot;
	if (_auto) _slot = "Auto";

	//Create Save Map
	var _map = ds_map_create();
	
	_map[? "playTime"] = global.playTime;
	_map[? "room"] = room;
	_map[? "playerHealth"] = global.playerHealth;
	_map[? "playerHealthMax"] = global.playerHealthMax;
	_map[? "playerMoney"] = global.playerMoney;
	_map[? "targetX"] = global.targetX;
	_map[? "targetY"] = global.targetY;
	
	//To add ds list without deleting so player can continue with correct quest status
	var _questMap = ds_map_create();
	ds_map_copy(_questMap, global.questStatus);
	ds_map_add_map(_map, "questStatus", _questMap);
	
	//Save all of this to a string
	var _string = json_encode(_map);
	saveStringToFile("save" + string(_slot) + ".sav", _string);
	show_debug_message(_string);
	
	ds_map_destroy(_map);
	show_debug_message("Game Saved! auto:" + string(_auto));

}

function saveStringToFile(_filename, _string) {
	
	var _buffer = buffer_create( string_byte_length(_string)+1, buffer_fixed, 1);
	buffer_write( _buffer, buffer_string, _string);
	buffer_save( _buffer, _filename);
	buffer_delete(_buffer);
	
}


function loadGame(_slot){

	loadingStarted = true;
	global.gameSaveSlot = _slot;
	var _file = "save" + string(global.gameSaveSlot) + ".sav";
	if (file_exists(_file))
	{
		//Load game data
		var _json = loadJSONFromFile(_file);
		
		//Global variables
		global.playTime = _json[? "playTime"];
		global.playerHealth = _json[? "playerHealth"];
		global.playerHealthMax = _json[? "playerHealthMax"];
		global.playerMoney = _json[? "playerMoney"];
		global.playerEquipped = _json[? "playerEquipped"];
		global.playerHasAnyItems = _json[? "playerHasAnyItems"];
		global.targetX = _json[? "targetX"];
		global.targetY = _json[? "targetY"];
		
		//Quest data
		ds_map_copy(global.questStatus, _json[? "questStatus"]);
		
		//Room
		roomTransition(TRANS_TYPE.SLIDE, _json[? "room"]);
		ds_map_destroy(_json);
		
		return true;
	}
	else
	{
		show_debug_message("No save in this slot");
		return false;
	}

}

function loadJSONFromFile(_filename){
	
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer,buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json;
	
}

function getLatestSave(){
	
	var _latestSlot = "Auto";
	var _latestPlayTime = 0;
	var _playTime = 0;
	
	var _file = "saveAuto.sav";
	if (file_exists(_file))
	{
		var _json = loadJSONFromFile(_file);
		_latestPlayTime = _json[? "playTime"];
	} else _latestSlot = -1;
	
	for (var i=0; i<3; i++)
	{
		var _file = "save" + string(i) + ".sav";
		if (file_exists(_file))
		{
			var _json = loadJSONFromFile(_file);
			_playTime = _json[? "playTime"];
			if (_playTime>_latestPlayTime) _latestPlayTime = _playTime;
		}
	}
	
	return _latestSlot;
}

function deleteGame(_slot){

	var _file = "save" + string(_slot) + ".sav";
	
	if (file_exists(_file))
	{
		file_delete(_file);
	}
	
	show_debug_message(string(_file) + " Deleted!");

}

function saveExists(_slot)
{
	var _file = "save" + string(_slot) + ".sav";
	if (file_exists(_file))
	{
		return true;
	} else return false;
	
}