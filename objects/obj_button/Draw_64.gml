
if(greyout) {
	image_alpha = 0.5;
} else {
	image_alpha = 1;
}

draw_sprite_ext(sprite,0,draw_x,draw_y,draw_xscale,draw_yscale,image_angle,image_blend,image_alpha);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(	draw_x + ((sprite_width*global.displayScale)/2),
			draw_y + ((sprite_height*global.displayScale)/2), text);


