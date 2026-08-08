show_debug_overlay(0);



//setando cores novas
scribble_color_set("pink", #d77bba);
scribble_color_set("police", #3F3F74);
scribble_color_set("ana", #7C1E1E);
scribble_color_set("irma_red", #C50A0A);
scribble_color_set("irma_yellow", #E4AE18);
scribble_color_set("irma_green", #468F14);



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
    global.timer = max(0, global.timer - .5);
    
    //quando o tempo acabar o jogo reinicia
    if (global.timer <= 0)
    {
        if (room == rm_game)
        {
            restart();
        }
        else
        {
            global.timer = 60 * FPS;
        }
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