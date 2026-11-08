if (sprite_index == spr_end_move)
{
	image_speed = 0;
	image_index = image_number - 1; // congela no último frame
	transicao_simples(Room1);
}