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
desenho_tecla = false;
tecla_index = 0;

//estado
estado = "parado";

//variaveis sobre o item alvo
alvo = noone;
alvo_alcance = 0;



controle_player = function()
{
    inputs();
    movimento();
    
    //desenhando a tecla de interação
    desenho_tecla = false;
    
    //mudando a direção da sprite
    if (right) image_xscale = 1;
    if (left) image_xscale = -1;
    
    //interações
    if (!global.inventario)
    {
        pegando_item();
        interage_npc();
    }
    else
    {
        var _pode_usar = usando_item();
        
        if (!_pode_usar)
        {
            devolvendo_item();
        }
    }
}

inputs = function()
{
    right       = keyboard_check(ord("D")) || keyboard_check(vk_right);
    left        = keyboard_check(ord("A")) || keyboard_check(vk_left);
    pulo        = keyboard_check_pressed(vk_space);
    pulo_r      = keyboard_check_released(vk_space);
    pegar       = keyboard_check_pressed(ord("F"));
    interagir   = keyboard_check_pressed(ord("E"));
}

movimento = function()
{
    checa_colisao();
    
    //movendo (velocidade)
    hspd = (right - left) * max_hspd;
    
    //aplicando gravidade
    if (!chao)
    {
        vspd = min(vspd + grav, max_vspd);
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

pegando_item = function()
{
    //pegando o bloco interagivel proximo
    var _prox = instance_nearest(x, y, obj_interagivel);
    
    //se o bloco existe
    if (_prox && _prox.interagivel)
    {
        //pegando a distancia entre o player e o bloco
        var _dist = point_distance(x, y, _prox.x, _prox.y);
        
        if (_dist <= _prox.alcance)
        {
            //pode desenhar a tecla 
            desenho_tecla = true;
            tecla_index = 1; 
            
            //interagindo
            if (pegar)
            {
                _prox.ativo = true;
            }
        }
    }
}

usando_item = function()
{
    //pegando as infos do item que esta na minha mão
    alvo = global.item.alvo;
    alvo_alcance = global.item.alvo_alcance;
    
    //checando se o alvo existe
    if (instance_exists(alvo)) 
    {
        //pegando distancia com o alvo
        var _dist = point_distance(x, y, alvo.x, alvo.y);
        
        if (_dist <= alvo_alcance)
        {
            desenho_tecla = true;
            tecla_index = 0;
            
            //interagindo
            if (interagir)
            {
                //tocando o efeito do item
                global.item.efeito();
                
                //tirando item da mão
                global.inventario = false;
                
                //tirando o highlight
                instance_destroy(global.item.highlight);
            }
            
            //avisando que consegue usar o item
            return true;
        }
    }
    
    //avisando que não consegue usar o item
    return false;
}

devolvendo_item = function()
{
    //pegando o highlight
    var _high = instance_nearest(x, y, obj_highlight);
    
    if (!instance_exists(_high)) exit;
    
    //pegando distancia com o obj highlight
    var _dist = point_distance(x, y, _high.x, _high.y);
    
    if (_dist <= _high.alcance)
    {
        //pode desenhar a tecla 
        desenho_tecla = true;
        tecla_index = 1;
        
        //interagindo
        if (pegar)
        {
            //devolvendo pelo obj highlight
            _high.devolvendo();
        }
    }
}

interage_npc = function()
{
    //pegando o npc mais perto
    var _npc = instance_nearest(x, y, obj_npc);
    
    //se existe e é interagivel
    if (_npc && _npc.interagivel)
    {
        //pegando a distancia
        var _dist = point_distance(x, y, _npc.x, _npc.y);
        
        if (_dist <= 10)
        {
            //pode desenhar a tecla 
            desenho_tecla = true;
            tecla_index = 0;
            
            if (interagir)
            {
                //fala do npc
                _npc.fala();
            }
        }
    }
}


checa_colisao = function()
{
    chao = place_meeting(x, y + 1, obj_colisao);
    teto = place_meeting(x, y - 1, obj_colisao);
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
