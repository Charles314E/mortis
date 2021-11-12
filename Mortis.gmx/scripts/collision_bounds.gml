//collision_bounds()
var bounds = ds_list_create();
var bboxY = y;
switch (sign(vSpeed)) {
    case -1: bboxY = bbox_top; break;
    case 1: bboxY = bbox_bottom; break;
}
ds_list_add(bounds, bboxY);
var bboxX = x;
var bboxX1 = x;
switch (sign(dir)) {
    case -1: bboxX = bbox_left; bboxX1 = bbox_right; break;
    case 1: bboxX = bbox_right; bboxX1 = bbox_left; break;
}
ds_list_add(bounds, bboxX);
ds_list_add(bounds, bboxX1);
return bounds;
