if (!surface_exists(surf))
{
    //criando surface na sprite
    surf = surface_create(sprite_width, sprite_height);
}

surface_set_target(surf);
//limpando
draw_clear_alpha(c_black, 0);

//sprite repetindo
draw_sprite_tiled_ext(sprite_index, 0, 0, pos_y, 1, 1, c_white, .8);


surface_reset_target();

//desenhando surface
draw_surface(surf, bbox_left, bbox_top);