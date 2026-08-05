//empurrando o player pra tras
with (obj_player)
{
    x_prev = x - 5;
    x = x_prev;
}


//criando o dialogo so se ele n foi criado
if (!instance_exists(obj_dialogo))
{
    var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
    _dialogo.lista_textos = dialogo[linha];
    
    //pulando para a prox linha
    linha++;
}