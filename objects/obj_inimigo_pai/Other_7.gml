switch (estado)
{
	case ESTADO_INIMIGO.MORTO:
		instance_destroy();
	break;
	
	case ESTADO_INIMIGO.DANO:
		estado = ESTADO_INIMIGO.PARADO;
		tempo_estado = FPS * 0.5;
	break;
}