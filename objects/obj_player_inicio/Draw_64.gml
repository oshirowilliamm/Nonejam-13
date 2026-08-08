if (!instance_exists(dialogo)) exit;

//desenhando a poção
if (dialogo.linha >= 4)
{
    var _x = display_get_gui_width() - 80;
    var _y = display_get_gui_height() - 50;
    
    draw_sprite_ext(spr_pocao, 0, _x, _y, 4, 4, 0, c_white, 1);
}