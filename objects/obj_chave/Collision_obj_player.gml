//pegando a chave
global.inventario = true;
global.item.sprite = spr_inv_chave;
global.item.nome = "Chave";
global.item.obj = obj_chave;
global.item.alvo = obj_porta;
global.item.alvo_alcance = 15;

//abrindo a porta
global.item.efeito = function()
{
    global.item.alvo.image_index = 1;
}

cria_som(snd_pegando, .1);

//destruindo a chave
instance_destroy();