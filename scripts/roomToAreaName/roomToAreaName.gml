// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function roomToAreaName(_room){
	switch (_room)
	{
		case rm_grass: return "Grass 1"; break;
		case rm_grass2: return "Grass 2"; break;
		case rm_cave: return "Cave"; break;
		case rm_shop: return "Shop"; break;
		default: return "Unknown Area"; break;
	}
}