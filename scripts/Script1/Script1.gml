function muda_sprite(_sprite){
	
	if(sprite_index != _sprite)
	{
		sprite_index = _sprite;
		image_index = 0;
	}
}

function transicao_simples(_room) 
{
	var _transicao = instance_create_layer(0, 0, layer, obj_transicao);
	_transicao.rm_destino = _room;
}