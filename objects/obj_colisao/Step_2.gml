// Horizontal
if (place_meeting(x + velh, y, obj_bloco))
{
	var _passo_x = sign(velh);
	while (!place_meeting(x + _passo_x, y, obj_bloco)) x += _passo_x;
	velh = 0;
}
x += velh;

// Vertical
if (place_meeting(x, y + velv, obj_bloco))
{
	var _passo_y = sign(velv);
	while (!place_meeting(x, y + _passo_y, obj_bloco)) y += _passo_y;
	velv = 0;
}
y += velv;