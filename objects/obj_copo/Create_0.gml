// Inherit the parent event
event_inherited();

alcance = 10;
item_sprite = spr_inv_copo;
item_sprite_menor = spr_copo;
item_nome = "Copo D'água";

alvo = obj_flor_morta;
alvo_alcance = 5;

reacao = function()
{
    var _flor = instance_nearest(obj_player.x, obj_player.y, obj_flor_morta);
    
    //fazer a flor ficar viva ao dar a agua
    //criando a flor viva
    var _viva = instance_create_layer(_flor.x, _flor.y, _flor.layer, obj_flor);
    _viva.interagivel = true;
    _viva.index = _flor.index;
    
    //destruindo a flor morta
    instance_destroy(_flor);
}