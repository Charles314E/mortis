///collision()
var bboxY = y;
switch (sign(vSpeed)) {
    case -1: bboxY = bbox_top; break;
    case 1: bboxY = bbox_bottom; break;
}

var blockY = collision_point(x, bboxY + sign(vSpeed), obj_Block, false, false);
if (blockY) {
    blockY = instance_place(x, bboxY + sign(vSpeed), obj_Block);
    var fullY = collision_point(bbox_left, bboxY + sign(vSpeed), obj_Block, false, false) and collision_point(bbox_right, bboxY + sign(vSpeed), obj_Block, false, false);
    if (fullY) {
        if (vSpeed > 0) {
            y = (blockY.bbox_top - 1) - bboxBottom;
        }
        else if (vSpeed < 0) {
            y = (blockY.bbox_bottom + 1) - bboxTop;
        }
        vSpeed = 0;
    }
}

var bboxX = x;
switch (dir) {
    case -1: bboxX = bbox_left; break;
    case 1: bboxX = bbox_right; break;
}

var blockX = collision_point(bboxX + sign(hSpeed), y, obj_Block, false, false);
if (blockX) {
    blockX = instance_place(bboxX + sign(hSpeed), y, obj_Block);
    if (hSpeed > 0) {
        x = (blockX.bbox_left - 1) - bboxRight;
    }
    else if (hSpeed < 0) {
        x = (blockX.bbox_right + 1) - bboxLeft;
    }
    hSpeed = 0;
}
