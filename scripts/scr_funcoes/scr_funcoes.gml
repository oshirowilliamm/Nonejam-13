
//função para restartar o jogo
function restart()
{
    cria_transicao_inicia(room);
    
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
    
    //reação 3
    global.valvula_ligada = false;
    global.explosao = false;
}

//cria exclamação
function cria_exclamacao(_x = x, _y = y - 25, _tempo = .5 )
{
    //criando exclamação
    var _exclama = instance_create_layer(_x, _y, layer, obj_exclamacao);
    _exclama.timer = _tempo * FPS;
    
    //se tiver um dialogo acontecendo, desliga
    if (instance_exists(obj_dialogo))
    {
        instance_destroy(obj_dialogo);
        global.pause = false;
    }
    
    //depois de um tempo, acontece algo
    alarm[0] = .5 * FPS;
}

//cria dialogo
function cria_dialogo(_texto)
{
    if (!instance_exists(obj_dialogo))
    {
        //criando dialogo
        var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
        _dialogo.lista_textos = _texto;
        
        return _dialogo;
    }
}