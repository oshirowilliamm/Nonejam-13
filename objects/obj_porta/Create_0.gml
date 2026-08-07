// Inherit the parent event
event_inherited();

interagir = function()
{
    //se tiver trancada
    if (image_index == 0)
    {
        //dialogo do player
        cria_dialogo(global.dialogos.player.porta);
    }
    //se tiver aberta
    else
    {
        game_end();
    }
}