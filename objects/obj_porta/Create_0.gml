// Inherit the parent event
event_inherited();

alpha = 0;
transicao = false

interagir = function()
{
    //se tiver trancada
    if (image_index == 0)
    {
        //dialogo do player
        cria_dialogo(global.dialogos.player.porta);
        
        //transicao = true;
        //cria_soundtrack(noone, 1500);
    }
    //se tiver aberta
    else
    {
        transicao = true;
        cria_soundtrack(noone, 1500);
    }
}

transicao_creditos = function()
{
    if (!transicao) exit;
    
    //destruir a hud
    if (instance_exists(obj_hud)) instance_destroy(obj_hud);
    if (instance_exists(obj_inventario)) instance_destroy(obj_inventario);
    if (instance_exists(obj_dialogo)) instance_destroy(obj_dialogo);
    
    alpha = lerp(alpha, 1, .05);
    draw_set_alpha(alpha);
    
    //retangulo preto
    draw_rectangle_colour(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, 0);
    
    
    //indo pros creditos
    if (alpha >= 1)
    {
        room_goto(rm_creditos);
    }
    
    draw_set_alpha(1);
}