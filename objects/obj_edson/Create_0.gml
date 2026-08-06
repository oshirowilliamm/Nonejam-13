// Inherit the parent event
event_inherited();

sprite_index = spr_edson;

//variaveis de controle
exclama = false;
pode_correr = false
ja_atirou = false;

//variaveis pro correndo
dest_x = 178;
dest_y = 191;
novo_dest_x = dest_x;


controle_edson = function()
{
    sprite_armado();
    exclamacao();
    correndo();
}

sprite_armado = function()
{
    //interagindo com a barreira
    if (instance_exists(obj_barreira))
    {
        //se estiver no ultimo dialogo
        if (obj_barreira.linha >= 3)
        {
            atirando();
            
            //se n tiver dialogo, restarta
            if (!instance_exists(obj_dialogo))
            {
                restart();
            }
        }
    }
}

exclamacao = function()
{
    //se a ana nao esta assustada nao acontece nada
    if (!global.ana_assustada) exit;
    
    if (!exclama)
    {
        exclamacao_npc();
        
        exclama = true;
    }
}

correndo = function()
{
    if (!pode_correr) exit;
        
    depth = -1;
    
    //indo ate a ana catarina
    if (x != dest_x)
    {
        x--;
        
        //mudando sprite
        sprite_index = spr_edson_run;
    }
    //chegou ate a abelha
    else
    {
        //atira nela
        atirando();
    }
    
    //dps de tudo isso, senta no assento
    if (novo_dest_x != dest_x)
    {
        //indo
        if (x > novo_dest_x)
        {
            x--;
            
            //mudando sprite
            sprite_index = spr_edson_run;
        }
        //sentando
        else
        {
            //mudando sprite
            sprite_index = spr_edson_sentado;
            
            //parando
            x = novo_dest_x;
            y = dest_y - 2;
            
            //acabando
            global.acabou_reacao1 = true;
        }
    }
}

atirando = function()
{
    //trocando sprite pra atirando
    sprite_index = spr_edson_armado;
    
    //matando abelha e flor
    if (!ja_atirou)
    {
        //destruindo flor
        var _flor = instance_nearest(x, y, obj_flor);
        instance_destroy(_flor);
        
        //destruindo sequence
        if (layer_exists("sq_abelha"))
        {
            layer_destroy("sq_abelha");
        }
        
        if (alarm[1] < 0)
        {
            //dando um tempo pra mudar de estado
            alarm[1] = .5 * FPS;
        }
        
        ja_atirou = true;
    }
}
