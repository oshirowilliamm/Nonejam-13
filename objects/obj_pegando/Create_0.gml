player_interagindo = false;
alcance = 10;

item_sprite         = noone;
item_sprite_menor   = noone;
item_nome           = "";

//variaveis do alvo
alvo = noone;
alvo_alcance = 0;

pegando = function()
{
    //destruindo o item
    instance_destroy();
    
    var _highlight = drop_highlight();
    
    //colocando no inventario
    global.inventario = true;
    global.item.sprite          = item_sprite;
    global.item.nome            = item_nome;
    global.item.obj             = object_index;
    global.item.efeito          = reacao;
    
    //alvo
    global.item.alvo            = alvo;
    global.item.alvo_alcance    = alvo_alcance;
    global.item.highlight       = _highlight;
}

drop_highlight = function()
{
    //dropando o highlight
    var _high = instance_create_layer(x, y, layer, obj_highlight);
    _high.sprite_index = item_sprite_menor;
    _high.alcance = alcance;
    
    return _high;
}

reacao = function()
{
    
}