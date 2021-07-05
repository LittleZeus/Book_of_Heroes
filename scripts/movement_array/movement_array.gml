// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function movement_array(_arr){
	var move_mod = 1;
	for (var i = 0; i < 10; ++i;) {
		if (_arr[i][0] != 0) {
			move_mod = move_mod*_arr[i][0];
		}
	}
	return move_mod;
}