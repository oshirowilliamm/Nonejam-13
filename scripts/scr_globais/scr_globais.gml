#macro FPS game_get_speed(gamespeed_fps) 

//pause
global.pause = false;
#macro PAUSE if (global.pause) exit



//timer
global.timer = 60 * FPS;

//checa se tem algum item no inventario ou não
global.inventario = false;

//dados do item no inventario
global.item = 
{
    sprite: noone,
    nome: "",
    obj: noone,
    efeito: function(){},
    
    alvo: noone,
    alvo_alcance: 0,
    highlight: noone,
    
    dialogo: noone,
    proximo_item: noone
}