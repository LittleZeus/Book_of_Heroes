if (itemSelected != -1)
{
	draw_sprite_stretched(spr_inv_container,0,x-border,y-border,width+(border*2),height+(border*2));

	draw_set_colour(DARKBLUE);
	draw_set_font(fText);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(x+(width*0.5),y+12,string(itemSelected.name))

	for (var i=0; i<USE_ITEM_OPTIONS;i++)
	{
		draw_set_colour(WHITE);
		draw_sprite_stretched(spr_Button,buttonHover[i],x,y+itemNameHeight+(buttonHeight*i),width,buttonHeight);
		draw_text(x+(width*0.5),y+itemNameHeight+(buttonHeight*(i+0.5)),string(optionName[i]))
	}
}