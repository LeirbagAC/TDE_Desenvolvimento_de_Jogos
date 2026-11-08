event_inherited();

vida = 1;
estado = ESTADO_INIMIGO.PARADO;
tempo_estado = 0;
invencivel = false;
direcao = choose(1, -1);
hitbox = noone;

// Cada filho define os seus sprites
spr_idle = -1;
spr_run = -1;
spr_dano = -1;
spr_morte = -1;

// Valor padrão caso o inimo não passe o dele
snd_dano = snd_enemy_get_hit;
snd_morte = snd_enemy_get_hit;

levou_dano = false;

function no_chao()
{
	return place_meeting(x, y + 1, obj_bloco);
}

function trocar_sprite(_spr)
{
	if (sprite_index != _spr)
	{
		sprite_index = _spr;
		image_index = 0;
	}
}

// _dir: direção do empurrão (1 ou -1). 0 = sem empurrão
function receber_dano(_dano = 1, _dir = 0)
{
	if (invencivel || estado == ESTADO_INIMIGO.MORTO) return false;
	
	vida -= _dano;
	invencivel = true;
	velh = _dir * 2;
	if (_dir != 0) velv = -2;
	
	if (vida <= 0)
	{
		estado = ESTADO_INIMIGO.MORTO;
		trocar_sprite(spr_morte);
		tocar_sfx(snd_morte, 1, 1, 0.05);
		
		if (instance_exists(hitbox))
		{
			instance_destroy(hitbox);
			hitbox = noone;
		}
	}
	else
	{
		estado = ESTADO_INIMIGO.DANO;
		trocar_sprite(spr_dano);
		tocar_sfx(snd_dano, 1, 1, 0.05);
		alarm[0] = FPS;
	}
	
	return true;
}