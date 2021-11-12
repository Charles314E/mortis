///surface_light_create()
if (surface_exists(light)) {
    surface_free(light);
}
light = surface_create(max(view_wview[0], view_hview[0]), max(view_wview[0], view_hview[0]));
