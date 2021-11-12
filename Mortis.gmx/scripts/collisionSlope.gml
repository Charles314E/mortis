///collisionSlope()

//Set Bounding Sides
var bbox = collision_bounds();
var bboxY = ds_list_find_value(bbox, 0);
var bboxX = ds_list_find_value(bbox, 1);
var bboxX1 = ds_list_find_value(bbox, 2);

//Check Slopes
var slope = collision_point(bboxX + hSpeed, y, obj_Slope, false, false);
if (slope) {
    //show_debug_message("[DBG]: " + tuple("slope", x + hSpeed, y, slope.x, slope.y));
    var yPlus = 0;
    for (var i = 0; i < 8; i += 1) {
        if (collision_point(x + hSpeed, y - yPlus, slope, false, false)) {
            yPlus += 1;
        }
    }
    y -= yPlus;
    vSpeed = 0;    
}
