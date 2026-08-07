// Inherit the parent event
event_inherited();

estado = 0;
dest_x = 195;
sprite_policial = spr_enzo_armado;

//variaveis de controle
exclama = false;


define_estado = function()
{
    if (!global.elefante_bateu) exit;
    
    switch (estado) 
    {
        //criando exclamação e virando
    	case 0:
        {
            if (!exclama)
            {
                cria_exclamacao();
                exclama = true;
            }
            
            //se vira
            image_xscale = -1;
            
            break;
        }
        
        //andando ate o elefante
        case 1:
        {
            if (x != dest_x)
            {
                x += sign(dest_x - x);
                sprite_index = spr_enzo_run;
            }
            //chegou
            else
            {
                x = dest_x;
                sprite_index = spr_enzo;
            }
            
            break;
        }
    }
}
