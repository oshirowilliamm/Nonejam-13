// Inherit the parent event
event_inherited();

//parando a animação
if (image_speed > 0 && image_index >= 4) 
{
    image_speed = 0;
    image_index = 4;
    
    //cria a abelha
    instance_create_layer(x - 10, y - 10, "Abelha", obj_abelha);
}



//debug
//if (keyboard_check_pressed(vk_up)) sprite = spr_janela;