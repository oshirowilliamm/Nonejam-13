// Inherit the parent event
event_inherited();

//interagindo com a barreira
if (instance_exists(obj_barreira))
{
    //se estiver no ultimo dialogo
    if (obj_barreira.linha >= 3)
    {
        //trocando sprite pra atirando
        sprite = spr_edson_armado;
        
        //se n tiver dialogo, restarta
        if (!instance_exists(obj_dialogo))
        {
            restart();
        }
    }
}

