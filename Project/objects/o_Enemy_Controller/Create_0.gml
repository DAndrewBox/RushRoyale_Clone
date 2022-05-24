/// @description Setup
depth = -7;

// Rounds variables
round_index		= 1;
round_time		= 90 * room_speed;
round_time_now	= round_time;
round_enemies	= 20;

time_between_enemies = round(round_time / (round_enemies + 1));

// Enemy search algorithms results
enemy_first		= undefined;
enemy_random	= undefined;
enemy_strong	= undefined;
enemy_weak		= undefined;

time_check_search_algorithms = 0;

// Data structs
player_enemies_list = ds_list_create();	// Enemies on your side of the board