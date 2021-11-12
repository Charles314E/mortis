///sine_get([n])
if (argument_count > 0) {
    return ds_list_find_value(sine, argument[0]);
}
return ds_list_find_value(sine, 0);
