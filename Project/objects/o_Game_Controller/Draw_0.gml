/// @description Draw Overlay
/*
draw_set_halign(fa_center);
draw_set_valign(fa_center);

for (var i = 0; i < 5; i++) {
	for (var j = 0; j < 3; j++) {
		var _cell_value = chess_grid[# i, j];
		if (_cell_value > 0) {
			var _id = heroes_list[| (_cell_value - 1)];
			var _col = _id.COLOURS[1];
			draw_set_colour(_col);
		} else {
			draw_set_colour(c_ltgray);
		}
		
		draw_text(150 + (i * 60), 660 + (60 * j), _cell_value);
	}
}
*/
if (surface_exists(surf_overlay)) {
	draw_surface(surf_overlay, 0, 0);
} else {
	event_user(10);
}

if (red_tint_alpha > 0.01) {
	red_tint_alpha = lerp(red_tint_alpha, 0.0, .10);
	draw_set_alpha(red_tint_alpha);
	draw_set_colour(c_red);
	draw_rectangle(-8, -8, GAME_W + 8, GAME_H + 8, false);
} else {
	red_tint_alpha = 0.0;
}

draw_set_alpha(1);