if(alpha < 1 && !lv_start) alpha += 0.02;
else alpha -= 0.02

if(alpha >= 1 && !lv_start) 
{
	room_goto(rm_destino);
	lv_start = true;
}

if(lv_start && alpha <= 0) instance_destroy();