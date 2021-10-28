
child = -1;
parent = -1;

depth = -11

width = 400;
height = 200;

buttonWidth = 100;
buttonHeight = 50;

drawState = drawPopupYesNo;

rowLength = 6;

heightOffset = 0;

descText = "Are you sure you want to do that?";

acceptText = "OK";
acceptScript = function ()
{
	instance_destroy();
};
acceptHover = false;

declineText = "Cancel";
declineScript = function ()
{
	instance_destroy();
};
declineHover = false;