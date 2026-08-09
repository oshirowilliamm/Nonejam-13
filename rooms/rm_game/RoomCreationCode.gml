global.pause = false;
global.resetando = false;


//tocando musica de fundo
if (!instance_exists(obj_audio)) instance_create_layer(0, 0, "UI", obj_audio);
cria_soundtrack(snd_soundtrack, 2000);