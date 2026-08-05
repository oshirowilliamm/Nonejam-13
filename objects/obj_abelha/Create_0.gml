//1 - se as flores estiverem mortas, vai pra lampada
//2 - se as flores estiverem vivas vão para as flores
//3 - ir para as flores de acordo com a posição delas (primeira plataforma ou na cadeira)
dest_x = 0;
dest_y = 0;
lamp_x = 105;
lamp_y = 137;

spd = .5;
hspd = 0;
vspd = 0;

rodeando = false;
sq_instancia = noone;


definindo_destino = function()
{
    //checando se a flor esta viva
    //se tiver uma flor viva (sempre vai existir)
    if (instance_exists(obj_flor))
    {
        //pegando flor mais prox
        var _flor = instance_nearest(x, y, obj_flor);
        
        //vendo se essa flor está antes do x 300
        if (_flor.x < 300)
        {
            //tem flor viva
            dest_x = _flor.x - 16;
            dest_y = _flor.y - 5;
        }
        //se não existe flor viva, vai pra lampada
        else
        {
            dest_x = lamp_x;
            dest_y = lamp_y;
        }
    }
}

definindo_trajeto = function()
{
    if (rodeando) exit;
    
    //definindo trajeto do destino
    var _dir = point_direction(x, y, dest_x, dest_y);
    
    //definindo velocidade
    hspd = lengthdir_x(spd, _dir);
    vspd = lengthdir_y(spd, _dir);
    
    //indo ate o ponto
    x += hspd;
    y += vspd;
    direction = _dir;
    
    //se chegou no destino, vai pro rodear
    var _dist = point_distance(x, y, dest_x, dest_y);
    if (_dist < 1)
    {
        rodeando = true;
        rodear();
    }
}

rodear = function()
{
    //rodando transição
    if (sq_instancia == noone || !layer_sequence_exists("sq_abelha", sq_instancia))
    {
        sq_instancia = layer_sequence_create("sq_abelha", x, y, sq_abelha_rodeando);
    }
    
    //tirando a abelha
    instance_destroy();
    
    //se a abelha n ta na lampada
    if (dest_x != lamp_x)
    {
        //se ta perto da ana catarina
        if (dest_x > 140)
        {
            //avisando a ana catarina
            global.abelha_no_vaso = true;
        }
    }
}