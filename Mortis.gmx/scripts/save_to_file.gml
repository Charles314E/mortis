///save_to_file(player, save_path, file_name)
var player = argument[0];
var f_path = argument[1] + argument[2] + ".txt";

var map = ds_map_create();
for (var i = 0; i < ds_list_size(player.inventory); i += 1) {
    var ii = ds_list_find_value(player.inventory, i);
    if (ii != noone) {
        ds_map_add(map, "invID" + string(i), ds_list_find_value(ii, 0));
        ds_map_add(map, "invNum" + string(i), ds_list_find_value(ii, 1));
        var ss = ds_list_create();
        for (var e = 2; e < ds_list_size(ii); e += 1) {
            ds_list_add(ss, ds_list_find_value(ii, e));
        }
        show_debug_message("[SAV]: " + tuple(list_tuple("[", "]", ss), ds_list_size(ss)));
        ds_map_add(map, "invS" + string(i), list_tuple("", "", ss));
    }
}
ds_map_add(map, "mhp", player.mhp);
var rm = room;
var sx = obj_SaveLight.xx;
var sy = obj_SaveLight.yy;
var sDir = obj_SaveLight.dir;
ds_map_add(map, "room", rm);
ds_map_add(map, "x", sx);
ds_map_add(map, "y", sy);
ds_map_add(map, "dir", sDir);

if (debug_mode) {
    show_message(tuple(f_path, file_delete(f_path)));
}
gFile = file_text_open_write(f_path);
show_debug_message("[SAV]: " + f_path);
file_text_write_string(gFile, ds_map_write(map));
file_text_close(gFile);
