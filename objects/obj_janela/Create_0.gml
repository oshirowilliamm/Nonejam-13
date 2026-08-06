// Inherit the parent event
event_inherited();

sprite = spr_janela_enferrujada;
image_speed = 0;
alcance = 20;

interagir = function()
{
    if (sprite == spr_janela_enferrujada)
    {
        //criando o dialogo so se ele n foi criado
        if (!instance_exists(obj_dialogo))
        {
            var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
            _dialogo.lista_textos = global.dialogos.player.janela;
        }
    }
    else
    {
        //deixando de ser interagivel
        interagivel = false;
        
        //abrindo a janela
        image_speed = 1;
    }
}
