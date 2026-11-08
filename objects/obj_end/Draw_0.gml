draw_self();

if (aviso > 0)
{
	var _faltam = global.frutas_total - global.frutas_coletadas;
	draw_set_halign(fa_center);
	draw_text(x, y - 40, "Faltam " + string(_faltam) + " fruta(s)!");
	draw_set_halign(fa_left);
}