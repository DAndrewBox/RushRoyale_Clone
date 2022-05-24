/// @description Setup overlay surface
if !(surface_exists(surf_overlay)) {
	surf_overlay = surface_create(GAME_W, GAME_H);
}

surface_set_target(surf_overlay);
draw_clear_alpha(c_black, 0.0);
draw_set_alpha(1);

#region // Overlay Foreground
draw_sprite_ext(s_Overlay_fg_top, 0, 0, 0, GAME_W/2, 1, 0, -1, 1);
draw_sprite(s_Overlay_fg_bot, 0, 0, 826);
#endregion

#region // Heroes
for (var i = 0; i < 4; i++) {
	var _hero = heroes_deck[| i];
	var _col_in = _hero.COLOURS[0];
	var _col_out = _hero.COLOURS[1];
	
	if (i < 2) {
		draw_sprite_ext(s_Overlay_fg_hero_square, 0, 97 + (90 * i), 862, 1, 1, 0, _col_in, 1);
		draw_sprite_ext(s_Overlay_fg_hero_square, 1, 97 + (90 * i), 862, 1, 1, 0, _col_out, 1);
	} else {
		draw_sprite_ext(s_Overlay_fg_hero_square, 0, 352 + (90 * (i - 2)), 862, 1, 1, 0, _col_in, 1);
		draw_sprite_ext(s_Overlay_fg_hero_square, 1, 352 + (90 * (i - 2)), 862, 1, 1, 0, _col_out, 1);
	}
}
#endregion

#region // Hero levels
for (var i = 0; i < 4; i++) {
	var _hero_level = (global.UPGRADE[i] - 1);
	
	if (i < 2) {
		draw_sprite(s_Overlay_fg_level_bar, _hero_level, 77 + (90 * i), 887);
	} else {
		draw_sprite(s_Overlay_fg_level_bar, _hero_level, 332 + (90 * (i - 2)), 887);
	}
}
#endregion

surface_reset_target();