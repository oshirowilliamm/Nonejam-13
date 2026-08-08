// ---REAÇÃO 1---

global.abelha_no_vaso = false;
global.ana_assustada = false;
global.acabou_reacao1 = false;



// ---REAÇÃO 2---

global.trem_tremeu = false;
global.alavanca_1 = false;
global.alavanca_2 = false;
global.rato_chegou = false;
global.elefante_bateu = false;



// ---REAÇÃO 3---
global.itens_reacao3 = 
{
    pente:
    {
        nome: "Pente Rosa",
        sprite: spr_inv_pente,
        alvo: "caroline",
        alcance: 10,
        dialogo: global.dialogos.npc.caroline_reacao,
        proximo_item: "faca",
    },
    faca:
    {
        nome: "Faca Pontiaguda",
        sprite: spr_inv_faca,
        alvo: "julio",
        alcance: 10,
        dialogo: global.dialogos.npc.julio_reacao,
        proximo_item: "carta",
    },
    carta:
    {
        nome: "Carta Amorosa de Edson",
        sprite: spr_inv_carta,
        alvo: "irmas",
        alcance: 10,
        dialogo: global.dialogos.npc.irmas_reacao,
        proximo_item: "arma",
    },
    arma:
    {
        nome: "Arma Ultra Tecnológica",
        sprite: spr_inv_arma,
        alvo: "marta",
        alcance: 10,
        dialogo: global.dialogos.npc.marta_reacao,
        proximo_item: "maconha",
    },
    maconha:
    {
        nome: "Matinho?",
        sprite: spr_inv_maconha,
        alvo: "lara",
        alcance: 10,
        dialogo: global.dialogos.npc.lara_reacao,
        proximo_item: "grao",
    },
    grao:
    {
        nome: "Grão de Café Cósmico",
        sprite: spr_inv_grao,
        alvo: obj_cafeteira,
        alcance: 20,
        dialogo: noone,
        proximo_item: "fim",
    }
}

function dar_item(_item)
{
    //se for o ultimo item, acaba
    if (_item == "fim")
    {
        global.inventario = false;
        return;
    }
    
    //pegando os dados
    var _dados = global.itens_reacao3[$ _item];
    
    //colocando o item no inventario
    global.inventario = true;
    global.item.sprite = _dados.sprite;
    global.item.nome = _dados.nome;
    
    //alvo
    //se for o grão é diferente
    if (_item == "grao")
    {
        global.item.alvo = _dados.alvo;
        global.item.alvo_alcance = _dados.alcance;
    }
    //se for os outros itens
    else
    {
        with (obj_npc) 
        {
            if (nome == _dados.alvo)
            {
                global.item.alvo = id;
                global.item.alvo_alcance = _dados.alcance;
            }
        }
    }
    
    //guardando outras infos pra reação
    global.item.dialogo = _dados.dialogo;
    global.item.proximo_item = _dados.proximo_item;
    
    //reação
    global.item.efeito = function()
    {
        //se for os itens dos npcs
        if (global.item.dialogo != noone)
        {
            var _dialogo = cria_dialogo(global.item.dialogo);
            
            //colocando proximo item no dialogo
            _dialogo.proximo_item = global.item.proximo_item;
            
            //ao terminar o dialogo, chama a função de novo pro proximo item
            _dialogo.callback = function()
            {
                dar_item(obj_dialogo.proximo_item);
            }
        }
        //se for o grão
        else
        {
            global.item.alvo.timer();
        }
    }
}


global.valvula_ligada = false;
global.explosao = false;