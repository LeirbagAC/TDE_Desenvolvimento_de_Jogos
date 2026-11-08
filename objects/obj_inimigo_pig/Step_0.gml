event_inherited(); // gravidade, hitbox e ponte do dano

if (estado == ESTADO_INIMIGO.MORTO)
{
	velh = 0;
	exit;
}

if (estado == ESTADO_INIMIGO.DANO)
{
	velh = lerp(velh, 0, 0.15); // deixa o empurrão perder força
	exit;
}

// No ar, não anda
if (!no_chao())
{
	velh = 0;
	exit;
}

tempo_estado--;

switch (estado)
{
	case ESTADO_INIMIGO.PARADO:
		velh = 0;
		trocar_sprite(spr_idle);
		
		if (tempo_estado <= 0)
		{
			if (irandom(1) == 0) direcao *= -1; // 50% de chance de mudar de lado
			estado = ESTADO_INIMIGO.ANDANDO;
			tempo_estado = FPS * 2;
		}
	break;
	
	case ESTADO_INIMIGO.ANDANDO:
		trocar_sprite(spr_run);
		
		// Sensores
		var _parede = place_meeting(x + direcao, y, obj_bloco);
		var _borda_x = (direcao > 0) ? bbox_right + 1 : bbox_left - 1;
		var _sem_chao = !position_meeting(_borda_x + direcao * 2, bbox_bottom + 2, obj_bloco);
		
		if (_parede || (!pode_cair && _sem_chao))
		{
			direcao *= -1;
		}
		
		velh = direcao * velocidade;
		
		if (tempo_estado <= 0)
		{
			estado = ESTADO_INIMIGO.PARADO;
			tempo_estado = FPS * 2;
		}
	break;
}

// O sprite original olha para a esquerda
image_xscale = -direcao;