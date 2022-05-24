/// @description 
x = lerp(x, xTo, .33);
y = lerp(y, yTo, .33);

if (round(xprevious) == round(x) && round(yprevious) == round(y)) {
	if (area) {
		with (o_Enemy) {
			if (id != TARGET) && (distance_to_point(x, y) <= 24) {
				HP -= other.atk * HERO.AREA_DAMAGE_MULT;
			}
		}
	}
	
	var _text = instance_create_depth(x, y, depth - 5, o_vfx_hp_text);
		_text.HP = atk;
		_text.COLOR = ( is_crit ? c_yellow : c_white );
		
		
	if (special != undefined) {
		target.set_debuff(special, 5, .10);
	}
		
	instance_destroy();
}