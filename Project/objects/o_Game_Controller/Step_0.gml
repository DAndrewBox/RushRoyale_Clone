/// @description 
if (keyboard_check_pressed(vk_space)) {
	var _cell_x = irandom(4);
	var _cell_y = irandom(2);
	var _deck_pos = irandom(4);
	var _new_value = heroes_deck[| _deck_pos].ID;
	
	if (cell_get_value(_cell_x, _cell_y) == 0) {
		cell_set_value(_cell_x, _cell_y, _new_value);
		spawn_hero(_new_value, _cell_x, _cell_y, _deck_pos);
	} else {
		var _tries_left = 100;
		while (cell_get_value(_cell_x, _cell_y) != 0 && _tries_left > 0) {
			var _cell_x = irandom(4);
			var _cell_y = irandom(2);
			_tries_left--;
		}
		
		if (cell_get_value(_cell_x, _cell_y) == 0) {
			cell_set_value(_cell_x, _cell_y, _new_value);
			spawn_hero(_new_value, _cell_x, _cell_y, _deck_pos);
		} else {
			print("CELL EMPTY NOT FOUND");
			print("IMPOSSIBLE TO ADD HERO", _new_value);
		}
	}
}

if (keyboard_check_pressed(vk_numpad1)) {
	var _deck_pos = irandom(4);
	if (global.UPGRADE[_deck_pos] < 5) {
		global.UPGRADE[_deck_pos]++
	
		with (o_Hero) {
			if (DECK_POS == _deck_pos) {
				scale = 1.75;
			}
		}
		
		event_user(10);
	}
}

if (keyboard_check_pressed(vk_f5)) {
	game_restart();
}