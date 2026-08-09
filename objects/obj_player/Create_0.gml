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
levanto_tiro = false;
timer_passo = 0;

//variaveis sobre o item alvo
alvo = noone;
alvo_alcance = 0;



controle_player = function()
{
    if (!levanto_tiro)
    {
        inputs();
        movimento();
        
        //desenhando a tecla de interação
        desenho_tecla = false;
        
        //mudando a direção da sprite
        if (right) image_xscale = 1;
        if (left) image_xscale = -1;
        
        //interações
        var _interagindo = false;
        
        //devolve item
        if (global.inventario && !_interagindo)
        {
            _interagindo = devolvendo_item();
        }
        
        //interagindo com algo
        if (!_interagindo)
        {
            _interagindo = interagindo();
        }  
        
        //pegando itens
        if (!global.inventario && !_interagindo)
        {
            _interagindo = pegando_item();
        }
    }
    //levando tiro
    else
    {
        sprite_index = spr_player_caindo;
    }   
}

inputs = function()
{
    if (global.resetando) return;
    
    right       = keyboard_check(ord("D")) || keyboard_check(vk_right);
    left        = keyboard_check(ord("A")) || keyboard_check(vk_left);
    pulo        = keyboard_check_pressed(vk_space);
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
    else
    //no chão
    {
        //pulo
        if (pulo)
        {
            vspd = -max_vspd;
            estado = "pulando";
            
            cria_som(snd_pulo);
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
    var _prox = instance_nearest(x, y, obj_pegando);
    
    //se o bloco existe
    if (_prox && _prox.interagivel)
    {
        //pegando a distancia entre o player e o bloco
        var _dist = point_distance(x, y, _prox.x, _prox.y);
        
        if (_dist <= _prox.alcance)
        {
            //pode desenhar a tecla 
            desenho_tecla = true;
            tecla_index = 0; 
            
            //interagindo
            if (interagir)
            {
                _prox.player_interagindo = true;
                cria_som(snd_pegando, .1);
            }
            
            return true;
        }
    }
    
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
        tecla_index = 0;
        
        //interagindo
        if (interagir)
        {
            //devolvendo pelo obj highlight
            _high.devolvendo();
            cria_som(snd_devolve, .1);
        }
        
        return true;
    }
    
    return false;
}

interagindo = function()
{
    //pegando o pai interagivel
    var _prox = instance_nearest(x, y, obj_interagivel);
    
    //se existe alguem interagivel
    if (_prox && _prox.interagivel)
    {
        //pegando distancia entre nos
        var _dist = point_distance(x, y, _prox.x, _prox.y);
        
        //se eu estiver no alcance do obj
        if (_dist <= _prox.alcance)
        {
            desenho_tecla = true;
            tecla_index = 0;
            
            if (interagir)
            {
                //se tem um item na mão e esse obj é o alvo dele, faz a ação de usar
                if (global.inventario && (global.item.alvo == _prox.id || global.item.alvo == _prox.object_index))
                {
                    //aplicando efeito
                    global.item.efeito();
                    global.inventario = false;
                    
                    //destruindo o highlight
                    if (instance_exists(global.item.highlight))
                    {
                        instance_destroy(global.item.highlight);
                    }
                }
                //interação normal (npc ou objeto)
                else
                {
                    _prox.interagir();
                }
                
                cria_som(snd_interagir, .5);
            }
            
            return true;
        }
    }
    
    return false;
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
            
            timer_passo = 0;
            
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
            
            //som do passo
            if (timer_passo <= 0)
            {
                cria_som(snd_passo, .5);
                timer_passo = 15;
            }
            else
            {
                timer_passo--;
            }
            
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
