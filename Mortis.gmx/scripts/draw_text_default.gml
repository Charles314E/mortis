///draw_text_default(x, y, text, [c1, c2, alpha, halign, valign, font])
var c1 = noone, c2 = noone, a = 1;
if (argument_count > 3) {
    c1 = argument[3];
    if (argument_count > 4) {
        c2 = argument[4];
        if (argument_count > 5) {
            a = argument[5];
            if (argument_count > 6) {
                if (argument[6] != noone) {
                    draw_set_halign(argument[6]);
                }
                if (argument_count > 7) {
                    if (argument[7] != noone) {
                        draw_set_valign(argument[7]);
                    }
                    if (argument_count > 8) {
                        draw_set_font(argument[8]);
                    }
                }
            }
        }
    }
}
if (c1 == noone) {
    c1 = c_white;
}
if (c2 == noone) {
    c2 = make_colour_rgb(max(0, colour_get_red(c1) - 50), max(0, colour_get_green(c1) - 50), max(0, colour_get_blue(c1) - 50));
}
draw_text_transformed_colour(argument[0], argument[1], argument[2], textSize, textSize, 0, c1, c1, c2, c2, a);
if (argument_count > 6) {
    draw_set_halign(fa_left);
    if (argument_count > 7) {
        draw_set_valign(fa_top);
        if (argument_count > 8) {
            draw_set_font(fnt_Text);
        }
    }
}
var dim = array_create(2);
dim[0] = string_width(argument[2]) * textSize;
dim[1] = string_height(argument[2]) * textSize;
return dim;
