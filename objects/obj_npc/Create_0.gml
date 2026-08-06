sprite_index = sprite;

interagivel = true;
texto = [];

fala = function()
{
    //criando o dialogo so se ele n foi criado
    if (!instance_exists(obj_dialogo))
    {
      var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
      _dialogo.lista_textos = global.dialogos.npc[$ nome];
    }
}