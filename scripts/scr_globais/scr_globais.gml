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
    
    //reação 1
    global.abelha_no_vaso = false;
    global.ana_assustada = false;
    global.acabou_reacao1 = false;
}

//cria exclamação
function exclamacao_npc()
{
    //criando exclamação
    instance_create_layer(x, y - 10, layer, obj_exclamacao);
    
    //deixa de ser interagivel
    interagivel = false;
    
    //se tiver um dialogo acontecendo, desliga
    if (instance_exists(obj_dialogo))
    {
        instance_destroy(obj_dialogo);
        global.pause = false;
    }
    
    //depois de um tempo, o sprite dela muda
    alarm[0] = game_get_speed(gamespeed_fps) * .5;
}