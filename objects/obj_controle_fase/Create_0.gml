global.frutas_total = 0;
global.frutas_coletadas = 0;

global.vidas_max = 3;
global.vidas = global.vidas_max;

// Animações do HUD
frame_morango = 0;
frame_coracao = 0;
coracao_hit = array_create(global.vidas_max, -1); // -1 = inteiro; >= 0 = frame da animação de dano

// Avança o frame respeitando a velocidade configurada no sprite
function avancar_frame(_frame, _spr, _loop = true)
{
	var _vel = sprite_get_speed(_spr);
	if (sprite_get_speed_type(_spr) == spritespeed_framespersecond) _vel /= FPS;
	
	var _novo = _frame + _vel;
	var _qtd = sprite_get_number(_spr);
	
	return _loop ? (_novo mod _qtd) : min(_novo, _qtd - 1);
}

// Desenha o sprite centralizado em (_cx, _cy), independente da origem dele
function desenhar_centro(_spr, _frame, _cx, _cy)
{
	var _x = _cx - sprite_get_width(_spr) / 2 + sprite_get_xoffset(_spr);
	var _y = _cy - sprite_get_height(_spr) / 2 + sprite_get_yoffset(_spr);
	draw_sprite(_spr, _frame, _x, _y);
}

// Retorna true quando as vidas acabaram
function perder_vida()
{
	if (global.vidas <= 0) return true;
	
	global.vidas--;
	coracao_hit[global.vidas] = 0; // anima o coração que acabou de ser perdido (o mais à direita)
	
	return (global.vidas <= 0);
}