///get_filepath()
if (instance_exists(obj_Controller)) {
    var path = obj_Controller.env_path;
}
else {
    path = environment_get_variable("APPDATA") + "\Mortis\save\";
    if (room != rm_MainMenu) {
        with (instance_create(0, 0, obj_Controller)) {
            env_path = other.path;
        }
    }
    path += "save\";
}
show_debug_message("[DBG]: " + path);
return path;
