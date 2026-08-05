//escala
escala = 8;
alpha = 0;

//posição da caixa
xscale_fim = escala * 4.5;
xscale = 0;
yscale = escala;

//estado
estado = "abrindo";

//texto do dialogo
lista_textos = [];
linha = 0;

//variavel pra sprite da caixa de dialogo
index_caixa = 0;

//criando o typist
typist = scribble_typist();
typist.in(1.5, 10); //configurando velocidade da digitação



desenha_dialogo = function()
{
    //só roda se estiver tendo dialogo
    if (estado == "fechado") exit;
    
    //parando o player
    with (obj_player) 
    {
    	hspd = 0;
        vspd = 0;
    }
    
    var _x = 70;
    var _y = 20;
    
    //checando o autor do dialogo
    var _autor = lista_textos[linha][0];
    switch (_autor) 
    {
        //mudando a sprite da caixa de acordo com quem fala
    	case "player": index_caixa = 1; break;
        case "policial": index_caixa = 2; break;
        default: index_caixa = 0; break;
    }
    
    //checando os estados da caixa
    switch (estado) 
    {
    	case "abrindo": caixa_abrindo(_x, _y); break;
        case "aberto": caixa_aberto(_x, _y); break;
        case "fechando": caixa_fechando(_x, _y); break;
    }
}

caixa_abrindo = function(_x, _y)
{
    //pausando jogo
    global.pause = true;
    
    //efeito de crescimento da caixa
    xscale = lerp(xscale, xscale_fim + 15, .05);
    alpha = lerp(alpha, 1, .1);
    
    //desenhando a caixa
    draw_sprite_ext(spr_caixa_dialogo, index_caixa, _x, _y, xscale, yscale, 0, c_white, alpha);
    
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
    draw_sprite_ext(spr_caixa_dialogo, index_caixa, _x, _y, xscale, yscale, 0, c_white, .9);
    
    //desenhando dialogo
    texto_dialogo(_x, _y);
    
    //avançando texto
    if (keyboard_check_pressed(vk_space))
    {
        //se o texto não terminou, pula pro final
        if (typist.get_state() < 1)
        {
            typist.skip();
        }
        //texto ja terminou de escrever
        else
        {
            if (linha < array_length(lista_textos) - 1)
            {
                //pulando linha
                linha++;
                
                //reiniciando o escrevente
                typist.reset();
            }
            //saindo do estado
            else
            {
                estado = "fechando";
            }
        }
    }
}

caixa_fechando = function (_x, _y)
{
    //efeito de fechando a caixa
    xscale = lerp(xscale, -15, .1);
    alpha = lerp(alpha, 0, .1);
    
    //desenhando a caixa
    draw_sprite_ext(spr_caixa_dialogo, index_caixa, _x, _y, xscale, yscale, 0, c_white, alpha);
    
    //ficando fechado
    if (xscale <= 2)
    {
        xscale = 0;
        estado = "fechado";
        
        //despausando jogo
        global.pause = false;
        
        //se destroi
        instance_destroy();
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
    var _txt = scribble(lista_textos[linha][1]).starting_format("fnt_dialogo", c_white);
    _txt = _txt.wrap(_larg); //fazendo o wrap do texto
    _txt = _txt.line_height(40);
    
    //desenhando o texto
    _txt.draw(_xtxt, _ytxt, typist);
    
    
    //desenhando aviso
    if (typist.get_state() >= 1) //se terminou de escrever
    {
        var _txt = "[wheel][c_grey]Aperte [rainbow]Espaço[/rainbow] para avançar[/c][/wheel]";
        var _scrb = scribble(_txt).starting_format("fnt_dialogo", c_white);
        _scrb.draw(430, 230);
    }
}