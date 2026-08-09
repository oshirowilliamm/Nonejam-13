//resolução normal
res_w = 640;
res_h = 360;

//zoom
zoom_w = res_w / 2;
zoom_h = res_h / 2;

//pegando tamanho da camera
cam = view_camera[0];

//definindo o tamanho da camera com zoom
camera_set_view_size(cam, zoom_w, zoom_h)

//posição da camera
camera_set_view_pos(cam, 160, 180);


voltando_normal = function()
{
    //voltando ao tamanho normal
    if (!global.introducao) exit;
    
    //pegando tamanho da camera atual
    var _cam_w = camera_get_view_width(cam);
    var _cam_h = camera_get_view_height(cam);
    var _cam_x = camera_get_view_x(cam);
    var _cam_y = camera_get_view_y(cam);
    
    //camera voltando ao normal
    var _incremento = .02;
    var _novo_w = lerp(_cam_w, res_w, _incremento);
    var _novo_h = lerp(_cam_h, res_h, _incremento);
    var _novo_x = lerp(_cam_x, 0, _incremento);
    var _novo_y = lerp(_cam_y, 0, _incremento);
    
    //aplicando o tamanho
    camera_set_view_size(cam, _novo_w, _novo_h);
    camera_set_view_pos(cam, _novo_x, _novo_y);
    
    //finalizando
    if (camera_get_view_width(cam) >= res_w - 5)
    {
        camera_set_view_size(cam, res_w, res_h);
        camera_set_view_pos(cam, 0, 0);
    }
}