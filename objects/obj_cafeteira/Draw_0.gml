draw_self();

//desenhando o timer
if (!desenha_timer) exit;

draw_set_font(fnt_dialogo);
draw_set_halign(1);
draw_set_valign(1);

//so desenha o timer se ainda estiver rolando
if (timer_desenho > 0)
{
    var _escala = .7;
    var _texto = string(round(timer_desenho / 60));
    draw_text_transformed(x, y - 10, _texto, _escala, _escala, 0);
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);