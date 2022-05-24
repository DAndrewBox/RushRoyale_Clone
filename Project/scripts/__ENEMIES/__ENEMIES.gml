/// @function	Enemy(hp, [type])
/// @param	{real}	hp
/// @param	{real}	[type]
function Enemy(_hp, _type = ENEMY_TYPE.COMMON) constructor {
	HP		= _hp;
	PATH	= pth_Enemies;
	DIST	= 0.0;
	DAMAGE	= 1;

	SPEED	= 1 / (25 * room_speed);
	SPEED_MULTIPLIER = 1.0;
	
	DEBUFF_LIST = [];
	DEBUFF_VAL  = [];
	DEBUFF_TIME = [];
	
	x	= path_get_x(PATH, DIST);
	y	= path_get_y(PATH, DIST);
	
	sprite_index = s_Enemy;
	
	function get_distance() {
		return self.DIST;
	}
	
	function get_hp() {
		return self.HP;
	}
	
	function get_debuff(_debuff_type) {
		var _debuff_size = array_length(self.DEBUFF_TIME);
		
		for (var i = 0; i < _debuff_size; i++) {
			if (self.DEBUFF_LIST[i] == _debuff_type) {
				return i;
			}
		}
		
		return -1;
	}
	
	function get_speed_real() {
		var _spd_real = self.SPEED * self.SPEED_MULTIPLIER;
		
		var _debuff_freeze	= get_debuff(CARD_ABILITY.FREEZE);
		var _debuff_stun	= get_debuff(CARD_ABILITY.STUN);
		
		_spd_real *= ( _debuff_freeze > -1	? 1 - self.DEBUFF_VAL[_debuff_freeze] : 1 );
		_spd_real *= (_debuff_stun < 0);
		
		return _spd_real;
	}
	
	function set_debuff(_debuff_type, _debuff_time, _debuff_value) {
		var _have_debuff = get_debuff(_debuff_type);
		var _debuff_index = ( _have_debuff > -1 ? _have_debuff : array_length(self.DEBUFF_TIME) )

		DEBUFF_LIST[_debuff_index] = _debuff_type;
		DEBUFF_TIME[_debuff_index] = _debuff_time;
		DEBUFF_VAL[_debuff_index]  = _debuff_value;
	}
	
	function update_distance() {
		self.DIST += get_speed_real();
		
		self.x = path_get_x(self.PATH, self.DIST);
		self.y = path_get_y(self.PATH, self.DIST);
		
		if (self.DIST >= 1) {
			global.PLAYER_HP -= self.DAMAGE;
			
			o_Game_Controller.red_tint_alpha = .66;
			if (global.PLAYER_HP <= 0) {
				game_restart();
			}
			
			self.die();
		}
	}
	
	function update_hp(_damage) {
		self.HP -= _damage;
		
		if (self.get_hp() <= 0) {
			self.die();
		}
	}
	
	function update_debuff_time() {
		var _debuff_size = array_length(self.DEBUFF_TIME);
		
		for (var i = 0; i < _debuff_size; i++) {
			if (self.DEBUFF_LIST[i] != undefined) {
				self.DEBUFF_TIME[i] -= 1;
			
				if (self.DEBUFF_TIME[i] <= 0.0) {
					self.DEBUFF_LIST[i] = undefined;
					self.DEBUFF_TIME[i] = undefined;
					self.DEBUFF_VAL[i]  = undefined;
				}
				
				print(self.DEBUFF_LIST[i], self.DEBUFF_TIME[i], self.DEBUFF_VAL[i]);
			}
		}
	}
	
	function draw() {
		draw_sprite(self.sprite_index, 0, self.x, self.y);
		if (self.HP > 0) {
			draw_text_outline(self.x, self.y + 10, round(self.HP), c_white, c_black);
		}
	}
	
	function die() {
		instance_create_depth(self.x, self.y, -10, o_vfx_smoke);
	}
}

/// @function enemies_update_distance()
function enemies_update_distance() {
	var _enemies = o_Enemy_Controller.player_enemies_list;
	var _size = ds_list_size(_enemies);
	
	for (var i = 0; i < _size; i++) {
		if (is_struct(_enemies[| i])) {
			_enemies[| i].update_distance();
			_enemies[| i].update_debuff_time();
			
			if (_enemies[| i].get_distance() >= 1 || _enemies[| i].get_hp() <= 0) {
				delete _enemies[| i];
			}
		}
	}
}

