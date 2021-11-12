///change_room_sound()
if current_room != room
{
    var room_prefix, room_title;
    room_split = string_split(room_get_name(room), "_");
    room_prefix = ds_list_find_value(room_split, 0);
    room_title = room_get_name(room);
    intro_length = 0;
    loop_length = 0;
    bgm_count += 1
    
    switch room_prefix
    {
        case "rm": 
            switch room_title
            {
                case "rm_MainMenu": room_bgm = msc_MainMenu; loop_length = 43; break;
                case "rm_Level": room_bgm = noone; break;
                default: room_bgm = noone; break;
            }; break;
        default: room_bgm = noone; break;
    }
    
    if room_bgm != noone
    {
        if loop_length = 0
        {
            loop_length = audio_sound_length(room_bgm) - intro_length;
        }
        if room_bgm != bgm_current
        {
            bgm_current = room_bgm;
            switch_bgm(bgm_current, 1, intro_length, loop_length);
        }
    }
    else
    {
        switch_bgm(noone, 0, 0, 0);
    }
    current_room = room;
}
