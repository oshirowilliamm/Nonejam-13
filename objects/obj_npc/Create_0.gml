event_inherited()

sprite_index = sprite;

texto = [];

//variaveis pra animação da barreira
sprite_policial = noone;

interagir = function()
{
    cria_dialogo(global.dialogos.npc[$ nome]);
}

//animação de policial armado com o jogador ultrapassar a barreira
animacao_barreira = function()
{
    //interagindo com a barreira
    if (instance_exists(obj_barreira))
    {
        //se estiver no ultimo dialogo
        if (obj_barreira.linha >= array_length(obj_barreira.dialogo))
        {
            //se eu for o policial certo
            if (array_contains(obj_barreira.policial, object_index))
            {
                sprite_index = sprite_policial;
            }
        }
    }
}