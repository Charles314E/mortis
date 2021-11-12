///switch_bgm(track, volume, intro, loops)
new_bgm = argument[0];
vol = argument[1];
intro = argument[2];
if (argument_count > 3) {
    loop = argument[3];
    if (loop == 0) {
        loop = audio_sound_length(bgm) - intro - 2;
    }
}
else {
    loop = audio_sound_length(bgm) - intro - 2;
}

audio_sound_gain(bgm, 0, 1000);
if (new_bgm != noone) {
    bgm2 = audio_play_sound(new_bgm, 100, false);
    audio_sound_gain(bgm2, vol, 1000);
}
else {
    bgm = noone;
}
if (not switching) {
    alarm[0] = room_speed;
    switching = true;
}
intro_length = intro;
loop_length = loop;
total_length = intro_length + loop_length;
show_debug_message("[BGM]: Object " + string(object_index) + ", " + object_get_name(object_index) + " switched the BGM from " + audio_get_name(bgm_current) + " to " + audio_get_name(new_bgm) + ", volume " + string(vol) + " with an length of " + string(intro_length) + " + " + string(loop_length) + " = " + string(total_length) + ".")
