
if(greyout) {
	image_alpha = 0.5;
	draw_set_alpha(0.5);
} else {
	var curve = animcurve_get_channel(anc_fade,0);
	var alpha = 1-animcurve_channel_evaluate(curve,interactTime/30);
	image_alpha = alpha;
	draw_set_alpha(alpha);
}

draw_set_colour(text_colour);
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

glassOffsetX = (mouse_x - x)/100;

glassOffsetY = (mouse_y - y)/100;

xx = x + glassOffsetX/2;
yy = y + glassOffsetY/2;

//Top left
draw_sprite_ext(spr_glassTint,
				sprite_frame,
				xx+10,
				yy+10,
				point_distance(xx+10,yy+10,xx+glassOffsetX+10,yy+pressOffset+glassOffsetY+5),
				3,
				point_direction(xx+10,yy+10,xx+glassOffsetX+10,yy+pressOffset+glassOffsetY+5),
				image_blend,
				image_alpha);

//Top right
draw_sprite_ext(spr_glassTint,
				sprite_frame,
				xx-10+width,
				yy+10,
				point_distance(xx-10+width,yy+10,xx+glassOffsetX-10+width,yy+pressOffset+glassOffsetY+5),
				3,
				point_direction(xx-10+width,yy+10,xx+glassOffsetX-10+width,yy+pressOffset+glassOffsetY+5),
				image_blend,
				image_alpha);

//Bottom left
draw_sprite_ext(spr_glassTint,
				sprite_frame,
				xx+10,
				yy-10+height,
				point_distance(xx+10,yy+10+height,xx+glassOffsetX+10,yy+pressOffset+glassOffsetY+5+height),
				3,
				point_direction(xx+10,yy+10+height,xx+glassOffsetX+10,yy+pressOffset+glassOffsetY+5+height),
				image_blend,
				image_alpha);

//Bottom right
draw_sprite_ext(spr_glassTint,
				sprite_frame,
				xx-10+width,
				yy-10+height,
				point_distance(xx-10+width,yy+10+height,xx+glassOffsetX-10+width,yy+pressOffset+glassOffsetY+5+height),
				3,
				point_direction(xx-10+width,yy+10+height,xx+glassOffsetX-10+width,yy+pressOffset+glassOffsetY+5+height),
				image_blend,
				image_alpha);

if (clicked) 
{
	draw_sprite_stretched_ext(spr_glassPlane,sprite_frame,xx+glassOffsetX,yy+pressOffset+glassOffsetY-5,width,height,image_blend,image_alpha);
	draw_sprite_stretched_ext(spr_glassPlane,sprite_frame,xx,yy+pressOffset,width,height,image_blend,image_alpha);
	draw_text(xx+(width/2), yy+(height/2)+pressOffset, text);
}
else
{
	draw_sprite_stretched_ext(spr_glassPlane,sprite_frame,xx+glassOffsetX,yy+pressOffset+glassOffsetY-5,width,height,image_blend,image_alpha);
	draw_sprite_stretched_ext(spr_glassPlane,sprite_frame,xx,yy,width,height,image_blend,image_alpha);
	draw_text(xx+(width/2), yy+(height/2), text);
}

sprite_frame = 0; //reset image_index
