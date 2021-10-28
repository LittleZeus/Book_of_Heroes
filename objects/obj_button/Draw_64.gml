
if(greyout) {
	maxAlpha = 0.5
} else {
	maxAlpha = 1;
}

var curve = animcurve_get_channel(anc_fade,0);
var alpha = min(maxAlpha,animcurve_channel_evaluate(curve,interactTime/30));
image_alpha = alpha;
draw_set_alpha(alpha);

draw_set_colour(text_colour);
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

if (clicked) 
{
	draw_sprite_stretched_ext(sprite,sprite_frame,xx,yy+pressOffset,width,height,image_blend,image_alpha);
	draw_text(xx+(width/2), yy+(height/2)+pressOffset, text);
}
else
{
	draw_sprite_stretched_ext(sprite,sprite_frame,xx,yy,width,height,image_blend,image_alpha);
	draw_text(xx+(width/2), yy+(height/2), text);
}

draw_set_alpha(1);

sprite_frame = 0; //reset image_index




