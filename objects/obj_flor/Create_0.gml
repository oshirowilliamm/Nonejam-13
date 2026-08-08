// Inherit the parent event
event_inherited();

item_sprite = spr_inv_flor_azul;
item_sprite_menor = spr_flor;
item_nome = "Flor";


drop_highlight = function()
{
    //dropando o highlight da plataforma
    var _high1 = instance_create_layer(x, y, layer, obj_highlight);
    _high1.sprite_index = item_sprite_menor;
    _high1.image_index = index;
    _high1.alcance = alcance;
    
    //dropando o highlight da ana catarina
    var _high2 = instance_create_layer(167, 189, layer, obj_highlight);
    _high2.sprite_index = item_sprite_menor;
    _high2.image_index = index;
    _high2.alcance = alcance;
}