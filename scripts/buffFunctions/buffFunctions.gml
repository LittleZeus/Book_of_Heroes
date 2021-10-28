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

function count_move_arr(){
	for (var i = 0; i < 10; ++i;) {
		if (movement_arr[i][1] <= 0){
			movement_arr[i][0] = 1;
			movement_arr[i][1] = 0;
		}
		if (movement_arr[i][1] > 0){
			movement_arr[i][1] = movement_arr[i][1] - 1;
		}
	}
}

function slow_instance(_instance,percent,time){
	
	with (_instance) {
		
		initial_speed = speed;
		for (var i = 0; i < 10; ++i;) {
			if (movement_arr[i][1] == 0){
				movement_arr[i][0] = (percent);
				movement_arr[i][1] = time;
				exit;
			}
		}	
	}
}