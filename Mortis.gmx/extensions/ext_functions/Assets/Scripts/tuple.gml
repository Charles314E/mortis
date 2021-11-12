///tuple(str, ...)
var str = "(";
if (argument_count > 0) {
    str += string(argument[0]);
    for (var i = 1; i < argument_count; i += 1) {
        str += ", " + string(argument[i]);
    }
}
return string(str + ")");
