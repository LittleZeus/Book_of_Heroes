// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function slow_instance(_instance,percent,time){
	
	with (_instance) {
		
		var initial_speed = speed;
		for (var i = 0; i < 10; ++i;) {
			if (movement_arr[i][1] == 0){
				movement_arr[i][0] = (percent);
				movement_arr[i][1] = time;
				exit;
			}
		}	
	}
}