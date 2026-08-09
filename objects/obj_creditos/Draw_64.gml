//transição
if (!transicao) exit;

alpha = lerp(alpha, 0, .05);
draw_set_alpha(alpha);

//retangulo preto
draw_rectangle_colour(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, 0);


draw_set_alpha(1);