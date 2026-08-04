inputs();
controle();
interacao();

//mudando a direção da sprite
if (right) image_xscale = 1;
if (left) image_xscale = -1;


if (keyboard_check_pressed(ord("I"))) global.inventario = !global.inventario;