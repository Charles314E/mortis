///within_room([encroachment])
var e = 0;
if (argument_count > 0) {
    e = argument[0];
}
if (x + sprite_width >= e and y + sprite_height >= e and x < room_width - e and y < room_height - e) {
    return true;
}
return false;
