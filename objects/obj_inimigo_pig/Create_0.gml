event_inherited();

vida = 3;
velocidade = 1; 

spr_idle = spr_pig_idle;
spr_run = spr_pig_Run;
spr_dano = spr_pig_hit;
spr_morte = spr_pig_dead;

estado = ESTADO_INIMIGO.PARADO;
tempo_estado = FPS;

hitbox = instance_create_layer(x, y, layer, obj_hit);
with (hitbox)
{
	image_xscale *= 1.5;
	image_yscale *= 0.7;
}