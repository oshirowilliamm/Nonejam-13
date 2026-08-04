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

desenha_inventario = function()
{
    if (global.inventario)
    {
        //desenhando slot de inventario
        var _margem = 60;
        var _h = display_get_gui_height();
        var _w_spr = sprite_get_width(spr_slot);
        var _h_spr = sprite_get_height(spr_slot);
        var _xslot = _w_spr + _margem;
        var _yslot = _h - _h_spr - _margem;
        
        draw_sprite_ext(spr_slot, 0, _xslot, _yslot, escala, escala, 0, c_white, 1);
        
        //desenhando elemento
        if (global.item != noone)
        {
            draw_sprite_ext(global.item, 0, _xslot, _yslot, escala, escala, 0, c_white, 1);
        }
    }
}