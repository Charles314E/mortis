///byte(char, [bits, len])
var bChar = ord(argument[0]);
var bits = 8;
var len = bits;
if (argument_count > 1) {
    bits = argument[1];
    if (argument_count > 2) {
        len = argument[2];
    }
}
var byt = "";
var pow, bit;
for (var b = 0; b < bits; b += 1) {
    if (((len - 1) - b) >= 0) {
        pow = power(2, (len - 1) - b);
        bit = "1";
        if (bChar < pow) {
            bit = "0";
        }
        byt += bit;
        bChar -= pow;
    }
}
show_debug_message("[DBG]: byte" + tuple(bChar, byt));
return byt;
