/// @description Start drag
if (state != "in") {
	depth = -10;
	is_drag = true;
	last_x = x;
	last_y = y;
	
	with (o_Hero) {
		var _conditions_to_merge = (other.HERO.ID == HERO.ID && (other.RANK == RANK && other.RANK < 6));
		if (id != other.id) {
			if !(_conditions_to_merge) {
				grayscale = true;
			}
		}
	}
}