// Inherit the parent event
event_inherited();

item_sprite = noone;

interagir = function()
{
    //destruindo o item
    instance_destroy();
    
    //colocando no inventario
    global.inventario = true;
    global.item = item_sprite;
}