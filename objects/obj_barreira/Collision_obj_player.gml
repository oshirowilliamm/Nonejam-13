//empurrando o player pra tras
with (obj_player)
{
    x_prev = x - 5;
    x = x_prev;
}


//criando o dialogo
cria_dialogo(dialogo[linha]);

//pulando para a prox linha
linha++;
