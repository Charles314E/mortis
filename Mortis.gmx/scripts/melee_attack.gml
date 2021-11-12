///melee_attack(state, prefix, hsp, [knock, damage, sfx, sweep, target, visible, scale])
if (state_exists(argument[0]) or argument[0] == noone) {
    if (argument[0] != noone) {
        state_change(argument[0]);
    }
    with (instance_create(x, y, obj_Slash)) {
        dmg = 1;
        if (argument_count > 4) {
            dmg = argument[4];
        }
        if (argument_count > 8) {
            visible = argument[8];
        }
        
        if (argument[0] == noone) {
            sprite_index = asset_get_index(argument[1]);
            show_debug_message("[DBG]: " + tuple(argument[1], sprite_index));
        }
        else {        
            sprite_index = asset_get_index(argument[1] + argument[0]);
            show_debug_message("[DBG]: " + tuple(argument[1] + argument[0], sprite_index));
        }
        owner = other;
        if (instance_exists(owner)) {
            x = owner.x;
            y = owner.y;
            dir = owner.dir;
            image_xscale = dir;
            if (argument_count > 9) {
                image_xscale *= argument[9];
                image_yscale *= argument[9];
            }
            image_speed = owner.image_speed;
            image_index = owner.image_index;
            target = obj_Enemy;
            if (argument_count > 7) {
                target = argument[7];
            }
            sweep = 0;
            if (argument_count > 6) {
                sweep = argument[6];
            }
        }
        if (argument_count > 3) { 
            hSpeed = argument[3];
        }
        if (argument_count > 5) {
            sfx = play_sound(argument[5], 0.5);
        }
    }
    hSpeed = argument[2];
    return true;
}
return false;
