show_debug_overlay(0);



//setando cores novas
scribble_color_set("pink", #d77bba);
scribble_color_set("police", #3F3F74);
scribble_color_set("ana", #7C1E1E);
scribble_color_set("irma_red", #C50A0A);
scribble_color_set("irma_yellow", #E4AE18);
scribble_color_set("irma_green", #468F14);


//tirando mouse
window_set_cursor(cr_none);


//controle
pausado = false;
bg = 1;

//variaveis pro menu do pause
menu_pause = ["Retomar", "Volume", "Sair"];
atual = 0;

pausar = function()
{
    if (room != rm_game) exit;
    
    if (keyboard_check_pressed(vk_escape))
    {
        global.pause = !global.pause;
        pausado = !pausado;
        
        if (pausado)
        {
            //parando background
            layer_background_speed(layer_background_get_id("RodasTrem"), 0);
            layer_hspeed("Nuvens", 0);
            layer_hspeed("Trilho", 0);
            layer_hspeed("FundoCenario", 0);
        }
        else
        {
            //voltando background
            layer_background_speed(layer_background_get_id("RodasTrem"), 15);
            layer_hspeed("Nuvens", 0.5);
            layer_hspeed("Trilho", 4);
            layer_hspeed("FundoCenario", 2);   
        }
    }
}

controle_pause = function()
{
    if (!pausado) exit;
    
    //inputs
    var _baixo  = keyboard_check_pressed(vk_down)   || keyboard_check_pressed(ord("S"));
    var _cima   = keyboard_check_pressed(vk_up)     || keyboard_check_pressed(ord("W"));
    var _esq    = keyboard_check_pressed(vk_left)   || keyboard_check_pressed(ord("A"));
    var _dir    = keyboard_check_pressed(vk_right)  || keyboard_check_pressed(ord("D"));
    var _enter  = keyboard_check_pressed(vk_enter);
    
    //indo pra baixo
    if (_baixo)
    {
        //mudando o atual
        atual++;
        cria_som(snd_digitando);
    }
    
    //indo pra cima
    if (_cima)
    {
        //mudando o atual
        atual--;
        cria_som(snd_digitando);
    }
    
    //limitando o atual
    atual = clamp(atual, 0, array_length(menu_pause) - 1);
    
    //volume
    if (atual == 1 && (_esq || _dir))
    {
        var _selecao = _dir ? 0.1 : -0.1;
        global.volume_master = clamp(global.volume_master + _selecao, 0, 1);
        audio_master_gain(global.volume_master);
        cria_som(snd_digitando);
    }
    
    //retomar/sair
    if (_enter)
    {
        cria_som(snd_bip_dialogo);
        
        switch (atual) 
        {
        	//retomar
            case 0:
            {
                keyboard_clear(vk_escape);
                
                global.pause = false;
                pausado = false;
                
                //voltando background
                layer_background_speed(layer_background_get_id("RodasTrem"), 15);
                layer_hspeed("Nuvens", 0.5);
                layer_hspeed("Trilho", 4);
                layer_hspeed("FundoCenario", 2);  
                
                break;
            }
            
            //volume
            case 1: break;
            
            //sair
            case 2: game_end(); break;
        }
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
            //trem explode
            if (!instance_exists(obj_explosao))
            {
                instance_create_layer(0, 0, layer, obj_explosao);
            }
        }
        else
        {
            global.timer = global.tempo_timer;
        }
    }
}

//balanco do trem
trem_treme = function()
{
    //quando for 46s, balança
    var _tempo_certo = 49 * FPS;
    
    if (global.timer <= _tempo_certo && !global.trem_tremeu)
    {
        screenshake(20);
        cria_som(snd_batida);
        
        global.trem_tremeu = true;
    }
}