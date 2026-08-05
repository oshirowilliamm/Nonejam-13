global.pause = false;

#macro PAUSE if (global.pause) exit

//checa se tem algum item no inventario ou não
global.inventario = false;

global.item = 
{
    sprite: noone,
    nome: "",
    obj: noone,
    efeito: function(){},
    
    alvo: noone,
    alvo_alcance: 0,
    highlight: noone,
}

//dialogos
global.dialogos =
{
    janela:
    [
        "Acho que não consigo abrir essa janela, ela está [c_orange]emperrada[/c]. Vou precisar de algo pra destravar isso."
    ]
}