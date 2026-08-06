// Inherit the parent event
event_inherited();

item_sprite = spr_inv_lubrificante;
item_sprite_menor = spr_lubrificante;
item_nome = "Lubrificante";

alvo = obj_janela;
alvo_alcance = 20;

reacao = function()
{
    //usar o lubrificante para desenferrujar a janela
    if (alvo.sprite == spr_janela_enferrujada)
    {
        alvo.sprite = spr_janela;
    }
}