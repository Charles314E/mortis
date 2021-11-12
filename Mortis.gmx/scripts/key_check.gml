///key_check(char)
var char = argument[0];
if (is_string(char)) {
    char = ord(char);
}
return (keyboard_check(char) or keyboard_check_pressed(char) or keyboard_check_released(char));
