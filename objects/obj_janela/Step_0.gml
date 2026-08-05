// Inherit the parent event
event_inherited();

//parando a animação
if (image_speed > 0 && image_index >= 4) 
{
    image_speed = 0;
    image_index = 4;
}