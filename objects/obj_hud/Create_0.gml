escala = 4;

desenha_relogio = function()
{
    //desenhando relogio
    var _x = display_get_gui_width() / 2;
    var _y = 80;
    draw_sprite_ext(spr_relogio, 0, _x, _y, escala, escala, 0, c_white, 1);
    
    // Desenhando timer
    // Pegando o tempo como número para podermos fazer os cálculos de cor
    var _seg_num = global.timer div 60;
    var _mili_num = floor(((global.timer % 60) / 60) * 100);
    
    // Colocando um 0 na frente e transformando em texto
    var _seg = (_seg_num < 10) ? "0" + string(_seg_num) : string(_seg_num);
    var _mili = (_mili_num < 10) ? "0" + string(_mili_num) : string(_mili_num);
    
    // --- A MÁGICA: Dinâmica de Cores e Efeitos ---
    var _efeito = "[c_white]"; // Cor padrão inicial
    
    if (_seg_num <= 10) {
        // 10 segundos finais: Vermelho e Tremendo (Desespero)
        _efeito = "[c_red][shake]"; 
    } else if (_seg_num <= 30) {
        // 30 segundos finais: Laranja e Pulsando (Aviso/Tensão)
        _efeito = "[c_orange][pulse]"; 
    }
    
    // Montando o texto: Aplica o efeito nos Segundos, e deixa os milissegundos menores e prateados
    var _txt = string("{2}[scale, 1.5]{0}[/][c_silver][scale, .6]:{1}[/]", _seg, _mili, _efeito);
    
    // Renderizando com Scribble
    var _scrb = scribble(_txt).starting_format("fnt_relogio", c_white);
    _scrb.scale(.5);
    _scrb.align(1, 1);
    _scrb.draw(_x + 10, _y);
}

desenha_pocao = function()
{
    var _x = display_get_gui_width() - 80;
    var _y = display_get_gui_height() - 50;
    
    //poção
    draw_sprite_ext(spr_pocao, 0, _x, _y, escala, escala, 0, c_white, 1);
    
    //tecla
    draw_sprite_ext(spr_tecla, 1, _x - 40, _y, escala, escala, 0, c_white, 1);
}