if(entityShadow) draw_sprite(spr_shadow,0,x,y-10);

if(flash != 0) {
	shader_set(flashShader);
	uFlash = shader_get_uniform(flashShader, "flash");
	shader_set_uniform_f(uFlash, flash);
}

originX = sprite_xoffset;
originY = sprite_yoffset;

sprite_set_offset(sprite_index, sprite_get_width(sprite_index)/2, sprite_get_height(sprite_index)/2);

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
	
sprite_set_offset(sprite_index,originX,originY);

if ( shader_current() != -1) shader_reset();