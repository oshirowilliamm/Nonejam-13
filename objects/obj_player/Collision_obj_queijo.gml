//pegando o queijo
global.inventario = true;
global.item.sprite = spr_inv_queijo;
global.item.nome = "Queijo";
global.item.obj = obj_queijo;

//destruindo o queijo
instance_destroy(other);
