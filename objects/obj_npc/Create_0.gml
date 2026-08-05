texto = [];

fala = function()
{
    //criando o dialogo so se ele n foi criado
    if (!instance_exists(obj_dialogo))
    {
      var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
      _dialogo.lista_textos = texto;
    }
}

definindo_texto_npc = function()
{
    //pegando a sprite e tirando o spr_
    var _sprite = sprite_get_name(sprite);
    var _chave  = string_replace(_sprite, "spr_", "");
    
    //pegando o texto do npc
    texto = global.dialogos.npc[$ _chave];
}