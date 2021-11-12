///save_game()
save_to_file(obj_Player, obj_Controller.env_path, "file");
with (obj_Controller) {
    r_current = room_first;
    roomFirst = room;
    savingRoom = true;
}
with (obj_Camera) {
    target = obj_Player;
}
