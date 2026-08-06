//abrindo gaiola
if (global.alavanca_1)
{
    sprite_index = spr_gaiola_caindo;
}

//parando animação
if (image_speed > 0 && image_index >= 3) 
{
    image_speed = 0;
    image_index = 3;
    
    //avisando o rato
    if (instance_exists(obj_rato)) obj_rato.gaiola = false;
}