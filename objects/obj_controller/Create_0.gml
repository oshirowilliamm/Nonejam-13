show_debug_overlay(1);




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
    global.timer = clamp(global.timer, 0, global.timer - .5);
    
    //quando o tempo acabar o jogo reinicia
    if (global.timer <= 0)
    {
        restart();
    }
}

//balanco do trem
trem_treme = function()
{
    //quando for 46s, balança
    var _tempo_certo = 49;
    
    if (global.timer <= _tempo_certo * FPS && !global.trem_tremeu)
    {
        screenshake(20);
        global.trem_tremeu = true;
    }
}