///hex(char)
var str1 = argument[0];
var str2 = "";
var char, nChar, nibble, pow, letter;
for (var i = 0; i < string_length(str1); i += 1) {
    char = string_char_at(str1, i);
    if (char != " ") {
        nibble = "";
        nChar = ord(char);
        letter = "";
        while (nChar > 1) {
            pow = ceil(log2(nChar));
            letter = hexl(byte(char, pow, 4));
            string_insert(letter, nibble, 0);
            for (var ii = 0; ii < 4; ii += 1) {
                pow = floor(log2(nChar));
                nChar -= pow;
            }
            show_debug_message("[DBG]: hex" + tuple(letter, nChar));
        }
        str2 += letter;
    }
    str2 += " ";
}
show_debug_message("[DBG]: " + str2);
return str2;
