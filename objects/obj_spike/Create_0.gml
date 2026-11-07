var _spike_hit = instance_create_layer(x, y-2, layer, obj_hit);

//para cortar metade da da altura (y) do obj spike
_spike_hit.image_yscale = _spike_hit.image_yscale / 2; 