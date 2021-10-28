
if (global.playerInventory.id == id) heightOffset = 50;
	
draw_sprite_stretched
(	
	spr_inv_container,
	0,
	x,
	y,
	width,
	height + heightOffset
);

if (global.playerInventory.id == id) 
{
	//Coin Icon
	var _xx = x + 25;
	var _yy = y + 25;
	draw_sprite(spr_coin_UI,0,_xx,_yy);
	
	//Coin Text
	draw_set_colour(WHITE);
	draw_set_font(fText);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	_xx += sprite_get_width(spr_coin_UI) + 8;
	_yy += 2;
	var _str = string(global.playerMoney);
	draw_text(_xx+2,_yy, _str);
	draw_text(_xx-2,_yy, _str);
	draw_text(_xx,_yy+2, _str);
	draw_text(_xx,_yy-2, _str);
	draw_set_colour(DARKBLUE);
	draw_text(_xx,_yy, _str);
	
	draw_text(x+200,y+25, string(global.playTime));
}
	
for (var i = 0; i < INVENTORY_SLOTS; i+= 1)
{
	var xx = x + ((i mod rowLength) * (50+margin)) + border + margin;
	var yy = y + ((i div rowLength) * (50+margin)) + border + margin + heightOffset;
	var hover = (obj_mouse.inventoryHover == id) && (obj_mouse.slotHover == i);
	draw_sprite(spr_inv_box,hover,xx,yy);
	if (inventory[i].type != -1)
	{
		var alpha = 1.0;
		if (obj_mouse.inventoryDrag == id) && (obj_mouse.slotDrag == i) alpha = 0.5;
		draw_set_alpha(alpha);
		draw_sprite(inventory[i].sprite,0,xx,yy);
		draw_set_alpha(1.0);
		if (inventory[i].amount != -1)
		{
			draw_set_colour(WHITE);
			draw_set_font(fText);
			draw_set_halign(fa_right);
			draw_set_valign(fa_bottom);
			draw_text(xx+50,yy+50,string(inventory[i].amount));
		}
	}
}
