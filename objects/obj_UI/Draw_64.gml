/// @description Draw UI

//Draw Health
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;

var _length = 400;
var _height = 50;

draw_sprite_stretched(spr_health_bar,0,10,10,_length,_height);
draw_sprite_stretched(spr_health,0,10,10,_length*(_playerHealth/_playerHealthMax),_height);

draw_set_colour(DARKBLUE);
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

var _xx = _length*0.5;
var _yy = _height*0.6;
var _str = "HP: "+string(_playerHealth)+"/"+string(_playerHealthMax);
draw_text(_xx+2,_yy, _str);
draw_text(_xx-2,_yy, _str);
draw_text(_xx,_yy+2, _str);
draw_text(_xx,_yy-2, _str);
draw_set_color(WHITE);
draw_text(_xx,_yy, _str);

