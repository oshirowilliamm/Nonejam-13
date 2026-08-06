event_inherited();

sprite_index = sprite;
alcance = 18;

interagir = function()
{
    //alavanca pra baixo
    image_index = 1;
    
    //nao pode mais interagir
    interagivel = false;
    
    switch (sprite) 
    {
    	case spr_alavanca_frente: 
        {
            //avisando q foi abaixada
            global.alavanca_1 = true;
            
            break;
        }
        
        case spr_alavanca_lado:
        {
            //avisando q foi abaixada
            global.alavanca_2 = true;
            
            break;
        } 
    }
}