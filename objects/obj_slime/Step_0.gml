/// @description Insert description here
// You can write your code in this editor
event_inherited();

//TODO add attack animation

//If player exists
if(!instance_exists(obj_player)) exit;

moveCounter++;
//If player is inside range
if(point_distance(x,y, obj_player.x,obj_player.y) < 300){
	
	moveX = obj_player.x;
	moveY = obj_player.y;
	moveCounter = 0;
	
} else if (((round(x)>=moveX-10)and(round(x)<=moveX+10))and  // x is +-10 of destination
			((round(y)>=moveY-10)and(round(y)<=moveY+10))) { // y is +-10 of destination
	moveX= x+(irandom_range(100,350)*choose(1,-1));
	moveY= y+(irandom_range(100,350)*choose(1,-1));	
	moveCounter = 0;
}

if (moveCounter>=180) { //if counter is more than 3 seconds, choose another location
	moveX= x+(irandom_range(100,350)*choose(1,-1));
	moveY= y+(irandom_range(100,350)*choose(1,-1));	
	moveCounter = 0;
}

moveAngle = point_direction(x,y,moveX,moveY);
move_contact_all(moveAngle,originalSpeed);