///item_index(id)
with (obj_Player) {
    for (var o = 0; o < ds_list_size(inventory); o += 1) {
        var oi = ds_list_find_value(inventory, o);
        if (oi != noone) {    
            if (ds_list_find_value(oi, 0) == argument[0]) {
                return o;
            }
        }
    }
}
return -1;
