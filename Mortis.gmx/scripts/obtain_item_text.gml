///obtain_item_text(name, [n])
if (argument_count > 1) {
    if (argument[1] > 1) {
        return "You obtained " + argument[1] + " " + string(argument[0]) + "s...";
    }
    else {
        var vowels = ds_list_create();
        ds_list_add(vowels, "a", "e", "i", "o", "u");
        if (ds_list_find_index(vowels, string_char_at(string_lower(argument[0]), 0)) > -1) {
            return "You obtained an " + string(argument[0]) + "...";
        }
        else {
            return "You obtained a " + string(argument[0]) + "...";
        }
    }
}
else {
    return "You obtained the " + string(argument[0]) + "...";
}
