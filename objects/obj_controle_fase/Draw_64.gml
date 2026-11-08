var _margem = 16;
var _w_c = sprite_get_width(spr_vida_idle);
var _h_c = sprite_get_height(spr_vida_idle);
var _w_f = sprite_get_width(spr_morango);
var _h_f = sprite_get_height(spr_morango);

// Corações
var _cy_vida = _margem + _h_c / 2;

for (var i = 0; i < global.vidas_max; i++)
{
	var _cx = _margem + _w_c / 2 + i * (_w_c + 4);
	
	if (coracao_hit[i] >= 0) desenhar_centro(spr_vida_hit, coracao_hit[i], _cx, _cy_vida);
	else desenhar_centro(spr_vida_idle, frame_coracao, _cx, _cy_vida);
}

// Morango + contador, logo abaixo dos corações
var _cy_fruta = _margem + _h_c + 8 + _h_f / 2;
desenhar_centro(spr_morango, frame_morango, _margem + _w_f / 2, _cy_fruta);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(_margem + _w_f + 8, _cy_fruta, string(global.frutas_coletadas) + "/" + string(global.frutas_total));
draw_set_valign(fa_top);