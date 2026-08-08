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
    porta:
    [
        ["player", "Tá trancado."],
        ["player", "Que merda, acho que vou precisar achar uma [c_yellow]chave[/c]."],
    ],
    cafeteira_errada:
    [
        ["player", "Acho que eu precisava ter ativado outra coisa antes..."],
        ["player", "Mas o que?"],
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
    ],
    barreira_elevador:
    [
        ["policial", "O que está fazendo aqui? Não pode ficar aqui."],
        ["policial", "[shake][c_red]SAIA!![/c][/shake]"]
    ],
    reacao_errada:
    [
        ["npc", "O que? Por que está me dando isso? Não, valeu..."]
    ],
}


global.dialogos.npc =
{
    //dialogos normais
    lara:
    [
        ["lara", "[wave] eae manin [/]"],
        ["player", "Opa."],
        ["lara", "[wave] manin, tenho uma parada muito [scale, 1.15][rainbow]r a d i c a l[/][/] [wave]aqui pra ti. [/]"],
        ["lara", "[wave] se tu me trouxer a [c_green]paradinha[/c] [wave]que eu quero, nois faz uma troca. [/]"],
    ],
    caroline:
    [
        ["caroline", "Tá vendo essa garota ruiva ai na frente? É a [ana]Ana Catarina[/]."],
        ["caroline", "[shake, 2, .3][c_red]Odeio[/][/] ela."],
        ["player", "Eita."],
        ["caroline", "Essa escrota me chamou de bruxa.[delay, 200] Da pra acreditar?"],
        ["caroline", "Se eu tivesse [pink]alguma coisa[/] dela... [delay, 300] eu ia mostrar quem é a bruxa aqui! [shake][#9933FF]wahahaha[/][/]"],
    ],
    ana_catarina:
    [
        ["player", "Oi."],
        ["ana_catarina", "Desencosta por favor.[delay, 250] Você está bloqueando a minha luz e respirando meu ar.[delay, 200] Já não basta meu pai me obrigar a viajar nessa [shake][c_orange]espelunca![/][/]"],
        ["player", "Espelunca?"],
        ["ana_catarina", "Sim? [delay, 200]Tem uma janela [c_orange]emperrada[/c] ali. [delay, 200]Tralhas jogadas pra todo lado. [delay, 200]Pessoas feias. [delay, 200][wobble]Espelunca[/] é um ótimo nome pra isso."],
        ["ana_catarina", "[wave]Ai, juro[/], se alguma coisa, algum [c_yellow]inseto voador[/] pousar em mim, eu processo isso aqui ouviu? [delay, 200] [shake, 2, 0.5][scale, 1.15][c_red]Processoooo.[/][/][/]"],
        ["ana_catarina", "Agora dá licença, vou xingar no Twitter.[delay, 150] [scale, 0.8][c_grey]#Indignada[/][/]"],
    ],
    julio:
    [
        ["julio", "Ei você.[delay, 200]"],
        ["player", "Eu?"],
        ["julio", "Sim,[delay, 100] você."],
        ["julio", "Tem alguma coisa pra me ajudar?[delay, 200] Precisava de alguma coisa...[delay, 300] sabe...[delay, 200] [c_grey][shake]pontiaguda[/shake][/]."],
        ["julio", "Esse desgraçado desse [police]Edson[/] tá atrás da minha [ana]Ana Catarina[/]![delay, 200] [shake][#CC1111]Ela é só minha![/]"],
        ["player", "Eee... ela sabe disso?"],
        ["julio", "[wave][c_grey]...[/][/wave]"],
        ["julio", "[shake, 2, 0.2]Quem se importa com isso![/] Você vai me ajudar ou não?[delay, 200] Só quero dar um [c_grey]susto[/] nele."],
    ],
    irmas:
    [
        ["irmas", "[irma_yellow]Ai que saco, queria tanto algum [c_red][shake]mistério[/][/shake][irma_yellow] pra resolver...[/]"],
        ["irmas", "[irma_red]Verdade, tá tão sem graça, sem nada pra fazer...[/]"],
        ["irmas", "[irma_green]Relaxem meninas! Estamos num trem.[delay, 150] Que lugar melhor que esse pra ter mistérios?[delay, 200] Vamos encontrar algum logo logo, é só esperar![/]"],
        ["player", "Quem são vocês?"],
        ["irmas", "Quem somos nós, você pergunta?[delay, 150] [rainbow][scale, 1.1]HA HA HA![/scale][/rainbow] [c_grey](x3)[/]"],
        ["irmas", "Somos as [c_grey](x3)[/]"],
        ["irmas", "[irma_yellow][scale, 1.25][shake]TRÊS[/shake][/scale][/]"],
        ["irmas", "[irma_red][scale, 1.25][shake]IRMÃS[/shake][/scale][/]"],
        ["irmas", "[irma_green][scale, 1.25][shake]DEMAIS![/shake][/scale][/]"],
        ["player", "[wave][c_grey]...[/][/wave]"],
        ["player", "Tá certo então..."],
    ],
    marta:
    [
        ["player", "Olá?"],
        ["marta", "[shake, 1, 0.1]Não me enche.[/] Minha paciência já acabou por causa daquelas irmãs insuportáveis."],
        ["marta", "Elas ficam aí achando que são detetives.[delay, 200] Malucas piradas."],
        ["marta", "Quero [shake, 3, 0.5][#FF0000][scale, 1.2]matá-las.[/scale][/#][/shake]"],
        ["player", "[wave][c_grey]...[/][/wave]"],
    ],
    edson:
    [
        ["policial", "Olá cidadão."],
        ["policial", "Você não pode ultrapassar aqui."],
        ["player", "Ah oi, tá bom..."],
        ["player", "Hum, por acaso você tá afim da [ana]Ana Catarina[/]?"],
        ["policial", "[shake][scale, 1.1]Ahn?[/] O que?[/scale] Como sabe disso?"],
        ["policial", "[wave]Droga...[/wave][delay, 200] Bom, talvez um pouco...[delay, 200] quer dizer, escrevi uma [c_red]carta[/] pra ela, mas ela sumiu do meu bolso!"],
        ["policial", "Tem algum meliante roubando as coisas aqui hein,[delay, 150] fica esperto cidadão."],
        ["policial", "Até mais."],
    ],
    enzo:
    [
        ["policial", "Hum, oi."],
    ],
    carvalho:
    [
        ["policial", "Hum, oi."],
    ],
    garcom:
    [
        ["garcom", "[slant]Bonjour[/slant] jovem, [slant]oui?[/slant]"],
        ["player", "Ehh, bom dia, pode me dar esse teu [c_yellow]queijo[/] aí?"],
        ["garcom", "[shake][scale, 1.1]Que audácia, jovem![/] [slant]Non[/slant] posso fazer isso."],
        ["garcom", "Esse queijo [wave][rainbow][slant]magnifique[/slant][/rainbow][/wave] está reservado para o [scale, 1.1][slant]Monsieur[/slant] Mário[/scale]."],
        ["player", "Que Mário?"],
        ["garcom", "[wave][c_grey]...[/][/wave]"],
        ["player", "[wave][c_grey]...[/][/wave]"],
        ["garcom", "O [slant]Monsieur[/slant] Mário foi ao [slant]toilette[/slant] agora, [slant]oui[/slant]?[delay, 200] Estou apenas [slant]esperrando[/slant] por ele."],
    ],
    
    
    //dialogos reação 3
    caroline_reacao:
    [
        ["player", "Isso serve? [c_grey](mostrando pente)[/]"],
        ["caroline", "[shake][scale, 1.25][#00FF88]SIM![/scale][/shake] É o pente dela!"],
        ["caroline", "Agora com um voodoo essa garota vai perder seus preciosos cabelos ruivos em no máximo 3 dias.[delay, 200] [shake, 2, 0.4][#9933FF]HAHAHA![/shake][/]"],
        ["player", "Tem algo pra mim?"],
        ["caroline", "Ah sim, eh...[delay, 150] toma isso."],
        ["caroline", "Uma [c_grey]Faca Pontiaguda[/]. Não me pergunte a origem.[delay, 200] Tem um cara aí que talvez queira isso.[delay, 150] Ele tava bem... [c_red][shake]ciumento...[/][/]"],
    ],
    julio_reacao:
    [
        ["player", "Quer isso? [c_grey](mostrando faca)[/]"],
        ["julio", "[shake][scale, 1.1]Uma faca, cara?[/scale][/shake]"],
        ["julio", "Isso é [wave][scale, 1.25]perfeito![/scale][/wave] Aquele babaca do [police]Edson[/] acha que tem chance com a [ana]Ana Catarina[/].[delay, 200] [shake][#FF3333]Vou mostrar pra ele que ninguém fica no meu caminho![/shake][/]"],
        ["player", "Vai matar o cara no meio do vagão?"],
        ["julio", "Ahn?[delay, 100] O que?[delay, 150] Não,[delay, 100] só vou...[delay, 150] [c_grey]assustar ele[/]... só isso."],
        ["julio", "Pega isso aqui, eu roubei do casaco dele.[delay, 150] É a [c_red]Carta Amorosa[/] do [police]Edson[/], não preciso mais disso agora."],
    ],
    irmas_reacao:
    [
        ["irmas", "[shake]Ei, isso que você tem é uma pista??[/shake] [c_grey](x3)[/]"],
        ["player", "Não, é só uma carta, malucas."],
        ["irmas", "[scale, 1.15][rainbow]Nos dê, nos dê![/rainbow][/scale] [c_grey](x3)[/]"],
        ["player", "[c_grey](dando a carta)[/]"],
        ["irmas", "Você não sabe do que você tá falando![delay, 150] Isso é claramente uma carta de amor que vai servir como [c_red][shake]isca para um assassinato![/shake][/] Não consegue enxergar? [c_grey](x3)[/]"],
        ["irmas", "De qualquer forma, tome isso. É uma [c_dkgrey][scale, 1.1]Arma Ultra Tecnológica[/scale][/].[delay, 150] Talvez você vai querer vir com a gente e combater o crime![delay, 200] ...Não? [c_grey](x3)[/]"],
        ["player", "Não."],
    ],
    marta_reacao:
    [
        ["player", "Quem quer uma arminha ultra mega poderosa??"],
        ["player", "[c_grey](dando a arma)[/]"],
        ["marta", "Isso deve servir..."],
        ["marta", "Agora...[delay, 300]"],
        ["marta", "[shake, 3, 0.6][#FF0000][scale, 1.25]AGORA VAMOS VER QUEM VAI SER O DETETIVE QUE VAI RESOLVER ESSE ASSASSINATO HAHAHA![/scale][/][/shake]"],
        ["player", "[wave][c_grey]...[/][/wave]"],
        ["marta", "Ah, pega isso aqui em troca vai,[delay, 150] mas [shake]não conta pra ninguém[/shake] que fui eu que te dei isso."],
    ],
    lara_reacao:
    [
        ["player", "[c_grey](dando o item suspeito)[/]"],
        ["lara", "[wave]cê louco manin, é disso que eu tava falando bicho.[/wave]"],
        ["lara", "[wave]agora como prometido, toma isso.[/wave]"],
        ["lara", "[wave]é um [rainbow][scale, 1.1]Grão de Café Cósmico[/scale][/rainbow] [wave]manin. dizem que isso aí traz uma vibe mó louca tá ligado?[/wave]"],
        ["lara", "[wave]só cuidado quando for preparar a parada.[delay, 200] se for feita em [c_orange][shake]alta pressão[/shake][/c] pode dar ruim hein.[/wave]"],
    ],
}