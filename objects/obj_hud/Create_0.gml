escala = 4;

//timer
tempo = game_get_speed(gamespeed_fps) * 30;

desenha_relogio = function()
{
    //desenhando relogio
    var _x = display_get_gui_width() / 2;
    var _y = 80;
    draw_sprite_ext(spr_relogio, 0, _x, _y, escala, escala, 0, c_white, 1);
    
    //desenhando timer
    draw_set_font(fnt_relogio);
    draw_set_halign(1);
    draw_set_valign(1);
    
    var _txt = string(tempo / 60);
    draw_text_transformed(_x, _y, _txt, .5, .5, 0);
    
    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_font(-1);
}

desenha_pocao = function()
{
    var _x = display_get_gui_width() - 80;
    var _y = display_get_gui_height() - 100;
    
    draw_sprite_ext(spr_pocao, 0, _x, _y, escala, escala, 0, c_white, 1);
}

reinicia_jogo = function()
{
    //diminuindo tempo
    tempo = clamp(tempo, 0, tempo--);
    
    //quando o tempo acabar o jogo reinicia
    if (tempo <= 0)
    {
        game_restart();
        global.inventario = false;
        
        global.item = 
        {
            sprite: noone,
            nome: "",
            obj: noone,
            efeito: function(){},
            
            alvo: noone,
            alvo_alcance: 0,
            highlight: noone,
        }
    }
}