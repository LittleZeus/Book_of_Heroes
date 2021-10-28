/// @arg Message
/// @arg Background
/// @arg [Responses]

function newTextBox(_message){
	
	var _obj;
	if (instance_exists(obj_text)) _obj = obj_textQueued; else _obj = obj_text;
	
	with (instance_create_layer(0,0,"Instances",_obj)) {
		message = _message;
		if (instance_exists(other)) originInstance = other.id else originInstance = noone;
		if (argument_count > 1) background = argument[1]; else background = 0;
		if (argument_count > 2)
		{
			//trim markers from responses
			responses = argument[2];
			for (var i = 0; i < array_length(responses); i++)
			{
				var _markerPosition = string_pos(":",responses[i]);
				responseScripts[i] = real(string_copy(responses[i],1,_markerPosition-1));
				responses[i] = string_delete(responses[i],1,_markerPosition);
			}
		}
		else
		{
			responses = [-1];
			responseScripts = [-1];
		}
	}
	
	with (obj_player) {
		if (state != playerStateLocked) {
			lastState = state;
			state = playerStateLocked;
		}
	}
}

function dialogResponses(_response)
{
	switch(_response)
	{
		case 0: break;
		
		case 1: newTextBox("You gave response A!", 1); break;
		
		case 2: newTextBox("You gave response B! Any further reponse?", 1, 
							["3:Yes!","0:No."]); break;
		
		case 3: newTextBox("Thanks for your responses!",0); break;
		
		case 4:
		{
			newTextBox("Thanks!",2);
			newTextBox("I think I left it in that scary cave to the north west!", 2);
			global.questStatus[? "TheHatQuest"] = 1;
		} break;
		
		case 5: newTextBox(":(",2); break;
		
		case 6: purchaseItem(activate.item, activate.itemAmount, activate.itemCost); break;
		
		default: break;
	}

}