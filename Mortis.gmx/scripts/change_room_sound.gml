///change_room_sound()
if (current_room != room) {
    current_room = room;
    var room_prefix, room_title;
    room_split = string_split(room_get_name(current_room), "_");
    room_prefix = ds_list_find_value(room_split, 0);
    room_title = room_get_name(current_room);
    for (var i = 0; i < 10; i += 1) {
        room_title = string_replace(room_title, string(i), "");
    }
    intro_length = 0;
    loop_length = 0;
    bgm_count += 1
    whispers = false;
    room_bgm_vol = 1;
    switch (room_prefix) {
        case "rm": 
            switch (room_title) {
                case "rm_MainMenu": room_bgm = msc_MainMenu; intro_length = 5; break;
                case "rm_Cave": room_bgm =  msc_CreepyWind; intro_length = 5; room_bgm_vol = 0.6; whispers = true; break;
                case "rm_SaveRoom": room_bgm = noone; whispers = true; break;
                default: room_bgm = noone; break;
            }; break;
        default: room_bgm = noone; break;
    }
    
    show_debug_message("[MSC]: change" + tuple(room_title, bgm_current, room_bgm));
    if (room_bgm != noone) {
        if (loop_length == 0) {
            loop_length = audio_sound_length(room_bgm) - intro_length;
        }
        if (room_bgm != bgm_current) {
            switch_bgm(room_bgm, room_bgm_vol, intro_length, loop_length);
        }
    }
    else {
        switch_bgm(noone, 0, 0, 0);
    }
    bgm_current = room_bgm;
}
