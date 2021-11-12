///damage(n)
if (not (invulnerable() or dead() or is_state("rolling") or invincible)) {
    var dmg = argument[0];
    mInv = 8;
    inv = mInv;
    hp -= dmg;
    hpLoss += dmg;
    mhpl = 10;
    hpl = mhpl;
    shake_camera(4 * dmg, 0.95);
}
