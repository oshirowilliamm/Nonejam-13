hspd        = 0;
max_hspd    = 2;
vspd        = 0;
max_vspd    = 5;
grav        = .3;

chao = false;


inputs = function()
{
    right   = keyboard_check(ord("D")) || keyboard_check(vk_right);
    left    = keyboard_check(ord("A")) || keyboard_check(vk_left);
    up      = keyboard_check(ord("W")) || keyboard_check(vk_up);
    down    = keyboard_check(ord("S")) || keyboard_check(vk_down);
    pulo    = keyboard_check(vk_space);
    agachar = keyboard_check(vk_control);
}

controle = function()
{
    //movendo (velocidade)
    hspd = (right - left) * max_hspd;
    
    //aplicando gravidade
    if (!chao)
    {
        vspd = clamp(vspd, vspd + grav, max_vspd);
    }
    //no chão
    else
    {
        //pulo
        if (pulo)
        {
            vspd = -max_vspd;
        }
        else
        {
            vspd = 0;
        }
        
        //agachando
        if (agachar)
        {
            sprite_index = spr_player_agachado;
            max_hspd = 1;
        }
        else
        {
            sprite_index = spr_player;
            max_hspd = 2;
        }
    }
    
    //colidindo
    move_and_collide(hspd, 0, obj_colisao, 4);
    move_and_collide(0, vspd, obj_colisao, 12);
    
    
    
}

checa_chao = function()
{
    chao = place_meeting(x, y + 1, obj_colisao);
}