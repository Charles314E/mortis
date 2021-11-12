///hexl(nibble)
var nbl = argument[0];
var num = 0;
for (var l = 0; l < 4; l += 1) {
    if (string_char_at(nbl, l) == "1") {
        num += power(2, 3 - l);
    }
}
var l = string(num);
if (num > 9) {
    l = chr((num - 9) + 64);
}
show_debug_message("[DBG]: hexl" + tuple(nbl, num, l))
return l;
