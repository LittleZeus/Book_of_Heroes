var xx = floor(x+border+margin);
var yy = floor(y+border+margin);

draw_sprite_stretched
(	
	spr_hoverBox,
	0,
	floor(x),
	floor(y),
	width,
	height
);

if (itemSelected.type != -1)
{
	draw_sprite(spr_inv_box,0,xx,yy);
	draw_sprite(itemSelected.sprite,0,xx,yy);
	draw_set_colour(ORANGE);
	draw_set_font(fText);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(xx+55,yy,string(itemSelected.name));
	draw_set_colour(WHITE);
	draw_text(xx+55,yy+20,string(itemSelected.rarity));
	draw_text(xx+55,yy+40,string(itemSelected.type));
	draw_text(xx,yy+60,"Main Stat: "+string(itemSelected.stats));
	draw_text(xx,yy+80,string(itemSelected.desc));
	draw_text(xx,yy+100,"Value: "+string(itemSelected.value));
}