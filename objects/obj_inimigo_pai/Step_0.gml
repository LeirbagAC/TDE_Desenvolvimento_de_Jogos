// Ponte com o código antigo
if (levou_dano)
{
	levou_dano = false;
	receber_dano(1);
}

// Hitbox acompanha o inimigo
if (instance_exists(hitbox))
{
	hitbox.x = x;
	hitbox.y = y - 4;
}

// Gravidade só no ar (evita tremer no chão)
if (!no_chao()) velv += gravidade;