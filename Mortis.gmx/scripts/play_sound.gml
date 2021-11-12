///play_sound(snd, [volume, surround])
if (argument[0] != noone) {
    var sound = audio_play_sound(argument[0], 10, false);
    var vol = 0.5;
    var surround = false;
    if (argument_count > 1) {
        vol = argument[1];
        if (argument_count > 2) {
            if (argument[2]) {
                surround = argument[2];
            }
        }
    }
    if (not (surround or object_index == obj_Player or object_index == obj_Music or object_index == obj_Slash)) {
        var dist = distance_to_object(obj_Player) / 8;
        if (dist <= 20) {
            vol = vol / (dist * 0.5);
            audio_sound_gain(sound, vol, 1);
        }
        else {
            audio_stop_sound(sound);
        }
    }
    else if (object_index == obj_Slash) {
        if (owner.object_index == obj_Player) {
            audio_sound_gain(sound, vol, 1);
        }
        else {
            var dist = distance_to_object(obj_Player) / 8;
            if (dist <= 20) {
                vol = vol / (dist * 0.5);
                audio_sound_gain(sound, vol, 1);
            }
            else {
                audio_stop_sound(sound);
            }
        }
    }
    else {
        audio_sound_gain(sound, vol, 1);
    }
    return sound;
}
return false;
