///slash(hsp, [damage, sfx, sweep])
var sfx = noone;
if (argument_count > 2) {
    sfx = argument[2];
}
var sweep = -1;
if (argument_count > 3) {
    sweep = argument[3];
}
var st = "slash" + string(slashes + 1);
if (argument_count > 1) {
    if (melee_attack(st, "msk_Player_", argument[0], 1, argument[1], sfx, sweep)) {
        slashes += 1;
        return true;
    }
    return false;
}
else {
    if (melee_attack(st, "msk_Player_", argument[0], 1, 1, sfx, sweep)) {
        slashes += 1;
        return true;
    }
    return false;
}
