/// @description Round setup by time
--round_time_now;
time_check_search_algorithms++;

if (round_time_now > 0) {
	if (round_time_now mod time_between_enemies == 0) {
		enemies_spawn_new();
	}
} else if (round_time_now == 0) {
	enemies_clear_all();
}

if (time_check_search_algorithms >= tic) {
	enemy_first		= enemies_find_first();
	enemy_random	= enemies_find_random();
	enemy_strong	= enemies_find_strong();
	enemy_weak		= enemies_find_weak();
	
	time_check_search_algorithms = 0;
}