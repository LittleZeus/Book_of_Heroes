
if (menuVisible > 0)
{
	//Draw fragments
	draw_set_alpha(menuVisible);
	for (var i = 0; i < fragAmount; i++)
	{
		fragPositionY[i] = fragPositionY[i] - fragSpeed[i]/10;
		fragRotation[i] = fragRotation[i] + fragRotationSpeed[i];
		if (fragPositionY[i] < -20) //Reset after hiting bottom
		{
			fragPositionY[i] = RESOLUTION_H;
			fragPositionX[i] = irandom_range(0,RESOLUTION_W);
			fragIndex[i] = choose(0,1,2);
			fragSpeed[i] = irandom_range(5,40);
		}
		if (fragIndex[i] == -1) //Initate random values
		{
			fragIndex[i] = choose(0,1,2);
			fragSpeed[i] = irandom_range(10,40);
			fragPositionY[i] = irandom_range(0,RESOLUTION_H);
			fragPositionX[i] = irandom_range(10,RESOLUTION_W-10);
			fragRotation[i] = irandom_range(1,360);
			fragRotationSpeed[i] = irandom_range(1,4)*choose(1,-1);
			fragScale[i] = irandom_range(4,7)/10;
		}
		draw_sprite_ext(spr_glassFrag,fragIndex[i],fragPositionX[i],fragPositionY[i],fragScale[i],fragScale[i],fragRotation[i],WHITE,menuVisible);
	}
	draw_set_alpha(1.0);
}

if (titleVisible > 0)
{
	draw_sprite(spr_title,0,0,-RESOLUTION_H + titleVisible * RESOLUTION_H);
	
	if (!keyPressed) 
	{
		draw_set_alpha(titleVisible * abs(sin(get_timer() * 0.000001 * pi)));
		draw_sprite(spr_title,1,0,0);
		draw_set_alpha(1.0);
	}
}
