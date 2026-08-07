// Inherit the parent event
event_inherited();

//se eu tenho item na mão, ele n fica interagivel
if (global.inventario && global.item.nome != "Pente Rosa") 
{
    interagivel = false;
}
else
{
    interagivel = true;
}