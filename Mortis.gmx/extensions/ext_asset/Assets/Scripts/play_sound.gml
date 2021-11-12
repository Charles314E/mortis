///play_sound(snd)
var sound = audio_play_sound(argument[0], 10, false);
audio_sound_gain(sound, 0.5, 1);
return sound;
