///room_transition(room, x, y, sprite, image_speed, dir)
roomID = argument[0];
rx = argument[1];
ry = argument[2];
sprite = argument[3];
spriteSpeed = argument[4];
pDir = argument[5];
switch (instance_exists(obj_Transition)) {
    case true: inst = obj_Transition; break;
    case false: inst = instance_create(x, y, obj_Transition); break;
}
with (inst) {
    transitoning = true;
    sprite_index = other.sprite;
    image_speed = other.spriteSpeed;
    map = other.roomID;
    xx = other.rx;
    yy = other.ry;
    show_debug_message("[DBG]: " + tuple("transition", xx, yy));
    dir = other.pDir;
}
