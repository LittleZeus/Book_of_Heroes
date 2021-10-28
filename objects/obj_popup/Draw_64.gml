draw_set_alpha(0.5);

draw_sprite_stretched
(	
	spr_inv_container,
	0,
	x,
	y,
	width,
	height
);

draw_set_colour(DARKBLUE);
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(x+(width*0.5),y+50,descText);

drawState();

draw_set_alpha(1);