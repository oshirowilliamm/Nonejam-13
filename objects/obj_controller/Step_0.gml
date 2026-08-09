pausar();
controle_pause();
controla_tempo();
trem_treme();

//reset
if (room == rm_game)
{
    if (keyboard_check_pressed(ord("R")) && !instance_exists(obj_transicao)) 
    {
        restart();
        
    }
}
