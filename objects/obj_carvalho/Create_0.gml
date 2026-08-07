// Inherit the parent event
event_inherited();

estado = 0;
x_escada = 349;
y_escada = 297;

dest_y = 229;
dest_x = 363;

//variaveis de controle
exclama = false;
escada = false;

define_estado = function()
{
    //se explodiu
    if (!global.explosao) exit;
    
    switch (estado) 
    {
        //criando exclamacao
    	case 0:
        {
            if (!exclama)
            {
                cria_exclamacao(x, y - 10); //cria um alarm[0]
                exclama = true;
            }
            
            break;
        }
        
        //criando a escada
        case 1:
        {
            if (!escada)
            {
                instance_create_layer(x_escada, y_escada, "Cenario", obj_escada);
                escada = true;
            }
            
            //andando ate a escada
            if (x != x_escada)
            {
                x += sign(x_escada - x);
                sprite_index = spr_carvalho_run;
            }
            //chegou na escada
            else
            {
                sprite_index = spr_carvalho;
                estado = 2;
            }
            
            break;
        }
        
        //subindo a escada
        case 2:
        {
            if (y != dest_y)
            {
                y += sign(dest_y - y);
                sprite_index = spr_carvalho_run;
                image_xscale = -1;
            }
            //chegou
            else
            {
                y = dest_y;
                estado = 3;
                image_xscale = 1;
            }
            
            break;
        }
        
        //andando um pouquinho e cria o efeito
        case 3:
        {
            if (x != dest_x)
            {
                x += sign(dest_x - x);
            }
            //chegou
            else
            {
                sprite_index = spr_carvalho;
                image_xscale = -1;
                x = dest_x;
            }
            
            break;
        }
    }
}