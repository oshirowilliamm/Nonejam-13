pode_correr = true;

//destruindo a barreira
if (instance_exists(obj_barreira))
{
    if (obj_barreira.index == 0)
    {
        instance_destroy(obj_barreira);
    }
}