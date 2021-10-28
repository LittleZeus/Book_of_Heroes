
draw_sprite_stretched(spr_textbox,background,x1,y1,x2-x1,y2-y1);

draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(DARKBLUE);

var _print = string_copy(message,1,textProgress);

if (responses[0] != -1) && (textProgress >= string_length(message)) {
	for (var i = 0; i < array_length(responses); i++) {
		_print += "\n";
		if (i == responseSelected) _print += "> ";
		_print += responses[i];
		if (i == responseSelected) _print += " <";
	}
}
draw_text((x1+x2)/2, y1+30, _print);
draw_set_color(WHITE);
draw_text((x1+x2)/2, y1+28, _print);