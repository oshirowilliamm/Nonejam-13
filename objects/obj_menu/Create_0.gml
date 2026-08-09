//textos
menu = ["Jogar", "Configuração", "Sair"];
config = ["Tela Cheia", "Volume", "Voltar"];
atual = 0;

tela_atual = "menu";

//escalas
escala_logo = 5;
escala_botao = 6;

desenha_menu = function()
{
    draw_set_font(fnt_menu);
    draw_set_halign(1);
    draw_set_valign(1);
    
    //logo
    var _xlogo = 450;
    var _ylogo = 200;
    draw_sprite_ext(spr_logo, 0, _xlogo, _ylogo, escala_logo, escala_logo, 0, c_white, 1);
    
    //pegando qual a tela
    var _tela = (tela_atual == "menu") ? menu : config;
    
    //desenhando os textos
    for (var i = 0; i < array_length(_tela); i++)
    {
        var _cor = c_white;
        var _escala = .3;
        var _texto = _tela[i];
        
        //efeito de selecionado
        if (i == atual)
        {
            _cor = c_orange;
            _escala = .4;
        }
        
        
        //valores do config
        if (tela_atual == "config")
        {
            //tela cheia
            if (i == 0)
            {
                _texto += ": " + (global.tela_cheia ? "Sim" : "Não");
            }
            //volume master
            else if (i == 1)
            {
                _texto += ": " + (string(round(global.volume_master * 100))) + "%";
            }
        }
        
        
        //posição
        var _espaco = 224;
        var _x = display_get_gui_width() - 230;
        var _y = 120 + (i * _espaco);
        
        //fundo
        draw_sprite_ext(spr_botao, 0, _x, _y, escala_botao, escala_botao, 0, c_white, 1);
        
        //texto
        draw_set_colour(_cor);
        draw_text_transformed(_x, _y, _texto, _escala, _escala, 0);
        draw_set_colour(-1);
    }
    
    draw_set_halign(-1)
    draw_set_valign(-1);
    draw_set_font(-1);
}

controla_menu = function()
{
    //inputs
    var _baixo  = keyboard_check_pressed(vk_down)   || keyboard_check_pressed(ord("S"));
    var _cima   = keyboard_check_pressed(vk_up)     || keyboard_check_pressed(ord("W"));
    var _esq    = keyboard_check_pressed(vk_left)   || keyboard_check_pressed(ord("A"));
    var _dir    = keyboard_check_pressed(vk_right)  || keyboard_check_pressed(ord("D"));
    
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
    var _tela = (tela_atual == "menu") ? array_length(menu) : array_length(config);
    atual = clamp(atual, 0, _tela - 1);
    
    //controles do config
    if (tela_atual == "config" && (_esq || _dir))
    {
        //tela cheia
        if (atual == 0)
        {
            global.tela_cheia = !global.tela_cheia;
            window_set_fullscreen(global.tela_cheia);
            cria_som(snd_digitando);
        }
        //volume master
        else if (atual == 1)
        {
            var _selecao = _dir ? .1 : -.1;
            global.volume_master = clamp(global.volume_master + _selecao, 0, 1);
            audio_master_gain(global.volume_master);
            cria_som(snd_digitando);
        }
    }
    
    //funcionamento do menu
    ativa_menu();
}

ativa_menu = function()
{
    var _enter = keyboard_check_pressed(vk_enter);
    var _espaco = keyboard_check_pressed(vk_space);
    
    if (_enter || _espaco)
    {
        cria_som(snd_bip_dialogo);
        
        //menu
        if (tela_atual == "menu")
        {
            switch (atual) 
            {
                //jogar
                case 0:
                {
                    //começando introdução
                    global.introducao = true;
                    
                    //destroi o menu
                    instance_destroy();
                    
                    break;
                }
                
                //config
                case 1:
                {
                    //mudando tela
                    tela_atual = "config";
                    atual = 0;
                    
                    break;
                }
                
                //sair
                case 2: game_end(); break;
            }
        }
        //config
        else if (tela_atual == "config")
        {
            switch (atual) 
            {
                //tela cheia
                case 0:
                {
                    global.tela_cheia = !global.tela_cheia;
                    window_set_fullscreen(global.tela_cheia);
                    
                    break;
                }
                
                //volume
                case 1: break;
                
                //voltar
                case 2:
                {
                    tela_atual = "menu";
                    atual = 1;
                    
                    break;
                }   
            }
        }
    }
}
