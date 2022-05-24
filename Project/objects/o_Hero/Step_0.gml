/// @description State Machine
if (scale != 1) {
	scale = lerp(scale, 1, .20);
}

switch (state) {
	case "in":
		#region // Enter board
		if (scale <= 1.01) {
			scale = 1;
			state = "idle";
		}
 		#endregion
		break;
		
	default:
	case "idle":
		if (scale <= 1.01) {
			scale = 1;
		}
		
		if (HERO != undefined) {
			var _hero_target = HERO.TARGET;
			if (_hero_target != CARD_TARGET.NONE) {
				// Find enemy to target
				t_check_enemy++;
			
				if (t_check_enemy > tic) {
					var _search_algorithm;
					switch (_hero_target) {
						default:
						case CARD_TARGET.FIRST:		_search_algorithm = enemies_get_first();	break;
						case CARD_TARGET.RANDOM:	_search_algorithm = enemies_get_random();	break;
						case CARD_TARGET.STRONGEST:	_search_algorithm = enemies_get_strong();	break;
						case CARD_TARGET.WEAKEST:	_search_algorithm = enemies_get_weak();		break;
					}
					
					TARGET = _search_algorithm;
					t_check_enemy = 0;
				}
				
				// Attack enemy
				t_atk_enemy++;
				if (t_atk_enemy >= (HERO.ATK_SPEED / RANK)) {
					if (TARGET != undefined) {
						CRIT_MULT = ( random(1) <= random(1) ? global.CRIT_MULTPLIER : 1.0 );
						var _final_damage = ((HERO.DAMAGE + (HERO.DAMAGE_INCREMENT * (global.UPGRADE[DECK_POS] - 1))) * CRIT_MULT);
						
						var _bullet = instance_create_depth(last_x, last_y, depth - 1, o_Bullet);
							_bullet.image_angle = point_direction(last_x, last_y, TARGET.x, TARGET.y);
							_bullet.xTo = TARGET.x;
							_bullet.yTo = TARGET.y;
							_bullet.atk = _final_damage;
							_bullet.area = HERO.AREA_DAMAGE;
							_bullet.is_crit = (CRIT_MULT > 1);
							_bullet.special = HERO.SPECIAL;
							_bullet.target = TARGET;
							
						TARGET.update_hp(_final_damage);
						
						scale = 1.10;
						sfx_play(snd_pop, .10, .75);
					}
					t_atk_enemy = 0;
				}
			}
		}
		break;
}

#region // Dragging
if (is_drag) {
	x = mouse_x;
	y = mouse_y;
}
#endregion