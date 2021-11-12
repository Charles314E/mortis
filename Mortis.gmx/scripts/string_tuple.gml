///string_tuple(begin, end, str, ...)
var start = argument[0];
var stop = argument[1];
var str = start;
if (argument_count > 2) {
    str += string(argument[2]);
    for (var i = 3; i < argument_count; i += 1) {
        str += ", " + string(argument[i]);
    }
}
return string(str + stop);
