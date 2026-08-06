//empurrando o player pra tras
with (obj_player)
{
    x -= max_hspd * sign(image_xscale);
}