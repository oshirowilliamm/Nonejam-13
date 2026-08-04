//diminuindo tempo
tempo = clamp(tempo, 0, tempo--);


//restart
if (keyboard_check_pressed(ord("R"))) game_restart();