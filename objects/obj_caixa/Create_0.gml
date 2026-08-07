// Inherit the parent event
event_inherited();

interagir = function()
{
    if (global.item.nome != "Pente Rosa")
    {
        //começando reação 3
        dar_item("pente");
    }
    //devolvendo o pente
    else
    {
        global.inventario = false;
        global.item = 
        {
            sprite: noone,
            nome: "",
            obj: noone,
            efeito: function(){},
            
            alvo: noone,
            alvo_alcance: 0,
            highlight: noone,
        }
    }
}
