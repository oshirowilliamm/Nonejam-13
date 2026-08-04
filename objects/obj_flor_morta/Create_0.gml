// Inherit the parent event
event_inherited();

// Inherit the parent event
event_inherited();

item_sprite = index == 0 ? spr_inv_flor_vermelha : spr_inv_flor_azul;
item_sprite_menor = spr_flor;
item_nome = "Flor";

alvo = obj_janela;
alvo_alcance = 20;

//escolhendo entre a sprite de flor morta ou viva
sprite = spr_flor;
foi_aguada = false;