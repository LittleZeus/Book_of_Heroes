
container = -1;
text = "Test";
loadSlot = -1;

greyout = false;
interactTime = 30;
maxAlpha = 1;

gamePausedImageSpeed = 0;

sprite = spr_Button;
sprite_frame = 0;
text_colour = WHITE;

width = 200;
height = 60;

xx = x;
yy = y;

clicked = false;
pressOffset = 4;

testClick = function ()
{
	show_debug_message("Button Clicked");
}

testHover = function ()
{
	buttonHoverHighlight();
}

onClickFunc = testClick;
hoverFunc = testHover;
