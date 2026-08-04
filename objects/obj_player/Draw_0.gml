//desenhando a tecla
if (desenho && !global.inventario)
{
    draw_sprite(spr_tecla, 0, x, y - 24);
}

//desenhando highlight
highlight_item();