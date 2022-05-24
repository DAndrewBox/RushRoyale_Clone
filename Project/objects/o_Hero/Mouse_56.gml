/// @description Drop & release
if (is_drag) {
	var _hero_to_merge = collision_point(mouse_x, mouse_y, o_Hero, false, true);
	
	if (_hero_to_merge != noone) {
		// Check if is the same hero and the same rank
		var _conditions_to_merge = (_hero_to_merge.HERO.ID == HERO.ID && (_hero_to_merge.RANK == RANK && _hero_to_merge.RANK < 6));
		
		if (_conditions_to_merge) {
			// Merge into a new hero
			var _deck_pos = irandom(4);
			var _new_hero = o_Game_Controller.heroes_deck[| _deck_pos];
			var _new_hero_id = _new_hero.ID;
			
			_hero_to_merge.scale = 1.25;
			_hero_to_merge.RANK++;
			_hero_to_merge.HERO = get_hero(_new_hero_id);
			_hero_to_merge.COLOURS = _hero_to_merge.HERO.COLOURS;
			_hero_to_merge.DECK_POS = _deck_pos;
			
			o_Game_Controller.chess_grid[# _hero_to_merge.CELL[0], _hero_to_merge.CELL[1]] = _new_hero_id;
			o_Game_Controller.chess_grid[# CELL[0], CELL[1]] = 0;
			
			sfx_play(snd_pop, .75);
			
			instance_destroy();
		} else {
			// Back to initial position
			x = last_x;
			y = last_y;
		}
	} else {
		// Back to initial position
		x = last_x;
		y = last_y;
	}
	
}

depth = -5;
is_drag = false;

with (o_Hero) {
	grayscale = false;
}