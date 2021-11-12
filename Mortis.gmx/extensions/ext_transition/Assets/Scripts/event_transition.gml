///event_transition(inst, alarm_num, sprite, image_speed)
object = argument[0];
num = argument[1];
sprite = argument[2];
spriteSpeed = argument[3];
switch (instance_exists(obj_Transition)) {
    case true: inst = obj_Transition; break;
    case false: inst = instance_create(x, y, obj_Transition); break;
}
with (inst) {
    transitoning = true;
    alarmObject = other.object;
    alarmNum = other.num;
}
