//diminuindo tempo
tempo = clamp(tempo, 0, tempo--);


//debug
if (keyboard_check_pressed(ord("R"))) game_restart();
if (keyboard_check_pressed(ord("G"))) estado_dialogo = "abrindo";