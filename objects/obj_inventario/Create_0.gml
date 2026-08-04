escala = 4;

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
        if (global.item.sprite != noone)
        {
            //sprite
            draw_sprite_ext(global.item.sprite, 0, _xslot, _yslot, escala, escala, 0, c_white, 1);
            //nome
            desenha_info_item(_xslot, _yslot);
        }
    }
}

desenha_info_item = function(_x, _y)
{
    //desenhando fundo do nome
    var _xfundo = _x + 100;
    
    draw_sprite_ext(spr_slot_nome, 0, _xfundo, _y, escala, escala, 0, c_white, 1);
    
    //desenhando nome
    var _xx = _x + 190;
    var _yy = _y - 2;
    
    draw_set_font(fnt_inventario);
    draw_set_halign(1);
    draw_set_valign(1);
    draw_text(_xx, _yy, global.item.nome);
    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_font(-1);
}