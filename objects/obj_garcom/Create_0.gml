// Inherit the parent event
event_inherited();

subida_y = 170;
chao_y = 188;

//variaveis de controle
subiu = false;
criou_queijo = false;
exclama = false;

texto = global.dialogos.npc.garcom;


tropecando = function()
{
    //quando o trem tremer, ele tropeça e o queijo voa
    if (!global.trem_tremeu) exit;
    
    if (!exclama)
    {
        cria_exclamacao(x - 10, y - 35, 1);
        exclama = true;
    }
    
    //parando animação
    image_speed = 0;
    
    //pulando
    if (!subiu)
    {
        //pulando
        y -= 2;
        x -= 1;
        
        //criando o queijo
        if (!criou_queijo)
        {
            instance_create_layer(x, y, "Elementos", obj_queijo);
            criou_queijo = true;
        }
        
        //avisando q subiu
        if (y <= subida_y) subiu = true;
    }
    //caindo
    else
    {
        //descendo
        if (y < chao_y) 
        {
            y += 2;
        }
        else
        {
            y = chao_y;
        }
        
        //girando
        sprite_index = spr_garcom_caido;
        if (image_angle < 90) 
        {
            image_angle += 4;
        }
        else
        {
            image_angle = 90;
        }
    }
    
    //mudando dialogo
    texto = global.dialogos.especial.garcom_caido;
}

interagir = function()
{
    cria_dialogo(texto);
}