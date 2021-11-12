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
            str += string(ds_list_find_value(list, 0));
            for (var i = 1; i < ds_list_size(list); i += 1) {
                limit = ", ";
                if (sep > 0) {
                    if (i mod 5 == 0) {
                        limit = "], [";
                    }
                }
                str += limit + string(ds_list_find_value(list, i));
            }
            if (sep > 0) {
                str += sepStop;
            }
        }
    }
}
return string(str + stop);
