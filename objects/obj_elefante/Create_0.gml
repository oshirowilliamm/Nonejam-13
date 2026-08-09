//variaveis de controle
exclama = false;
pode_correr = false;
fez_shake = false;

timer_passo = 0;

//destino
dest_x = 66;

acao = function()
{
    //se o rato não chegou, n faz nada
    if (!global.rato_chegou) exit;
    
    //criando exclamacao
    if (!exclama)
    {
        cria_exclamacao(x - 35, y - 40);
        exclama = true;
    }
    
    //correndo ate a parede
    if (pode_correr)
    {
        sprite_index = spr_elefante_run;
        
        //correndo
        if (x != dest_x && !global.elefante_bateu)
        {
            x += sign(dest_x - x);
            
            //som do passo
            if (timer_passo <= 0)
            {
                audio_play_sound(snd_passo, 0, 0, 8, ,.2);
                timer_passo = 25;
            }
            else
            {
                timer_passo--;
            }
            
        }
        //chegou no destino
        else
        {
            //fazendo screenshake
            if (!fez_shake)
            {
                screenshake(50);
                cria_som(snd_batida);
                
                fez_shake = true;
            }
            
            //avisando q o elefante bateu
            global.elefante_bateu = true;
            
            //para
            image_speed = 0;
            image_index = 1;
            
            //indo um pouco pra tras
            x = dest_x - 8;
            
            //sprite caido
            sprite_index = spr_elefante_caido;
            
            //criando efeito de tontura
            if (!instance_exists(obj_efeito_tonto))
            {
                instance_create_depth(x, y - 10, -1, obj_efeito_tonto);
            }
        }
    }
}