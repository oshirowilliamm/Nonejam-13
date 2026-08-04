//movimentação
hspd        = 0;
max_hspd    = 2;

//gravidade e pulo
vspd        = 0;
max_vspd    = 4;
grav        = .3;
chao = false;
teto = false;

inputs = function()
{
    right   = keyboard_check(ord("D")) || keyboard_check(vk_right);
    left    = keyboard_check(ord("A")) || keyboard_check(vk_left);
    pulo    = keyboard_check_pressed(vk_space);
    pulo_r  = keyboard_check_released(vk_space);
}

controle = function()
{
    checa_colisao();
    
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
    }
    
    //colidindo
    move_and_collide(hspd, 0, obj_colisao, 4);
    move_and_collide(0, vspd, obj_colisao, 24);
    
    //se colidiu com o teto, cai na hora
    if (vspd < 0 && teto)
    {
        vspd = 0;
    }
}

checa_colisao = function()
{
    chao = place_meeting(x, y + 1, obj_colisao);
    teto = place_meeting(x, y - 1, obj_colisao);
}
