//1 - o jogo pause, musica para
//2 - screenshake
//3 - som de explosao
//4 - clarao
//5 - transicao borboleta

alpha = 0;


clarao = false;
transicao = false;
reinicio = false;
pode_explodir = true;



explosao = function()
{
    if (!pode_explodir) exit;
    
    //jogo pause
    global.pause = true;
    
    //som
    cria_som(snd_explosao);
     
    //screenshake
    screenshake(200);
    
    //destruir a hud
    if (instance_exists(obj_hud)) instance_destroy(obj_hud);
    if (instance_exists(obj_inventario)) instance_destroy(obj_inventario);
    if (instance_exists(obj_dialogo)) instance_destroy(obj_dialogo);
    
    //ativando clarao
    clarao = true;
    
    explosoes_efeito();
    
    pode_explodir = false;
}

desenha_clarao = function()
{
    if (clarao)
    {
        alpha = lerp(alpha, 1, .03);
        draw_set_alpha(alpha);
        
        //retangulo branco
        draw_rectangle(0, 0, room_width, room_height, 0);
        
        //falando pra ativar transicao
        if (alpha >= .8) transicao = true;
        
        draw_set_alpha(1);
    }
}

explosoes_efeito = function()
{
    var _x = random_range(20, 620);
    var _y = random_range(90, 290);
    
    repeat (100) 
    {
    	instance_create_layer(_x ,_y, layer, obj_explosao_efeito);
        
        _x = random_range(20, 620);
        _y = random_range(90, 290);
    }
}