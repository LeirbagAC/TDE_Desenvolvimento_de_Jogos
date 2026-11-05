var _colx, _coly;

_colx = instance_place(x + velh, y, obj_bloco);
_coly = instance_place(x, y + velv, obj_bloco);

// Colisão Horizontal
if (_colx != noone)
{
	if (velh > 0) 
	{
		x = _colx.bbox_left - (bbox_right - x);	
	}
	if (velh < 0) 
	{
		x = _colx.bbox_right - (bbox_left - x);
	}
	velh = 0;
}

// Colisão Vertical
if (_coly != noone)
{
	// Caindo (batendo no chão)
	if (velv > 0) 
	{
		y = _coly.bbox_top - (bbox_bottom - y);	
	}
	// Pulando (batendo no teto)
	if (velv < 0) 
	{
		y = _coly.bbox_bottom - (bbox_top - y);
	}
	velv = 0;
}

x += velh;
y += velv;