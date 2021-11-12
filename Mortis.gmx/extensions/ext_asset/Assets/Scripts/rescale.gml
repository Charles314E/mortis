///rescale(size, [silent]);
if (argument_count > 1) {
    var size = resize(argument[0], argument[1]);
}
else {
    var size = resize(argument[0]);
}
image_xscale = ds_list_find_value(size, 0);
image_yscale = ds_list_find_value(size, 1);
if (argument_count > 1) {
    if (not argument[1]) {
        show_debug_message("[DBG]: rescale(" + string(argument[0]) + ") -> " + tuple(object_get_name(object_index), sprite_width, sprite_height) + " " + list_tuple("(", ")", size));
    }
}
else {
    show_debug_message("[DBG]: rescale(" + string(argument[0]) + ") -> " + tuple(object_get_name(object_index), sprite_width, sprite_height) + " " + list_tuple("(", ")", size));
}
