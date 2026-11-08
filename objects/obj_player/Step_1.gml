if(move_checkpoint)
{
	velh = 0;	
	velv = 0;	
	
	if(image_index >= image_number - 1) 
	{
		// Acabaram as vidas: congela no último frame e reinicia a fase com fade
		if(morreu_de_vez)
		{
			image_speed = 0;
			
			if(!reiniciando)
			{
				reiniciando = true;
				transicao_simples(room);
			}
			exit;
		}
		
		var _to_start = true;
		
		if(instance_exists(obj_checkpoint))
		{
			if(obj_checkpoint.flag_ativa)
			{
				x = obj_checkpoint.x;
				y = obj_checkpoint.y-5;
				_to_start = false;
			}
		}
		
		if(_to_start)
		{
			x = obj_start.x;	
			y = obj_start.y;	
		}
		
		muda_sprite(spr_player_enter);
	}

	if(sprite_index == spr_player_enter)
	{
		if(image_index >= image_number - 1) move_checkpoint = false;
	}
}