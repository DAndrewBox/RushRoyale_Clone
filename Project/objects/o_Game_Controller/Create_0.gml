/// @description Setup
randomize();
show_debug_overlay(true);
gc_target_frame_time(1000000);

#region // Create data structs
chess_grid = ds_grid_create(5, 3);		// In-game chessboard heroes placed
heroes_list = ds_list_create();			// All current heroes list
heroes_deck = ds_list_create();			// Your heroes in deck

ds_grid_clear(chess_grid, 0);
setup_heroes();
#endregion

#region // [Debug] Setup a random deck
while (ds_list_size(heroes_deck) < 5) {
	var _new_hero = get_hero(irandom_range(1, 5));

	if (ds_list_find_index(heroes_deck, _new_hero) == -1) {
		ds_list_add(heroes_deck, _new_hero);
	}
}
#endregion

#region // Setup Deck
global.PLAYER_HP = 3;
global.CRIT_MULTPLIER = 1.0;
global.UPGRADE = [1, 1, 1, 1, 5];
#endregion

#region // Overlay setup
surf_overlay = -1;
event_user(10);
#endregion

depth = -20;

red_tint_alpha = 0.0;

audio_master_gain(.75);
audio_play_sound(msc_Main, 100, true);