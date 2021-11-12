///load_from_file(file_name)
var game_path = obj_Controller.env_path + argument[0] + ".txt";
var f_path = noone;
if (not (game_path == "" or game_path == env_path)) {
    f_path = game_path;
    show_debug_message("[LDS]: File " + f_path + " is loaded.");
}
if (f_path != noone) {
    var map = ds_map_create();
    if (debug_mode) {
        show_message(f_path);
    }
    var file = file_text_open_read(f_path);
    var list = file_text_read_string(file);
    show_debug_message("[LDS]: " + list);
    ds_map_read(map, list);
    var key;
    /*key = ds_map_find_first(map);
    for (var i = 0; i < ds_map_size(map); i += 1) {
        var val = ds_map_find_value(map, key);
        show_debug_message("[LDS]: " + key + tuple(val));
        key = ds_map_find_next(map, key);
    }*/
    show_debug_message("[LDS]: mhp" + tuple(ds_map_find_value(map, "mhp")));
    show_debug_message("[LDS]: room" + tuple(room_get_name(ds_map_find_value(map, "room")), ds_map_find_value(map, "x"), ds_map_find_value(map, "y"), ds_map_find_value(map, "dir")));
    file_text_close(file);
    show_debug_message("[LDS]: File " + string(file) + " has been read.");
    return map;
}
return noone;
