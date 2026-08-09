audio_stop_all();


musica_id = noone;
musica_nome = noone;


transicao_musica = function(_nova_musica, _gain_ms)
{
    //se a musica nova for a mesma que ta tocando, sai
    if (_nova_musica == musica_nome) exit;
    
    //parando de tocar a musica antiga
    if (audio_is_playing(musica_id))
    {
        audio_sound_gain(musica_id, 0, _gain_ms);
    }
    
    //preparando a musica nova
    if (_nova_musica != noone)
    {
        //começa no volume 0
        musica_id = audio_play_sound(_nova_musica, 0, 1);
        audio_sound_gain(musica_id, 0);
        
        //aumentando a musica
        audio_sound_gain(musica_id, 1, _gain_ms);
        
        //atualizando a musica atual
        musica_nome = _nova_musica;
    }
    else
    {
        musica_id = noone;
    }
}