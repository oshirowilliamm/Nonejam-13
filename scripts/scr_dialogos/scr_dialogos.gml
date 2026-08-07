global.dialogos = {player: {}, npc: {}, especial: {}};

global.dialogos.player =
{
    janela:
    [
        ["player", "Acho que não consigo abrir essa janela, ela está [c_orange]emperrada[/c]. Vou precisar de algo pra destravar isso."]
    ],
    cafeteira:
    [
        ["player", "Café?"],
        ["player", "Não preciso de café agora."],
    ],
}

global.dialogos.especial =
{
    barreira1:
    [
        ["policial", "Meu filho, você não pode atravessar ai."],
        ["policial", "O próximo vagão são apenas clientes VIPs, então [c_gray][shake]você[/shake][/c] não pode passar."]
    ],
    barreira2:
    [
        ["policial", "Eu já disse que [shake][c_red]VOCÊ[/c][/shake] não pode passar, não insista de novo!"]
    ],
    barreira3:
    [
        ["policial", "[shake][c_red]SAIA DAQUI!![/c][/shake]"]
    ]
}


global.dialogos.npc =
{
    //dialogos normais
    lara:
    [
        ["lara", "OI, sou Lara"],
    ],
    caroline:
    [
        ["caroline", "OI, sou Caroline"],
    ],
    ana_catarina:
    [
        ["ana_catarina", "OI, sou Ana Catarina"],
    ],
    julio:
    [
        ["julio", "OI, sou Júlio"],
    ],
    irmas:
    [
        ["irmas", "OI, somos as Irmãs Demais"],
    ],
    marta:
    [
        ["marta", "OI, sou Marta"],
    ],
    edson:
    [
        ["policial", "Oi meu filho."],
    ],
    enzo:
    [
        ["policial", "OI, sou Enzo"],
    ],
    carvalho:
    [
        ["policial", "OI, sou Carvalho"],
    ],
    garcom:
    [
        ["garcom", "Bonjour jovem, oui?"],
        ["player", "Ehh, bom dia, pode me dar esse teu [c_yellow]queijo[/c] ai?"],
        ["garcom", "Que audácia jovem! Non posso fazer isso."],
        ["garcom", "Esse queijo [wave][rainbow]magnifique[/wave][/rainbow] está reservado para o Monsieur Mário"],
        ["player", "Que Mário?"],
        ["garcom", "[wave][c_grey]...[/c][/wave]"],
        ["player", "[wave][c_grey]...[/c][/wave]"],
        ["garcom", "O Monsieur Mário foi ao toilette agora, oui? Estou apenas esperrando por ele."],
    ],
    
    
    //dialogos reação 3
    caroline_reacao:
    [
        ["caroline", "oi, sou caroline"],
    ],
    julio_reacao:
    [
        ["julio", "oi, sou julio"],
    ],
    irmas_reacao:
    [
        ["irmas", "oi, somos as irmãs"],
    ],
    marta_reacao:
    [
        ["marta", "oi, sou marta"],
    ],
    lara_reacao:
    [
        ["lara", "oi, sou lara"],
    ],
}