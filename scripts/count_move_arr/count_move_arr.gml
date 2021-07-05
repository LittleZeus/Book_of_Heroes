// Count down the move array
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