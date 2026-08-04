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
    draw_set_font(fnt_dialogo);
    draw_set_halign(1);
    draw_set_valign(1);
    
    var _txt = string(tempo / 60);
    draw_text(_x, _y, _txt);
    
    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_font(-1);
}