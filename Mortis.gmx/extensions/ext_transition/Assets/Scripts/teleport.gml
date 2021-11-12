///teleport(room, x, y, dir)
var roomID = argument[0];
if (not (is_undefined(roomID) or roomID == noone)) {
    room_goto(roomID);
    px = argument[1];
    py = argument[2];
    pDir = argument[3];
    with (par_Player) {
        x = other.px;
        y = other.py;
        show_debug_message("[DBG]: " + tuple("teleport", x, y));
        dir = other.pDir;
        if (object_index == obj_Light) {
            y -= 16;
            ds_list_add(bounces, room, x, y);
            moving = true;
        }
        else if (not (dir == -1 or dir == 1)) {
            dir = 1;
        }
        obj_Camera.x = x;
        obj_Camera.y = y;
    }
}
