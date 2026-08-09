//iniciando o dialogo
if (global.introducao)
{
    if (!alarme)
    {
        alarm[0] = 4 * FPS;
        alarme = true;
    }
}


//fazendo a bruxa sumir
if (instance_exists(dialogo))
{
    if (dialogo.linha >= 8)
    {
        with (obj_bruxa) 
        {
        	if (image_alpha > 0)
            {
                image_alpha -= .01;
                
                //tirando a musica
                cria_soundtrack(noone, 1500);
            }
            else
            {
                instance_destroy();
            }
        }
    }
}

