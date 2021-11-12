///set_hp(mhp, [hp])
mhp = argument[0];
if (argument_count > 1) {
    hp = max(0, min(argument[1], mhp));
}
else {
    hp = mhp;
}
