/// @description Surface setup
if !(surface_exists(surf_text)) {
	surf_text = surface_create(64, 64);
}

surface_set_target(surf_text);
draw_clear_alpha(c_red, 0.0);

draw_set_font(fnt_numb);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text_outline(32, 32, round(HP), COLOR, c_black);

surface_reset_target();
