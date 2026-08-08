dialogo = cria_dialogo(global.dialogos.especial.introducao);

//chamando explosao no final
dialogo.callback = function()
{
    instance_create_layer(0, 0, "UI", obj_explosao);
}