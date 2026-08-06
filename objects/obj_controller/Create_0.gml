show_debug_overlay(0);




pausar = function()
{
    if (keyboard_check_pressed(vk_escape))
    {
        global.pause = !global.pause;
    }
}

controla_tempo = function()
{
    PAUSE
    //diminuindo tempo
    global.timer = clamp(global.timer, 0, global.timer--);
    
    //quando o tempo acabar o jogo reinicia
    if (global.timer <= 0)
    {
        restart();
    }
}

//balanco do trem
trem_treme = function()
{
    //quando for 40s, balança
    if (global.timer < 55 * FPS && !global.trem_tremeu)
    {
        screenshake(50);
        global.trem_tremeu = true;
    }
}