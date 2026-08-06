//criando o teto
teto = instance_create_layer(x, y, layer, obj_elevador_teto);

//variaveis da movimentação do elevador
estado = "parado";
vspd = 0;
y_comeco = 194;
y_fim = 300;

//tempo
tempo = 2 * FPS;
timer = tempo;

movimento = function()
{
    //mudando os estados
    switch (estado) 
    {
        case "parado":
        {
            vspd = 0;
            
            //tempo
            timer--;
            
            if (timer <= 0)
            {
                //subindo
                if (y >= y_fim) estado = "subindo";
                
                //descendo
                if (y <= y_comeco) estado = "descendo";
                
                timer = tempo;
            }
            
            break;
        }
        
    	case "subindo": 
        {
            //velocidade
            vspd = -1;
            
            //parando
            if (y <= y_comeco)
            {
                estado = "parado";
            }
            
            break;
        }
            
        case "descendo":
        {
            //velocidade
            vspd = 1;
            
            //parando
            if (y >= y_fim)
            {
                estado = "parado";
            }
            
            break;
        }
    }
    
    colisao_player();
    
    //movendo o elevador
    y += vspd;
    teto.y += vspd;
}

colisao_player = function()
{
    //chao
    var _player_acima   = place_meeting(x, y - 1, obj_player);
    var _player_abaixo  = place_meeting(x, y + 1, obj_player);
    
    if (_player_acima)
    {
        obj_player.y += vspd;
    }
    
    if (_player_abaixo)
    {
        obj_player.y += vspd;
    }
    
    //teto
    with (teto) 
    {
    	var _player_acima   = place_meeting(x, y - 1, obj_player);
        var _player_abaixo  = place_meeting(x, y + 1, obj_player);
        
        if (_player_acima)
        {
            obj_player.y += other.vspd;
        }
        
        if (_player_abaixo)
        {
            obj_player.y += other.vspd;
        }
    }
}