// Inherit the parent event
event_inherited();

velocidade = 5;
gravidade = .3;

forca_pulo = -7;

qtd_pulos = 0;
max_pulos = 2;


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
	
	velh = (_right - _left) * velocidade;
	
	var _no_chao = place_meeting(x, y+1, obj_bloco);
	var _na_parede = place_meeting(x+(_xDirection), y+1, obj_bloco);
	
	if(_xDirection != 0)
	{
		image_xscale = _xDirection;
	}
	
	if(_no_chao) 
	{
		if(_xDirection != 0) 
		{
			sprite_index = spr_run;
		}
		else 
		{
			sprite_index = spr_idle;
		}
	}
	else if(_na_parede)
	{
		sprite_index = spr_wall_jump;
	}
	else
	{
		if(qtd_pulos == (max_pulos - 1)) 
		{
			sprite_index = spr_jump;
		}
		else 
		{
			sprite_index = spr_double_jump;
		}
		
		if(velv > 0) 
		{
			sprite_index = spr_fall;
		}
	}
	
	if(_no_chao) 
	{
		qtd_pulos = max_pulos;
		if(_jump)
		{
			velv = forca_pulo;
			qtd_pulos--;
		} 
	}
	else 
	{
		if(_jump && qtd_pulos == 1)
		{
			velv = forca_pulo;
			qtd_pulos--;
		}
		
		velv += gravidade;	
	}
	
}