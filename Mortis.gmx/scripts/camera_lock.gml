///camera_lock(target, [speed])
if (instance_exists(obj_Camera)) {
    obj_Camera.target = argument[0];
    obj_Camera.fractionSpeed = argument[1];
}
