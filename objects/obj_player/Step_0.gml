PAUSE
controle_player();

//DEBUG
if (keyboard_check_pressed(vk_enter)) 
{
    //global.acabou_reacao1 = !global.acabou_reacao1
    //global.rato_chegou = true;
    global.valvula_ligada = true;
    obj_cafeteira.timer();
}