/// @function	enemies_draw()
function enemies_draw() {
	var _enemies = o_Enemy_Controller.player_enemies_list;
	var _size = ds_list_size(_enemies);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	for (var i = 0; i < _size; i++) {
		if (is_struct(_enemies[| i])) {
			_enemies[| i].draw();
		}
	}
}

/// @function	enemies_spawn_new()
function enemies_spawn_new() {
	var _enemies = o_Enemy_Controller.player_enemies_list;
	var _size = ds_list_size(_enemies);
	
	_enemies[| _size] = new Enemy(irandom_range(1000, 5000));
}

/// @function	enemies_find_first()
function enemies_find_first() {
	/* Find the first enemy searching from
	the first one spawned to the last one. */
	var _enemies = o_Enemy_Controller.player_enemies_list;
	var _size = ds_list_size(_enemies);
	
	var _enm_id = undefined;
	var _enm_dis = -1;
	
	for (var i = 0; i < _size; i++) {
		if (_enemies[| i] == undefined) { continue; }
		if (_enemies[| i].DIST > _enm_dis) {
			_enm_id = _enemies[| i];
			_enm_dis = _enemies[| i].DIST;
		}
	}
	
	return _enm_id;
}

/// @function	enemies_find_strong()
function enemies_find_strong() {
	/* Find the strongest enemy searching from
	the last one spawned to the first one. */
	var _enemies = o_Enemy_Controller.player_enemies_list;
	var _size = ds_list_size(_enemies);
	
	var _enm_id = undefined;
	var _enm_hp = -1;
	
	for (var i = _size - 1; i >= 0; i--) {
		if (_enemies[| i] == undefined) { continue; }
		if (_enemies[| i].HP > _enm_hp) {
			_enm_id = _enemies[| i];
			_enm_hp = _enemies[| i].HP;
		}
	}
	
	return _enm_id;
}

/// @function	enemies_find_weak()
function enemies_find_weak() {
	/* Find the weakest enemy searching from
	the last one spawned to the first one. */
	var _enemies = o_Enemy_Controller.player_enemies_list;
	var _size = ds_list_size(_enemies);
	
	var _enm_id = undefined;
	var _enm_hp = infinity;
	
	for (var i = 0; i < _size; i++) {
		if (_enemies[| i] == undefined) { continue; }
		if (_enemies[| i].HP < _enm_hp) {
			_enm_id = _enemies[| i];
			_enm_hp = _enemies[| i].HP;
		}
	}
	
	return _enm_id;
}

/// @function	enemies_find_random()
function enemies_find_random() {
	var _enemies = o_Enemy_Controller.player_enemies_list;
	var _size = ds_list_size(_enemies);
	var _no_active_enemies = true;
	var _enm_id;
	
	for (var i = 0; i < _size; i++) {
		if (_enemies[| i] != undefined) { _no_active_enemies = false; break; };
	}
	
	if (_no_active_enemies) {
		return undefined;
	} else {
		do {
			_enm_id = _enemies[| irandom(_size - 1)];
		} until (_enm_id != undefined || _no_active_enemies);
	}
	
	return _enm_id;
}

/// @function	enemies_clear_all()
function enemies_clear_all() {
	var _enemies = o_Enemy_Controller.player_enemies_list;
	var _size = ds_list_size(_enemies);
	
	for (var i = 0; i < _size; i++) {
		if (is_struct(_enemies[| i])) {
			delete _enemies[| i];
		}
	}
	
	ds_list_clear(_enemies);
}

/// @function	enemies_get_first()
function enemies_get_first() {
	return o_Enemy_Controller.enemy_first;
}

/// @function	enemies_get_strong()
function enemies_get_strong() {
	return o_Enemy_Controller.enemy_strong;
}

/// @function	enemies_get_weak()
function enemies_get_weak() {
	return o_Enemy_Controller.enemy_weak;
}

/// @function	enemies_get_random()
function enemies_get_random() {
	return o_Enemy_Controller.enemy_random;
}