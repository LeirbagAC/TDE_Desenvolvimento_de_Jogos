// Inherit the parent event
event_inherited();

velocidade = 5;
gravidade = .3;

forca_pulo = -7;

qtd_pulos = 0;
max_pulos = 2;

vel_deslize = 1.5;       
vel_pulo_parede = 6;     

parede_dir = 0;          
tempo_parede = 0;        
coyote_parede = 8;       

buffer_pulo = 0;
buffer_max = 6;          

trava_h = 0;           

spr_run = spr_frog_run;
spr_fall = spr_frog_Fall;
spr_hit = spr_frog_Hit;
spr_idle = spr_frog_Idle;
spr_jump = spr_frog_Jump;
spr_double_jump = spr_frog_Double_Jump;
spr_wall_jump = spr_frog_Wall_Jump;

function input_player() 
{
	var _left, _right, _jump, _xDirection;
	
	_left = keyboard_check(ord("A"));
	_right = keyboard_check(ord("D"));
	_jump = keyboard_check_pressed(vk_space);
	
	_xDirection = _right - _left;
	
	var _velh_alvo = _xDirection * velocidade;
	
	var _no_chao = place_meeting(x, y+1, obj_bloco);
	
	// Parede independente do input: 1 = direita, -1 = esquerda, 0 = nenhuma
	var _parede = place_meeting(x+1, y, obj_bloco) - place_meeting(x-1, y, obj_bloco);
	
	// Coyote time da parede
	if(_no_chao) 
	{
		tempo_parede = 0;
	}
	else if(_parede != 0) 
	{
		parede_dir = _parede;
		tempo_parede = coyote_parede;
	}
	else if(tempo_parede > 0) 
	{
		tempo_parede--;
	}
	var _na_parede = (!_no_chao && tempo_parede > 0);
	var _deslizando = (!_no_chao && _parede != 0 && velv > 0);
	
	// Jump buffer
	if(_jump) buffer_pulo = buffer_max;
	else if(buffer_pulo > 0) buffer_pulo--;
	var _quer_pular = (buffer_pulo > 0);
	
	if(_xDirection != 0)
	{
		image_xscale = _xDirection;
	}
	
	//Gerenciamento de sprites
	if(_no_chao) 
	{
		if(_xDirection != 0) sprite_index = spr_run;
		else sprite_index = spr_idle;
	}
	else if(_deslizando)
	{
		sprite_index = spr_wall_jump;
	}
	else
	{
		if(qtd_pulos == (max_pulos - 1)) sprite_index = spr_jump;
		else sprite_index = spr_double_jump;
		
		if(velv > 0) sprite_index = spr_fall;
	}
	
	//Movimento e física de pulo
	if(_no_chao) 
	{
		qtd_pulos = max_pulos;
		if(_quer_pular)
		{
			velv = forca_pulo;
			qtd_pulos--;
			buffer_pulo = 0;
		}
	}
	else 
	{
		velv += gravidade;
		
		// Deslize lento na parede
		if(_deslizando && velv > vel_deslize) 
		{
			velv = vel_deslize;
		}
		
		if(_quer_pular)
		{
			if(_na_parede) // wall jump tem prioridade sobre o pulo duplo
			{
				velv = forca_pulo;
				velh = -parede_dir * vel_pulo_parede;
				trava_h = 10;
				qtd_pulos = 1;      // devolve o pulo duplo
				tempo_parede = 0;
				buffer_pulo = 0;
			}
			else if(qtd_pulos == 1)
			{
				velv = forca_pulo;
				qtd_pulos--;
				buffer_pulo = 0;
			}
		}
	}
	
	// Controle horizontal (fraco logo após o wall jump)
	if(trava_h > 0)
	{
		trava_h--;
		velh = lerp(velh, _velh_alvo, 0.05);
	}
	else
	{
		velh = lerp(velh, _velh_alvo, 0.2);
	}
}