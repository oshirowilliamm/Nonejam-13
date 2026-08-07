define_barreira();


//avisando o player pra resetar
if (!instance_exists(obj_dialogo) && linha >= array_length(dialogo)) 
{
    with (obj_player) 
    {
    	if (alarm[0] < 0) alarm[0] = .5 * FPS;
    }
}


//destruindo a barreira 1
if (index == 1 && global.explosao)
{
    instance_destroy(id);
}