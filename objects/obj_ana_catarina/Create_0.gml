// Inherit the parent event
event_inherited();

grito = false;

exclamacao = function()
{
    //gritando
    if (!grito)
    {
        exclamacao_npc();
        
        grito = true;
    }
}

sprite_assustada = function()
{
    //se ela estiver assustada, fica tremendo
    if (sprite_index == spr_ana_catarina_medo)
    {
        //tremendo
        var _valor = 186;
        x = random_range(_valor - .5, _valor + .5);
    }
}