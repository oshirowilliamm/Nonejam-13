pode_correr = true;

//destruindo a barreira
if (instance_exists(obj_barreira))
{
    with (obj_barreira) 
    {
    	if (index == 0)
        {
            instance_destroy();
        }
    }
}