// Inherit the parent event
event_inherited();

alcance = 20;
desenha_timer = false;

tempo = 3 * FPS;
timer_desenho = tempo;

interagir = function()
{
    cria_dialogo(global.dialogos.player.cafeteira);
}

timer = function()
{
    //so acontece se tiver ligado a valvula
    if (global.valvula_ligada) 
    {
        alarm[0] = tempo;
        
        desenha_timer = true;
    }
    //se n tiver, o jogador fala
    else
    {
        if (!instance_exists(obj_dialogo))
        {
            cria_dialogo(global.dialogos.player.cafeteira_errada);
        }
    }
}

explodindo = function()
{
    //avisando q explodiu
    global.explosao = true;
    
    cria_som(snd_explosao_cafeteira);
    
    screenshake(50);
    
    with (obj_player) 
    {
        //se o player estiver perto, ele morre
    	var _dist = point_distance(x, y, other.x, other.y);
        
        if (_dist <= 100)
        {
            restart();
        }
    }
    
    //criando fogo
    cria_fogo();
}

cria_fogo = function()
{
    //explosao
    instance_create_depth(489 , 213, -1, obj_explosao_efeito);
    
    //fogo
    repeat (15) 
    {
        var _x = random_range(408, 609);
        var _fogo = choose(obj_fogo_grande, obj_fogo_pequeno);
        
    	instance_create_depth(_x, 215, -1, _fogo);
    }
}