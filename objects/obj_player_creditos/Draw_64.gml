//dialogo
if (dialogo)
{
    //fundo
    var _xfundo = 810;
    var _yfundo = 350;
    var _wfundo = 460;
    var _hfundo = 120;
    draw_sprite_stretched_ext(spr_caixa_dialogo, 1, _xfundo, _yfundo, _wfundo, _hfundo, c_white, .9);
    
    var _margem = 25;
    var _xtxt = _xfundo + _margem;
    var _ytxt = _yfundo + _margem;
    var _wtxt = _wfundo - (_margem * 2);
    var _escala = .5;
    
    //texto
    var _txt = scribble("Droga... Vou me atrasar pro trabalho...")
    _txt.starting_format("fnt_dialogo_pequeno", c_white);
    _txt.transform(_escala, _escala)
    _txt.line_spacing(64);
    _txt.wrap(_wtxt / _escala);
    
    _txt.draw(_xtxt, _ytxt, escrevedor);
}