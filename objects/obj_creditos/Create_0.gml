alpha = 1;
transicao = false;

desenha_transicao = function()
{
    //transição
    if (!transicao) exit;
    
    alpha = lerp(alpha, 0, .05);
    draw_set_alpha(alpha);
    
    //retangulo preto
    draw_rectangle_colour(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, 0);
    
    
    draw_set_alpha(1);
}

desenha_creditos = function()
{
    //fundo
    draw_sprite_stretched_ext(spr_caixa_creditos, 0, 0, -10, 800, 800, c_black, .5);
    
    //meus creditos
    //posição
    var _x = 390;
    var _y = display_get_gui_height() / 2 - 100;
    
    //textos
    var _texto = 
    "[scale, 2.2][wave][rainbow]OBRIGADO POR JOGAR![/]\n\n" +
    
    "Desenvolvido por:\n" + 
    "[wheel][#46A5DC][scale, 1.25]pandinhaboladao[/]\n" +
    "Para a NoneJam 13 [c_red]<3[/]\n";
    
    //desenhando
    var _txt = scribble(_texto);
    _txt.starting_format("fnt_dialogo", c_white);
    _txt.align(1, 1); 
    _txt.draw(_x, _y);
    
    //nomes
    //posição
    var _x1 = 50;
    var _y1 = display_get_gui_height() / 2 + 250;
    
    //textos
    var _texto1 = 
    "[c_yellow]SPRITES:[/]\n\n\n" +
        
    "[c_yellow]AUDIO:[/]\n";

    //desenhando
    var _txt1 = scribble(_texto1);
    _txt1.starting_format("fnt_dialogo", c_white);
    _txt1.align(0, 1); 
    _txt1.draw(_x1, _y1);
    
    //creditos
    //posição
    var _x2 = 200;
    var _y2 = display_get_gui_height() / 2 + 250;
    
    //textos
    var _texto2 = 
    "Explosão: [#46A5DC]Sogomn [c_grey](opengameart.org)[/]\n" +
    "Fogo: [#46A5DC]Devkidd [c_grey](itch.io)[/]\n\n" +
    "Músicas: [#46A5DC]Kevin MacLeod [c_grey](incompetech)[/]\n" +
    "SFX: [#46A5DC]Bfxr.net[/]\n";

    //desenhando
    var _txt2 = scribble(_texto2);
    _txt2.starting_format("fnt_dialogo", c_white);
    _txt2.align(0, 1); 
    _txt2.draw(_x2, _y2);
}