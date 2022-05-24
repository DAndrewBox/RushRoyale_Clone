// @function draw_text_outline(x, y, text, color_in, color_out)
function draw_text_outline(_x, _y, _text, _col_in, _col_out) {
	
	draw_set_color(_col_out);
	for (var i = -1; i < 2; i++) {
		for (var j = -1; j < 2; j++) {
			draw_text(_x + (i * 2), _y + (j * 2), _text);
		}
	}
	
	draw_set_color(_col_in);
	draw_text(_x, _y, _text);
	
	draw_set_color(c_white);
}