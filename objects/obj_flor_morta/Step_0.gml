// Inherit the parent event
event_inherited();


//escolhendo as flores interagiveis
if (index <= 1 && !foi_aguada) 
{
    sprite = spr_flor_morta; 
    interagivel = false; //nao interagindo se estiver morta
}
else
{
    sprite = spr_flor; 
}