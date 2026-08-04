// Inherit the parent event
event_inherited();

sprite = spr_janela_enferrujada;
image_speed = 0;
alcance = 20;

interagir = function()
{
    if (sprite == spr_janela_enferrujada) exit;
    
    //deixando de ser interagivel
    interagivel = false;
    
    //abrindo a janela
    image_speed = 1;
    if (image_index == 4) 
    {
        image_speed = 0;
        image_index = 4;
    }
}