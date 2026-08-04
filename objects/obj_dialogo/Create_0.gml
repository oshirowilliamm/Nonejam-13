//escala
escala = 8;
alpha = 0;

//posição da caixa
xscale_fim = escala * 4.5;
xscale = 0;
yscale = escala;

//estado
estado = "fechado";

//texto do dialogo
dialogo = "Lorem [c_red]Ipsum[/c] é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.";

//criando o typist
typist = scribble_typist();
typist.in(.5, 10); //configurando velocidade da digitação



desenha_dialogo = function()
{
    //só roda se estiver tendo dialogo
    if (estado == "fechado") exit;
    
    var _x = 70;
    var _y = 20;
    
    switch (estado) 
    {
    	case "abrindo": caixa_abrindo(_x, _y); break;
        case "aberto": caixa_aberto(_x, _y); break;
        case "fechando": caixa_fechando(_x, _y); break;
    }
}

caixa_abrindo = function(_x, _y)
{
    //efeito de crescimento da caixa
    xscale = lerp(xscale, xscale_fim + 15, .05);
    alpha = lerp(alpha, 1, .1);
    
    //desenhando a caixa
    draw_sprite_ext(spr_caixa_dialogo, 0, _x, _y, xscale, yscale, 0, c_white, alpha);
    
    //avisando quando estiver aberto
    if (xscale >= xscale_fim - 2)
    {
        xscale = xscale_fim;
        estado = "aberto";
    }
}

caixa_aberto = function(_x, _y)
{
    //desenhando a caixa
    draw_sprite_ext(spr_caixa_dialogo, 0, _x, _y, xscale, yscale, 0, c_white, .9);
    
    //desenhando dialogo
    texto_dialogo(_x, _y);
    
    //indo pro fechando
    if (keyboard_check_pressed(ord("F")))
    {
        estado = "fechando";
    }
}

caixa_fechando = function (_x, _y)
{
    //efeito de fechando a caixa
    xscale = lerp(xscale, -15, .1);
    alpha = lerp(alpha, 0, .1);
    
    //desenhando a caixa
    draw_sprite_ext(spr_caixa_dialogo, 0, _x, _y, xscale, yscale, 0, c_white, alpha);
    
    //ficando fechado
    if (xscale <= 2)
    {
        xscale = 0;
        estado = "fechado";
    }
}


texto_dialogo = function(_x, _y)
{
    //infos do texto
    var _margem = 40;
    var _xtxt = _x + _margem;
    var _ytxt = _y + _margem;
    var _larg = (sprite_get_width(spr_caixa_dialogo) * xscale) - _margem;
    
    //texto com scribble
    var _txt = scribble(dialogo).starting_format("fnt_dialogo", c_white);
    _txt = _txt.wrap(_larg); //fazendo o wrap do texto
    _txt = _txt.line_height(30);
    
    //desenhando o texto
    _txt.draw(_xtxt, _ytxt, typist);
}

