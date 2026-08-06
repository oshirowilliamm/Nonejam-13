//aplicando a velocidade
pos_y += vspd;

//mudando direção do vento
if (global.alavanca_2 && !mudou_vento)
{
    vspd = -vspd;
    mudou_vento = true;
}