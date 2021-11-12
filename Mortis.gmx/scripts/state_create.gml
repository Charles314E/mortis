///state_create(state, sprite_index, image_speed, [image_index, rescale])
var value = argument[0];
var stateAttributes = ds_list_create();
ds_list_add(stateAttributes, argument[1]);
ds_list_add(stateAttributes, argument[2]);
if (argument_count > 3) {
    ds_list_add(stateAttributes, argument[3]);
}
if (argument_count > 4) {
    ds_list_add(stateAttributes, argument[4]);
}
if (is_undefined(state_get_attributes(value))) {
    ds_map_add(states, value, stateAttributes);
}
else {
    ds_map_replace(states, value, stateAttributes);
}
if (state == value) {
    state_change(value, 0);
}
