///state_change(state, [image_index])
value = ds_map_find_value(states, argument[0]);

if not (is_undefined(value)) {
    sprite_index = ds_list_find_value(value, 0);
    image_speed = ds_list_find_value(value, 1);
    
    if (argument_count > 1) {
        if (argument[1] != image_index) {
            image_index = argument[1];
        }
    }
    else {
        if (ds_list_size(value) > 2) {
            var index = ds_list_find_value(value, 2);
            if (index != -1) {
                image_index = index;
            }
            else {
                image_index = 0;
            }
        }
    }
    if (ds_list_size(value) > 3) {
        var scale = ds_list_find_value(value, 3);
        if (scale != -1) {
            rescale(scale);
            show_debug_message(tuple(sprite_width, sprite_height));
        }
    }
    show_debug_message("[DBG]: " + string(state) + " -> " + string(argument[0]) + " " + list_tuple("(", ")", value));
    state = argument[0];
    return ds_list_find_value(value, 0);
}
