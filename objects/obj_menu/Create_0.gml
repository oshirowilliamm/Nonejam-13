menu = ["Jogar", "Configurações", "Sair"];
atual = 0;

desenha_menu = function()
{
    draw_set_font(fnt_relogio);
    draw_set_halign(1);
    draw_set_valign(1);
    
    
    //desenhando os textos
    for (var i = 0; i < array_length(menu); i++)
    {
        var _cor = c_white;
        var _escala = .5;
        
        //efeito de selecionado
        if (i == atual)
        {
            _cor = c_yellow;
            _escala = .6;
        }
        
        
        //posição
        var _espaco = 224;
        var _x = display_get_gui_width() - 300;
        var _y = 111 + (i * _espaco);
        
        //fundo
        draw_sprite_ext(spr_botao, 0, _x, _y, 4, 4, 0, c_white, 1);
        
        //texto
        draw_set_colour(_cor);
        draw_text_transformed(_x, _y, menu[i], _escala, _escala, 0);
        draw_set_colour(-1);
    }
    
    
    draw_set_halign(-1)
    draw_set_valign(-1);
    draw_set_font(-1);
}

controla_menu = function()
{
    //inputs
    var _baixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
    var _cima = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
    
    //indo pra baixo
    if (_baixo)
    {
        //mudando o atual
        atual++;
    }
    
    //indo pra cima
    if (_cima)
    {
        //mudando o atual
        atual--;
    }
    
    //limitando o atual
    atual = clamp(atual, 0, 2);
    
    //funcionamento do menu
    ativa_menu();
}

ativa_menu = function()
{
    var _enter = keyboard_check_pressed(vk_enter);
    var _espaco = keyboard_check_pressed(vk_space);
    
    if (_enter || _espaco)
    {
        switch (atual) 
        {
            //jogar
        	case 0:
                //começando introdução
                global.introducao = true;
                
                //destroi o menu
                instance_destroy();
            break;
            
            //config
            case 1:
                show_message("Configurações");
            break;
            
            //sair
            case 2:
                game_end();
            break;
        }
    }
}