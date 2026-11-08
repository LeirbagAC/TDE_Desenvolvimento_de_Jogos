if (finalizando) exit;

if (global.frutas_coletadas >= global.frutas_total)
{
	finalizando = true;
	sprite_index = spr_end_move;
	image_index = 0;
}
else
{
	aviso = FPS * 2; // mostra o aviso por 2 segundos
}