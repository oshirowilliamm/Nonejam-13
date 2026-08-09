pausar();
controla_tempo();
trem_treme();

if (room == rm_game)
{
    //reseta
    if (keyboard_check_pressed(ord("R")) && !instance_exists(obj_transicao)) 
    {
        restart();
    }
}