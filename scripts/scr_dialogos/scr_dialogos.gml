function desenha_dialogo()
{
    //só roda se estiver tendo dialogo
    if (estado_dialogo == "fechado") exit;
    
    var _x = 70;
    var _y = 20;
    
    switch (estado_dialogo) 
    {
    	case "abrindo": caixa_abrindo(_x, _y); break;
        case "aberto": caixa_aberto(_x, _y); break;
        case "fechando": caixa_fechando(_x, _y); break;
    }
}

function caixa_abrindo(_x, _y)
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
        estado_dialogo = "aberto";
    }
}

function caixa_aberto(_x, _y)
{
    //desenhando a caixa
    draw_sprite_ext(spr_caixa_dialogo, 0, _x, _y, xscale, yscale, 0, c_white, .9);
    
    //desenhando dialogo
    texto_dialogo(_x, _y);
    
    //indo pro fechando
    if (keyboard_check_pressed(ord("F")))
    {
        estado_dialogo = "fechando";
    }
}

function caixa_fechando(_x, _y)
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
        estado_dialogo = "fechado";
    }
}


function texto_dialogo(_x, _y)
{
    draw_set_font(fnt_dialogo);
    draw_set_valign(1);
    
    var _margem = 50;
    var _xtxt = _x + _margem;
    var _ytxt = _y + _margem;
     
    draw_text(_xtxt, _ytxt, dialogo_txt);
    
    draw_set_valign(-1);
    draw_set_font(-1);
}