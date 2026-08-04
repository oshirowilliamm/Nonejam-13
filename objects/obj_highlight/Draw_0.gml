//desenhando a sprite do item branco
shader_set(sh_branco);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, .7);
shader_reset();