if (HP != MaxHP) {
	draw_healthbar(x-50,y-60,x+50,y-50,(HP/MaxHP)*100,c_white,c_red,c_green,0,false,false);
}