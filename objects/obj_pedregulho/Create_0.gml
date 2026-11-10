event_inherited();

mask_index = spr_rock_Idle; // a máscara não muda quando troca de sprite
sprite_index = spr_rock_Idle;

aceleracao = 0.25;
vel_atual = 0;

direcao = (direcao_inicial == 0) ? choose(1, -1) : sign(direcao_inicial);

estado = ESTADO_PEDREGULHO.PARADO;
tempo_estado = FPS * 0.8; // pausa curta antes do primeiro movimento