//movimentação
hspd        = 0;
max_hspd    = 2;

//gravidade e pulo
vspd        = 0;
max_vspd    = 4;
grav        = .3;
chao = false;
teto = false;

//interacao
desenho = false;

//estado
estado = "parado";

inputs = function()
{
    right   = keyboard_check(ord("D")) || keyboard_check(vk_right);
    left    = keyboard_check(ord("A")) || keyboard_check(vk_left);
    pulo    = keyboard_check_pressed(vk_space);
    pulo_r  = keyboard_check_released(vk_space);
    usar    = keyboard_check_pressed(ord("E"));
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
            estado = "pulando";
        }
        else
        {
            vspd = 0;
        }
    }
    
    checa_sprite();
    
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

interacao = function()
{
    //pegando o bloco interagivel proximo
    var _prox = instance_nearest(x, y, obj_interagivel);
    
    //se o bloco existe
    if (_prox)
    {
        //pegando a distancia entre o player e o bloco
        var _dist = point_distance(x, y, _prox.x, _prox.y);
        
        if (_dist <= _prox.alcance && _prox.interagivel)
        {
            //pode desenhar a tecla 
            desenho = true;
            
            //interagindo
            if (usar)
            {
                _prox.ativo = !_prox.ativo;
            }
        }
        else
        {
            desenho = false;
        }
    }
    
}

checa_sprite = function()
{
    switch (estado) 
    {
    	case "parado":
        {
            sprite_index = spr_player_idle;
            
            //mudando de estado
            if (hspd != 0)
            {
                estado = "andando";
            }
            
            //mudando pro estado caindo
            if (vspd != 0)
            {
                estado = "caindo";
            }
            
            break;
        }
        
        case "andando":
        {
            sprite_index = spr_player_run;
            
            //mudando de estado
            if (hspd == 0)
            {
                estado = "parado";
            }
            
            //mudando pro estado caindo
            if (vspd != 0)
            {
                estado = "caindo";
            }
            
            break;
        }
        
        case "pulando":
        {
            sprite_index = spr_player_pulo;
            
            //mudando estado caindo
            if (vspd > 0)
            {
                estado = "caindo";
            }
            
            break;
        }
        
        case "caindo":
        {
            sprite_index = spr_player_caindo;
            
            //mudando de estado
            if (chao)
            {
                estado = "parado";
            }
            
            break;
        }
    }
}