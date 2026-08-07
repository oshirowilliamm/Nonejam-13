// Inherit the parent event
event_inherited();

//quando terminar de girar, ta ligado
if (image_index > image_number - 1)
{
    //ativando gas
    global.valvula_ligada = true;
    
    alarm[0] = 10;
}