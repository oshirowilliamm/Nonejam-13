//desligando
if (global.elefante_bateu && !final)
{
    image_speed = 1;
    
    //no fim da animação, se destroi
    if (image_index > image_number - 1)
    {
        instance_destroy();
    }
}