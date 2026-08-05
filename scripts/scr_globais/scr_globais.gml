//pause
global.pause = false;
#macro PAUSE if (global.pause) exit




//checa se tem algum item no inventario ou não
global.inventario = false;

//dados do item no inventario
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


//função para restartar o jogo
function restart()
{
    game_restart();
    
    //resetando as variaveis globais
    //dados
    global.pause = false;
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
    
    //globais
    global.abelha_no_vaso = false;
}