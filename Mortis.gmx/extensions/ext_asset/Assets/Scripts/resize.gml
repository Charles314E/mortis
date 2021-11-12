///resize(size, [silent]);
var size = argument[0];
var newScale = ds_list_create();
ds_list_add(newScale, size / sprite_get_width(sprite_index), size / sprite_get_height(sprite_index));
if (argument_count > 1) {
    if (not argument[1]) {
        show_debug_message("[DBG]: resize -> " + tuple(ds_list_find_value(newScale, 0), ds_list_find_value(newScale, 1)));
    }
}
else {
    show_debug_message("[DBG]: resize -> " + tuple(ds_list_find_value(newScale, 0), ds_list_find_value(newScale, 1)));
}
return newScale;
