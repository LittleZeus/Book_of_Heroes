
text = "Test";

goto_room = rm_grass;

greyout = false;

clicked = false;

gamePausedImageSpeed = 0;

original_image_blend = image_blend;

original_xscale = image_xscale;
original_yscale = image_yscale;

sprite = spr_Button;

//draw position
draw_x=x;
draw_y=y;
draw_xscale=image_xscale;
draw_yscale=image_yscale;

image_xscale = image_xscale/global.displayScale;
image_yscale = image_yscale/global.displayScale;
x = x/global.displayScale;
y = y/global.displayScale;