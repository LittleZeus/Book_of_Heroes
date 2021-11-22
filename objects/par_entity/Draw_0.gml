if (blend != -1) gpu_set_blendmode(blend);

if(entityShadow) draw_sprite(spr_shadow,0,x,y-10);

if(flash != 0) {
	shader_set(flashShader);
	uFlash = shader_get_uniform(flashShader, "flash");
	shader_set_uniform_f(uFlash, flash);
}

draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y-z,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha);
	
if (object_exists(obj_player))&&(obj_player.activate != noone)&&(obj_player.activate.id == id)
{
	var xx = x+(sprite_width*0.5);
	var yy = y-(sprite_height);
	//Draw action interaction sprite
	draw_sprite(spr_actBubble,0,xx,yy);
	
	xx += sprite_get_width(spr_actBubble)*0.5;
	yy -= sprite_get_height(spr_actBubble)*0.5;
	draw_set_colour(DARKBLUE);
	draw_set_font(fText);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(xx,yy,"E");
}

if ( shader_current() != -1) shader_reset();

gpu_set_blendmode(bm_normal);