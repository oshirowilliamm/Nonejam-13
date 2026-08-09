if (pausado)
{
    //tela escura
    draw_set_alpha(.5);
    draw_set_colour(c_black);
    
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), 0);
    
    draw_set_colour(c_white);
    
    var _xcentro = display_get_gui_width() / 2;
    var _ycentro = display_get_gui_height() / 2
    
    //fundo menu
    draw_set_alpha(.95);
    draw_sprite(spr_caixa_pause, 0, _xcentro, _ycentro);
    draw_set_alpha(1);
    
    //menu
    draw_set_font(fnt_menu);
    draw_set_halign(1);
    draw_set_valign(1);
    
    //desenhando os textos
    for (var i = 0; i < array_length(menu_pause); i++)
    {
        var _cor = c_white;
        var _escala = .3;
        var _texto = menu_pause[i];
        
        //efeito de selecionado
        if (i == atual)
        {
            _cor = c_orange;
            _escala = .4;
        }
        
        
        //% do volume
        if (i == 1)
        {
            _texto += ": " + string(round(global.volume_master * 100)) + "%";
        }
        
        
        //posição
        var _espaco = 100;
        var _y = _ycentro - 100 + (i * _espaco);
        
        //texto
        draw_set_colour(_cor);
        draw_text_transformed(_xcentro, _y, _texto, _escala, _escala, 0);
        draw_set_colour(-1);
    }
    
    draw_set_halign(-1)
    draw_set_valign(-1);
    draw_set_font(-1);
}