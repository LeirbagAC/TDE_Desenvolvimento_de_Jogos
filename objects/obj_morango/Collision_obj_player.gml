if (coletado) exit;

coletado = true;
global.frutas_coletadas++;
tocar_sfx(snd_collect_fruit, 1, 1, 0.05);
sprite_index = spr_coletado;
image_index = 0;