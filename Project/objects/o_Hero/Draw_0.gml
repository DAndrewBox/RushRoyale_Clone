/// @description Draw hero
draw_set_alpha(1);
if (HERO != undefined) {
	if (grayscale) {
		shader_set(shd_grayscale);
		draw_sprite_ext(s_mergerank_in, (RANK - 1), x, y, scale, scale, 0, HERO.COLOURS[0], 1/scale);
		draw_sprite_ext(s_mergerank_out, (RANK - 1), x, y, scale, scale, 0, HERO.COLOURS[1], 1/scale);
		// TODO: Draw hero sprite
		shader_reset();
	} else {
		draw_sprite_ext(s_mergerank_in, (RANK - 1), x, y, scale, scale, 0, HERO.COLOURS[0], 1/scale);
		draw_sprite_ext(s_mergerank_out, (RANK - 1), x, y, scale, scale, 0, HERO.COLOURS[1], 1/scale);
	}
}