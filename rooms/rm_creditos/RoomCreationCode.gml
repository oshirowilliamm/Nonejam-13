if (instance_exists(obj_creditos))
{
    obj_creditos.transicao = true;
}

//tocando a musica de creditos
if (!instance_exists(obj_audio)) instance_create_layer(0, 0, "Instances", obj_audio);
cria_soundtrack(snd_soundtrack_creditos, 3000);