///list_sine_create(size, val)
var s = ds_list_create();
var itm = 0;
if (argument_count > 1) {
    itm = argument[1];
}
for (var i = 0; i < argument[0]; i += 1) {
    ds_list_add(s, itm);
}
return s;
