///collisionBack()

//Set Bounding Sides
var bbox = collision_bounds();
var bboxY = ds_list_find_value(bbox, 0);
var bboxX = ds_list_find_value(bbox, 1);
var bboxX1 = ds_list_find_value(bbox, 2);

//Push Out Back
var blockX1 = instance_place(bboxX1, y, obj_Block);
p3x = bboxX1 - dir;
p3y = y;
p3b = 0;
if (blockX1) {
    blockX1 = collision_point(bboxX1, y, obj_Block, false, false);
    if (blockX1) {
        if (sign(hpSpeed) != -dir) {
            if (dir < 0) {
                x = (blockX1.bbox_left - 1) - bboxRight;
            }
            else if (dir > 0) {
                x = (blockX1.bbox_right + 1) - bboxLeft;
            }
        }
        p3b = 1;
        if (debug_mode) {
            show_debug_message("[DBG]: collision" + tuple("blockX1", blockX1.x, blockX1.y, object_get_name(object_index), x, y, blockX1.collideX1));
        }
        with (blockX1) {
            if (collidedX1(7)) {
                with (other) {
                    collisionY();
                }
            }
            collideX1 = 8;
        }
        if (not unmoving) {
            if (not (x == max(0, min(x, room_width)) and y == max(0, min(y, room_height)))) {
                x = cx;
                y = cy;
                show_debug_message("[DBG]: collision_tp" + tuple(x, y));
            }
        }
    }
}
