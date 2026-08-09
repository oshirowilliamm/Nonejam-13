escala = 4;

desenha_relogio = function()
{
    //desenhando relogio
    var _x = display_get_gui_width() / 2;
    var _y = 80;
    draw_sprite_ext(spr_relogio, 0, _x, _y, escala, escala, 0, c_white, 1);
    
    //desenhando timer
    //separando os seg e milisseg
    var _seg_num = global.timer div 60;
    var _mili_num = floor(((global.timer % 60) / 60) * 100);
    
    //colocando 0 na frente
    var _seg = (_seg_num < 10) ? "0" + string(_seg_num) : string(_seg_num);
    var _mili = (_mili_num < 10) ? "0" + string(_mili_num) : string(_mili_num);
    
    //efeitos 
    var _efeito = "[c_white]";
    
    if (_seg_num <= 10) 
    {
        _efeito = "[c_red][shake]"; 
    } 
    else if (_seg_num <= 30) 
    {
        _efeito = "[c_orange][shake]"; 
    }
    
    //texto (segundo)
    var _txt_seg = string("{1}{0}[/]", _seg, _efeito);
    
    //desenhando com o scribble (segundo)
    var _scrb_seg = scribble(_txt_seg).starting_format("fnt_relogio", c_white);
    _scrb_seg.scale(.7);
    _scrb_seg.align(1, 1);
    _scrb_seg.draw(_x, _y);
    
    //texto (milissegundo)
    var _txt_mili = string("[c_silver].{0}[/]", _mili);
    
    //desenhando com o scribble (milissegundo)
    var _scrb_mili = scribble(_txt_mili).starting_format("fnt_relogio", c_white);
    _scrb_mili.scale(.25);
    _scrb_mili.align(1, 1);
    _scrb_mili.draw(_x + 65, _y + 9);
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