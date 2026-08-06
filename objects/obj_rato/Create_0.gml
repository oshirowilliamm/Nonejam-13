//variaveis de controle
gaiola = true;
tem_queijo = false;

dest_x = 0;

//variaveis pra cair
dest_y = 271;
max_vspd = 4;
vspd = 0;
grav = .3;

estado = 0;

debug = false;

define_destino = function()
{
    //se tiver um queijo na tubulação, ele vai pra la
    //se n tiver, ele vai pro buraco
    
    //verificando o queijo
    if (instance_exists(obj_queijo))
    {
        var _queijo = instance_nearest(x, y, obj_queijo)
        var _dist = point_distance(x, y, _queijo.x, _queijo.y);
        
        //vendo se o queijo esta perto (dentro da tubulação)
        if (_dist < 100)
        {
            tem_queijo = true;
        }
    }
    
    //destino = tubulação
    if (tem_queijo)
    {
        dest_x = 11;
        image_xscale = 1;
    }
    //destino = buraco
    else
    {
        dest_x = 115;
        image_xscale = -1;
    }
    
    //DEBUG
    if (debug)
    {
        dest_x = 11;
        image_xscale = 1;
    }
    
}

define_estado = function()
{
    //se a gaiola tá fechada, nem começa
    if (gaiola) exit;
    
    switch (estado) 
    {
        //andando ate a tubulação ou buraco de cima
    	case 0:
        {
            define_destino();
            
            //indo ate o destino
            if (x != dest_x)
            {
                x += sign(dest_x - x);
                sprite_index = spr_rato_run;
            }
            //chegando no destino
            else
            {
                sprite_index = spr_rato;
                
                //destino = queijo
                if (dest_x < 50)
                {
                    estado = 1;
                }
                //destino = buraco
                else
                {
                    instance_destroy();
                }
            }
            
            break;
        }
        
        //caindo dentro da tubulação
        case 1:
        {
            //aplicando gravidade
            vspd = min(vspd + grav, max_vspd);
            y += vspd;
            
            //mudando o xscale no meio do caminho
            if (y > dest_y / 2) image_xscale = -1;
            
            //qnd chegar no chão
            if (y >= dest_y)
            {
                //evitando que entre dentro do chão
                y = dest_y;
                vspd = 0;
                
                estado = 2;
            }
            
            break;
        }
        
        //indo um pouco pra frente
        case 2:
        {
            dest_x = 30;
            
            //indo ate o destino
            if (x != dest_x)
            {
                x += sign(dest_x - x);
                sprite_index = spr_rato_run;
            }
            //chegando no destino
            else
            {
                sprite_index = spr_rato;
                
                estado = 3;
            }
            
            break;
        }
        
        //segunda queda
        case 3:
        {
            dest_y = 297;
            
            //aplicando gravidade
            vspd = min(vspd + grav, max_vspd);
            y += vspd;
            
            //qnd chegar no chão
            if (y >= dest_y)
            {
                //evitando que entre dentro do chão
                y = dest_y;
                vspd = 0;
                
                estado = 4;
            }
            
            global.rato_chegou = true;
            
            break;
        }
        
        //indo ate o buraco
        case 4:
        {
            dest_x = 71;
            
            //indo ate o destino
            if (x != dest_x)
            {
                x += sign(dest_x - x);
                sprite_index = spr_rato_run;
            }
            //chegando no destino
            else
            {
                instance_destroy();
            }
            
            break;
        }
    }
}
