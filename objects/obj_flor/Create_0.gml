// Inherit the parent event
event_inherited();

item_sprite = index == 0 ? spr_inv_flor_vermelha : spr_inv_flor_azul;
item_sprite_menor = spr_flor;
item_nome = "Flor";


drop_highlight = function()
{
    //dropando o highlight
    var _high = instance_create_layer(x, y, layer, obj_highlight);
    _high.sprite_index = item_sprite_menor;
    _high.image_index = index;
    _high.alcance = alcance;
    
    //dropando o highlight da ana catarina
    _high = instance_create_layer(167, 189, layer, obj_highlight);
    _high.sprite_index = item_sprite_menor;
    _high.image_index = index;
    _high.alcance = alcance;
}