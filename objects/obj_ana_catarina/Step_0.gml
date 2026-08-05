// Inherit the parent event
event_inherited();

if (keyboard_check_pressed(vk_enter)) global.abelha_no_vaso = true;

//se a abelha esta perto
if (!global.abelha_no_vaso) exit;

//gritando
if (!grito)
{
    //criando exclamação
    instance_create_layer(x, y - 10, layer, obj_exclamacao);
    
    //mudando a sprite
    sprite = spr_ana_catarina_medo;
    
    grito = true;
}

//se ela estiver assustada, fica tremendo
if (sprite == spr_ana_catarina_medo)
{
    //tremendo
    var _valor = 186;
    x = random_range(_valor - .5, _valor + .5);
    
    show_debug_message(_valor);
}

