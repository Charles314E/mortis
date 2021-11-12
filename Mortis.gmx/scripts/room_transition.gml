///room_transition(room, x, y, colour, image_speed, hdir, vdir)
roomID = argument[0];
rx = argument[1];
ry = argument[2];
sprite = argument[3];
spriteSpeed = argument[4];
if (instance_exists(obj_Player) and argument_count > 5) {
    hDir = argument[5];
    vDir = argument[6];
}
switch (instance_exists(obj_Transition)) {
    case true: inst = obj_Transition; break;
    case false: inst = instance_create(x, y, obj_Transition); break;
}
with (inst) {
    if (instance_exists(obj_Player) and argument_count > 5) {
        dir = sign(argument[5]);
        if (dir == "default") {
            dir = obj_Player.dir;
        }
        hSpeed = argument[5] * (obj_Player.mSpeed + 0.35);
        vSpeed = min(0, argument[6]) * obj_Player.jSpeed;
    }
    transitioning = true;
    colour = argument[3];
    image_speed = argument[4];
    map = argument[0];
    xx = argument[1];
    yy = argument[2];
    show_debug_message("[DBG]: " + tuple("transition", xx, yy));
}
