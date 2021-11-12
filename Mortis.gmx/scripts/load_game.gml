///load_game()
if (not debug_mode) {
    load_path = get_filepath();
    if file_exists(load_path + "file.txt") {
        map = load_from_file("file");
        with (obj_Player) {
            for (var i = 0; i < ds_list_size(inventory); i += 1) {
                var invID = ds_map_find_value(other.map, "invID" + string(i));
                if (not is_undefined(invID)) {
                    var invNum = ds_map_find_value(other.map, "invNum" + string(i));
                    var ii = ds_list_create();
                    ds_list_add(ii, invID, invNum);
                    var ss = ds_map_find_value(other.map, "invS" + string(i));
                    if (ss != "") {
                        var sl = string_split(string_replace(ss, " ", ""), ",");
                        show_debug_message("[LDS]: " + tuple(ss, list_tuple("[", "]", sl), ds_list_size(sl)));
                        show_debug_message("[LDS]: " + tuple(ds_list_find_value(sl, 0), ds_list_find_value(sl, 1)));
                        for (var e = 0; e < ds_list_size(sl); e += 1) {
                            ds_list_add(ii, int64(ds_list_find_value(sl, e)));
                            show_debug_message("[LDS]: " + string(ds_list_find_value(sl, e)));
                        }
                    }
                    show_debug_message("[LDS]: " + list_tuple("[", "]", ii));
                    ds_list_replace(inventory, i, ii);
                }
            }
            saved = true;
            healed = true;
            fallingDownShaft = false;
            state_change("praying", 7);
            set_hp(ds_map_find_value(other.map, "mhp"));
            teleport(ds_map_find_value(other.map, "room"), ds_map_find_value(other.map, "x"), ds_map_find_value(other.map, "y"), tsn_FadeBlack, 0.5, 0, 0);
            dir = ds_map_find_value(other.map, "dir");
            show_debug_message("[LDS]: Loaded player.");
        }
        return true;
    }
}
return false;
