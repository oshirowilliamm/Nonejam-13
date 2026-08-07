//ao ser criado vai ir pra cima
max_vspd    = 4;
vspd        = -max_vspd;
hspd        = .3;
grav        = .1;


pulou = false;

pulo = function()
{
    vspd = min(vspd + grav, max_vspd);
    
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