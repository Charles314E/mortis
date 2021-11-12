///list_tuple(begin, end, list, [sep])
var start = argument[0];
var stop = argument[1];
var str = start;
var sep = 0, sepStart = "[", sepStop = "]", limit;
if (argument_count > 3) {
    sep = argument[3];
}
if (argument_count > 2) {
    var list = argument[2];
    if (list == noone) {
        str += string(noone);
    }
    else {
        if (not ds_list_empty(list)) {
            if (sep > 0) {
                str += sepStart;
            }
            var val = ds_list_find_value(list, 0);
            if (is_array(val)) {
                str += list_tuple("[", "]", val);
            }
            else {
                str += string(val);
            }
            for (var i = 1; i < ds_list_size(list); i += 1) {
                limit = ", ";
                if (sep > 0) {
                    if (i mod 5 == 0) {
                        limit = "], [";
                    }
                }
                var val = ds_list_find_value(list, i);
                if (is_array(val)) {
                    str += limit + list_tuple("[", "]", val);
                }
                else {
                    str += limit + string(val);
                }
            }
            if (sep > 0) {
                str += sepStop;
            }
        }
    }
}
return string(str + stop);
