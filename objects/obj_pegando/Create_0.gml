// Inherit the parent event
event_inherited();

item_sprite = noone;
item_sprite_menor = noone;
item_nome = "";

//posição do highlight
pos_x = x;
pos_y = y;

interagir = function()
{
    //destruindo o item
    instance_destroy();
    
    //colocando no inventario
    global.inventario = true;
    global.item.sprite = item_sprite;
    global.item.sprite_menor = item_sprite_menor;
    global.item.nome = item_nome;
    global.item.x = pos_x;
    global.item.y = pos_y;
}

dropando_item = function()
{
    
}