/// @desc screenShake(magnitude,frames)
/// @arg Magnitude sets the strength of the shake (distance range)
/// @arg Frames sets the length of the shake in frames (60 = 1 second)
function screenShake(magnitude, frames){

	with (global.iCamera){
		if (magnitude > shakeRemain) {
			shakeMagnitude = magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = frames;
		}
	}


}