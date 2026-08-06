// Inherit the parent event
event_inherited();

if (keyboard_check_pressed(vk_enter)) global.abelha_no_vaso = true;

//se a abelha esta perto
if (!global.abelha_no_vaso) exit;

exclamacao();
sprite_assustada();

//voltando ao normal
if (global.acabou_reacao1) sprite_index = spr_ana_catarina;