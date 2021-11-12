///string_split(str, sep)
var str = argument[0];
var sep = argument[1];

var array = ds_list_create();
var substring = "";
show_debug_message("[DBG]: string_split" + tuple(str));
for (var u = 0; u < string_length(str); u += 1) {
    var v = string_char_at(str, u + 1);
    if (v == sep) {
        ds_list_add(array, substring);
        substring = "";
    }
    else {
        substring += v;
    }
    show_debug_message("[DBG]: substring" + tuple(v));
}
if (substring != "") {
    ds_list_add(array, substring);
}
return array;
