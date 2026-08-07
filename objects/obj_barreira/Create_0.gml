dialogo = [];
x_tiro = 0;
y_tiro = 0;
policial = [];

linha = 0;

//pra empurra o player pra tras
x_prev = 0;

define_barreira = function()
{
    switch (index) 
    {
        //primeira barreira
    	case 0:
        {
            dialogo = [global.dialogos.especial.barreira1, global.dialogos.especial.barreira2, global.dialogos.especial.barreira3];
            x_tiro = 270;
            y_tiro = 190;
            policial = [obj_edson];
            
            break;
        }
        
        //barreira do elevador
        case 1:
        {
            dialogo = [global.dialogos.especial.barreira_elevador];
            x_tiro = 323;
            y_tiro = obj_player.y;
            policial = [obj_enzo, obj_carvalho];
            
            break;
        }
    }
}

//colidindo com o player
colisao_player = function()
{
    if (!instance_exists(obj_dialogo))
    {
        if (linha < array_length(dialogo))
        {
            //criando o dialogo
            cria_dialogo(dialogo[linha]);
            
            //pulando para a prox linha
            linha++;
            
            //se ainda tiver dialogos
            if (linha < array_length(dialogo))
            {
                //empurra o jogador 
                with (obj_player) 
                {
                	x = other.x_tiro;
                }
            }
            //acabou o dialogo
            else
            {
                with (obj_player) 
                {
                    //travando o player
                    hspd = 0;
                    estado = "parado";
                    levanto_tiro = true;
                    
                    //teleportando o player
                    x = other.x_tiro;
                    y = other.y_tiro;
                }
            }
        }
    }
}
