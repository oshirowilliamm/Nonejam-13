//checando se a flor esta viva
flor = instance_nearest(x, y, obj_flor_morta);
var _dist = point_distance(x, y, flor.x, flor.y);

if (flor != noone)
{
    x += flor.x;
    y += flor.y;
}

show_debug_message("x" + string(x));
show_debug_message("y" + string(y));