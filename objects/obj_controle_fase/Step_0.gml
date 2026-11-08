frame_morango = avancar_frame(frame_morango, spr_morango);
frame_coracao = avancar_frame(frame_coracao, spr_vida_idle);

for (var i = 0; i < global.vidas_max; i++)
{
	if (coracao_hit[i] >= 0)
	{
		coracao_hit[i] = avancar_frame(coracao_hit[i], spr_vida_hit, false); // toca uma vez e para no último frame
	}
}