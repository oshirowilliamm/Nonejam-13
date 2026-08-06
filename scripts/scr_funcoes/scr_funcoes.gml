//função para restartar o jogo
function restart()
{
    game_restart();
    
    //resetando as variaveis globais
    //dados
    global.timer = 60 * FPS;
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
    
    //reação 2
    global.trem_tremeu = false;
    global.alavanca_1 = false;
    global.alavanca_2 = false;
    global.rato_chegou = false;
    global.elefante_bateu = false;
}

//cria exclamação
function cria_exclamacao(_x = x, _y = y - 10)
{
    //criando exclamação
    instance_create_layer(_x, _y, layer, obj_exclamacao);
    
    //se tiver um dialogo acontecendo, desliga
    if (instance_exists(obj_dialogo))
    {
        instance_destroy(obj_dialogo);
        global.pause = false;
    }
    
    //depois de um tempo, acontece algo
    alarm[0] = .5 * FPS;
}
