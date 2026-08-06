//ao ser criado vai ir pra cima
max_vspd    = 5;
vspd        = -max_vspd;
hspd        = .3;
grav        = .2;


pulou = false;

pulo = function()
{
    var _chao = place_meeting(x, y, obj_colisao);
    
    //se nao ta no chao, aplica gravidade
    if (!_chao)
    {
        vspd = clamp(vspd, vspd + grav, max_vspd);
    }
    //se ta no chao, nao pula mais
    else
    {
        vspd = 0;
        hspd = 0;
    }
    
    y += vspd;
    x += hspd; 
}

caindo_da_janela = function()
{
    //caindo
    if (vspd >= 0)
    {
        //caindo pra fora da janela
        if (y >= 175)
        {
            instance_destroy();
        }
    }
}