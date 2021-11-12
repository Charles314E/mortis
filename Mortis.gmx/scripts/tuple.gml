///tuple(str, ...)
var str = "(";
if (argument_count > 0) {
    var val = argument[0];
    if (is_array(val)) {//(ds_exists(val, ds_type_list)) {
        str += list_tuple("[", "]", val);
    }
    else {
        str += string(val);
    }
    for (var i = 1; i < argument_count; i += 1) {
        var val = argument[i];
        if (is_array(val)) {//(ds_exists(val, ds_type_list)) {
            str += ", " + list_tuple("[", "]", val);
        }
        else {
            str += ", " + string(val);
        }
    }
}
return string(str + ")");
