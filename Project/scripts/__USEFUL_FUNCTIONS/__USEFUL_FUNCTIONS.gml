/// @function		cell_get_value(x, y)
/// @param	{real}	x
/// @param	{real}	y
function cell_get_value(_x, _y) {
	return o_Game_Controller.chess_grid[# _x, _y];
}

/// @function		cell_set_value(x, y, value)
/// @param	{real}	x
/// @param	{real}	y
/// @param	{real}	value
function cell_set_value(_x, _y, _val) {
	o_Game_Controller.chess_grid[# _x, _y] = _val;
}

/// @function		print(*args)
/// @param	{string}	*args
function print() {
	var _str = "";
	for (var i = 0; i < argument_count; i++) {
		_str += string(argument[i]) + " ";
	}
	
	show_debug_message(_str);
}

/// @function	sfx_play(sound, volume, [pitch])
/// @param	{index}	sound
/// @param	{float}	volume
/// @param	{float}	[pitch]
function sfx_play(_snd, _vol) {
	var _pitch = ( argument_count > 2 ? argument[2] : 1.0 );
	var _audio = audio_play_sound(_snd, 25, false);
	audio_sound_gain(_audio, _vol, 1);
	audio_sound_pitch(_audio, _pitch);
}