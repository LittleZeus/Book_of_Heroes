/// @description Progress Transition


with (obj_player) 
{
	if (obj_player.state != playerStateDead) state = playerStateTransition;
}

if (leading == OUT) {
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1) { //If screen fully obsure
		room_goto(target);
		leading = IN;
	}
} else { //leading == IN
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0) { //If screen fully revealed
		with (obj_player) state = playerStateFree;
		instance_destroy();
	}
}