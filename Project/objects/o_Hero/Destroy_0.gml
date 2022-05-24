/// @description Destroy animation and activate special if needed
if (HERO.SPECIAL != undefined) {
	// TODO: Activate specials
}

repeat(6) {
	instance_create_depth(x + random_range(-16, 16), y + random_range(-16, 16), -10, o_vfx_smoke);
}