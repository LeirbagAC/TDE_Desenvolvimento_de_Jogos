// Toca um efeito sonoro. _pitch_var adiciona uma pequena variação aleatória.
#macro VOL_SFX 0.6   // volume geral dos efeitos (0 a 1)

function tocar_sfx(_snd, _gain = 1, _pitch = 1, _pitch_var = 0)
{
	var _p = _pitch + random_range(-_pitch_var, _pitch_var);
	return audio_play_sound(_snd, 20, false, _gain * VOL_SFX, 0, _p);
}