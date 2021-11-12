///draw_text_scaled(x, y, text, xscale, yscale, [c1, c2, alpha, halign, valign, font])
var c1 = c_white, c2 = noone, a = 1, xscale = argument[3], yscale = argument[4];
show_debug_message("[SCR]: " + object_get_name(object_index) + ".draw_text_scaled(" + string(argument_count) + ")");
if (argument_count > 5) {
    c1 = argument[5];
    if (argument_count > 6) {
        c2 = argument[6];
        if (argument_count > 7) {
            a = argument[7];
            if (argument_count > 8) {
                if (argument[8] != noone) {
                    draw_set_halign(argument[8]);
                }
                if (argument_count > 9) {
                    if (argument[9] != noone) {
                        draw_set_valign(argument[9]);
                    }
                    if (argument_count > 10) {
                        draw_set_font(argument[10]);
                    }
                }
            }
        }
    }
}
if (c2 == noone) {
    c2 = make_colour_rgb(max(0, colour_get_red(c1) - 50), max(0, colour_get_green(c1) - 50), max(0, colour_get_blue(c1) - 50));
}
draw_text_transformed_colour(argument[0], argument[1], argument[2], textSize * xscale, textSize * yscale, 0, c1, c1, c2, c2, a);
if (argument_count > 6) {
    draw_set_halign(fa_left);
    if (argument_count > 7) {
        draw_set_valign(fa_top);
        if (argument_count > 10) {
            draw_set_font(fnt_Text);
        }
    }
}
var dim = array_create(2);
dim[0] = string_width(argument[2]) * textSize * xscale;
dim[1] = string_height(argument[2]) * textSize * yscale;
return dim;
