///collisionY()

//Set Bounding Sides
var bbox = collision_bounds();
var bboxY = ds_list_find_value(bbox, 0);
var bboxX = ds_list_find_value(bbox, 1);
var bboxX1 = ds_list_find_value(bbox, 2);

//Check Vertical Collision
var blockY = collision_point(x, bboxY + sign(vSpeed), obj_Block, false, false);
p0x = x;
p0y = bboxY + sign(vSpeed);
p1b = -1;
//Check if there is a block directly below your center.
if (blockY) {
    ///If there is, attempt to obtain this block.
    blockY = instance_place(x, bboxY + sign(vSpeed), obj_Block);
    if (blockY) {
        //Either if the block was a platform and you are moving down, or the block wasn't a platform...
        if ((blockY.platform and vSpeed > 0) or not blockY.platform) {
            //If there are blocks at your left and right feet...
            var footY1 = collision_point(bbox_left, bboxY + sign(vSpeed), obj_Block, false, false);
            var footY2 = collision_point(bbox_right, bboxY + sign(vSpeed), obj_Block, false, false);
            if (footY1 or footY2) {
                p1x = x;
                p1y = bboxY + sign(vSpeed);
                p1b = 0;
                //If there is a block either at your front foot and your face, or your chest...
                var y1 = collision_point(bboxX, bbox_bottom, obj_Block, false, false);
                var y2 = collision_point(bboxX, bbox_top, obj_Block, false, false);
                var y3 = collision_point(bboxX, y, obj_Block, false, false);
                var frontY1 = (y1 and y2) or y3;
                //Or if there is a block either at your back foot and the back of your head, or your back...
                y1 = collision_point(bboxX1, bbox_bottom, obj_Block, false, false);
                y2 = collision_point(bboxX1, bbox_top, obj_Block, false, false);
                y3 = collision_point(bboxX1, y, obj_Block, false, false);
                var backY1 = (y1 and y2) or y3;
                if (frontY1 or backY1) {
                    //Attempt to obtain the block to your back that you would jump or fall into. If found...
                    frontY1 = collision_point(bboxX1, bboxY, obj_Block, false, false);
                    if (frontY1) {
                        //If you are falling...
                        if (vSpeed >= 0) {
                            //Set your feet to position above the block's top face.
                            y = (frontY1.bbox_top - 1) - bboxBottom;
                        }
                        //Otherwise, if you are jumping and not rolling...
                        else if (vSpeed < 0 and not is_state("rolling")) {
                            //Set the top of your head to position below the block's bottom face.
                            y = (frontY1.bbox_bottom + 1) - bboxTop;
                        }
                        //Stop falling or jumping.
                        vSpeed = 0;
                        p1b = 1;
                        if (debug_mode) {
                            show_debug_message("[DBG]: collision" + tuple("blockY1", object_get_name(frontY1.object_index), frontY1.x, frontY1.y, object_get_name(object_index), x, y, frontY1.collideY));
                        }
                        frontY1.collideY = 8;
                        //If not in a cutscene...
                        if (not unmoving) {
                            //If outside the room...
                            if (not (x == max(0, min(x, room_width)) and y == max(0, min(y, room_height)))) {
                                //Teleport inside the room.
                                x = cx;
                                y = cy;
                                show_debug_message("[DBG]: collision_tp" + tuple(x, y));
                            }
                        }
                    }
                }
                //If there aren't...
                else {
                    p1x = x;
                    p1y = bboxY + sign(vSpeed);
                    //If there is still a block below you...
                    if (blockY) {
                        //You are standing on a thin pillar.
                        //If you are falling...
                        if (vSpeed >= 0) {
                            //Set your feet to position above the block's top face.
                            y = (blockY.bbox_top - 1) - bboxBottom;
                        }
                        //Otherwise, if you are jumping and not rolling...
                        else if (vSpeed < 0 and not is_state("rolling")) {
                            //Set the top of your head to position below the block's bottom face.
                            y = (blockY.bbox_bottom + 1) - bboxTop;
                        }
                        //Stop falling or jumping.
                        vSpeed = 0;
                        p1b = 1;
                        if (debug_mode) {
                            show_debug_message("[DBG]: collision" + tuple("blockY", object_get_name(blockY.object_index), blockY.x, blockY.y, object_get_name(object_index), x, y, blockY.collideY));
                        }
                        if (instance_exists(obj_Enums)) {
                            frontY1.collideY = 8;
                            //If not in a cutscene...
                            if (not unmoving) {
                                //If outside the room...
                                if (not (x == max(0, min(x, room_width)) and y == max(0, min(y, room_height)))) {
                                    //Teleport inside the room.
                                    x = cx;
                                    y = cy;
                                    show_debug_message("[DBG]: collision_tp" + tuple(x, y));
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
