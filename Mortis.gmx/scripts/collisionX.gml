///collisionX()

//Set Bounding Sides
var bbox = collision_bounds();
var bboxY = ds_list_find_value(bbox, 0);
var bboxX = ds_list_find_value(bbox, 1);
var bboxX1 = ds_list_find_value(bbox, 2);

//Check Horizontal Collision
var blockX = instance_place(bboxX + dir, y, obj_Block);
p2x = bboxX + hSpeed;
p2y = y;
p2b = 0;
if (blockX) {
    blockX = collision_point(bboxX + dir, y, obj_Block, false, false);
    if (blockX) {
        if (not blockX.platform) {
            if (dir > 0) {
                x = (blockX.bbox_left - 1) - bboxRight;
            }
            else if (dir < 0) {
                x = (blockX.bbox_right + 1) - bboxLeft;
            }
            hSpeed = 0;
            p2b = 1;
            if (debug_mode) {
                show_debug_message("[DBG]: collision" + tuple("blockX", blockX.x, blockX.y, object_get_name(object_index), x, y, blockX.collideX));
            }
            blockX.collideX = 8;
            if (not unmoving) {
                if (not (x == max(0, min(x, room_width)) and y == max(0, min(y, room_height)))) {
                    x = cx;
                    y = cy;
                    show_debug_message("[DBG]: collision_tp" + tuple(x, y));
                }
            }
        }
    }
}
