var _dx = vertical ? 0 : direcao;
var _dy = vertical ? direcao : 0;

switch (estado)
{
	case ESTADO_PEDREGULHO.PARADO:
		velh = 0;
		velv = 0;
		
		tempo_estado--;
		if (tempo_estado <= 0) estado = ESTADO_PEDREGULHO.MOVENDO;
	break;
	
	case ESTADO_PEDREGULHO.MOVENDO:
		// Encostou em uma superfície?
		if (place_meeting(x + _dx, y + _dy, obj_bloco))
		{
			velh = 0;
			velv = 0;
			vel_atual = 0;
			
			estado = ESTADO_PEDREGULHO.BATEU;
			tempo_estado = FPS * tempo_espera;
			
			// Sprite de batida do lado certo
			if (vertical) muda_sprite(direcao > 0 ? spr_rock_bottom_hit : spr_rock_top_hit);
			else muda_sprite(direcao > 0 ? spr_rock_right_hit : spr_rock_left_hit);
			
			screenshake(2); // tremor leve; aqui também dá para tocar um som de batida
		}
		else
		{
			vel_atual = min(vel_atual + aceleracao, vel_max);
			velh = _dx * vel_atual;
			velv = _dy * vel_atual;
		}
	break;
	
	case ESTADO_PEDREGULHO.BATEU:
		velh = 0;
		velv = 0;
		
		tempo_estado--;
		if (tempo_estado <= 0)
		{
			direcao *= -1; // sai pelo lado oposto
			muda_sprite(spr_rock_Idle);
			estado = ESTADO_PEDREGULHO.MOVENDO;
		}
	break;
}