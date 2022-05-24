/// @description 
if (time <= 0) {
	instance_destroy();
} else {
	time--;
	y -= 2 * (time / (room_speed * .66));
}

var _alpha = (time / (room_speed * .66));

if (surface_exists(surf_text)) {
	draw_surface_ext(surf_text, x - 32 , y - 32, 1, 1, 0, -1, _alpha);
} else {
	event_user(0);
}