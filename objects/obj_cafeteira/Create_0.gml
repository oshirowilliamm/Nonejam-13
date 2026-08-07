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
    alarm[0] = tempo;
    
    desenha_timer = true;
}

explodindo = function()
{
    //so acontece se tiver ligado a valvula
    if (!global.valvula_ligada) exit;
    
    screenshake(50);
    
    with (obj_player) 
    {
        //se o player estiver perto, ele morre
    	var _dist = point_distance(x, y, other.x, other.y);
        show_debug_message(_dist);
        
        if (_dist <= 100)
        {
            restart();
        }
    }
    
    //criando fogo
    instance_create_depth(509, 218, -1, obj_fogo);
    
    //avisando q explodiu
    global.explosao = true;
}