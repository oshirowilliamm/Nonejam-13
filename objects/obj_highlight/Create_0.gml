alcance = 0;
ativo = false;


devolvendo = function()
{
    //se destruindo
    instance_destroy();
    
    //criando o obj de volta
    var _obj = instance_create_layer(x, y, layer, global.item.obj);
    _obj.interagivel = true;
    
    //resetando global
    global.inventario = false;
}