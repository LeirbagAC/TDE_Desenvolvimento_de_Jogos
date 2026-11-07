// Inherit the parent event
event_inherited();

inimigo_morto = false;
levou_dano = false;
inimigo_vida = 3;

velocidade = choose(1, -1);
virar_inimigo = true;

invencivel = false;
tempo_decidir_andar = room_speed; 
andando = true;

pig_hit = instance_create_layer(x, y, layer, obj_hit);

pig_hit.image_yscale = pig_hit.image_yscale * 0.7;
pig_hit.image_xscale = pig_hit.image_xscale * 1.5;
