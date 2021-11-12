///initialize_particle(type, min_size, max_size, swell, r, g, b, grav, start_alpha, end_alpha, life, [sprite, animated?])
type = argument[0];
min_size = argument[1];
max_size = argument[2];
swell = argument[3];
r = argument[4];
g = argument[5];
b = argument[6];
grav = argument[7];
start_alpha = argument[8];
end_alpha = argument[9];
life = argument[10];
container = part_type_create();
if (type == "sprite") {
    sprite = argument[11];
    anim = argument[12];
    part_type_sprite(container, sprite, anim, true, false);
}
else {
    part_type_shape(container, type);
}
part_type_size(container, min_size, max_size, swell, 0);
part_type_colour_rgb(container, r, r, g, g, b, b);
switch (sign(grav)) {
    case -1: part_type_gravity(container, abs(grav), 90); break;
    case 1: part_type_gravity(container, abs(grav), 270); break;
}
part_type_alpha2(container, start_alpha, end_alpha);
part_type_life(container, room_speed * life, room_speed * life);
return container;
