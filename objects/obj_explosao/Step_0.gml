explosao();

//transicao borboleta
if (transicao && !reinicio)
{
    //se for a introdução so cria a transicao
    if (room == rm_inicio) 
    {
        cria_transicao_inicia(rm_tutorial);
    }
    //se for o game, reinicia
    else
    {
        restart();
    }
    
    reinicio = true;
}