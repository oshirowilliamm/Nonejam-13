//pegando o queijo
global.inventario = true;
global.item.sprite = spr_inv_queijo;
global.item.nome = "Queijo";
global.item.obj = obj_queijo;

//criando o highlight na tubulação
var _high = instance_create_layer(19, 119, "Elementos", obj_highlight);
_high.sprite_index = spr_queijo;
_high.alcance = 15;

//adicionando o highlight no item
global.item.highlight = _high;

//destruindo o queijo
instance_destroy();