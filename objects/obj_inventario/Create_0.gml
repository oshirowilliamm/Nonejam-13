escala = 4;

desenha_inventario = function()
{
    if (global.inventario)
    {
        //desenhando slot de inventario
        var _margem = 80;
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
    draw_set_font(fnt_inventario);
    
    //nome
    var _nome = global.item.nome;
    
    //desenhando fundo do nome
    var _margem_w = 20;
    var _margem_h = 30;
    
    var _wfundo = _margem_w + string_width(_nome) + _margem_w;
    var _hfundo = _margem_h + string_height(_nome) + _margem_h;
    
    var _ycentro = _y + 90;
    var _xfundo = _x - (_wfundo / 2);
    var _yfundo = _ycentro- (_hfundo / 2);
    
    draw_sprite_stretched(spr_slot_nome, 0, _xfundo, _yfundo, _wfundo, _hfundo);
    
    //desenhando nome
    draw_set_halign(1);
    draw_set_valign(1);
    
    draw_text(_x, _ycentro, _nome);
    
    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_font(-1);
}