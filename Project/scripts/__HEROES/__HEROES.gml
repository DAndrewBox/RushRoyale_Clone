/// @function	Hero(id, name, description, rarity, type, target, damage, atack_speed)
///  @param	{real}		id
///  @param	{string}	name
///  @param	{string}	description
///  @param	{string}	rarity
///  @param	{string}	type
///  @param	{string}	target
///  @param	{real}		damage
///  @param	{real}		attack_speed

function Hero(_id, _name, _desc, _rarity, _type, _target, _damage, _speed) constructor {
	ID			= _id;
	NAME		= _name;
	DESC		= _desc;
	RARITY		= _rarity;
	TYPE		= _type;
	TARGET		= _target;
	DAMAGE		= _damage;
	ATK_SPEED	= _speed;
	
	DAMAGE_INCREMENT = 50;
	AREA_DAMAGE = false;
	AREA_DAMAGE_MULT = .50;
	
	COLOURS = [0, 0];
	SPECIAL = undefined;
	
	FACTION		= FACTIONS.MERCENARY;
	COLLECTION	= COLLECTIONS.FIRST_EDITION;
	
	function set_colours(_in, _out) {
		COLOURS[0] = _in;
		COLOURS[1] = _out;
	}
}


/// @function	get_hero(id)
/// @param	{real}	id
function get_hero(_id) {
	return o_Game_Controller.heroes_list[| (_id - 1)];
}	

/// @function	spawn_hero(id, cell_x, cell_y, deck_pos)
/// @param	{real}	id
/// @param	{real}	cell_x
/// @param	{real}	cell_y
/// @param	{real}	deck_pos
function spawn_hero(_id, _cell_x, _cell_y, _deck_pos) {
	var _hero = get_hero(_id);
	var _hero_inst = instance_create_depth(150 + (_cell_x * 60), 660 + (_cell_y * 60), -5, o_Hero);
		_hero_inst.HERO = _hero;
		_hero_inst.COLOURS = _hero.COLOURS;
		_hero_inst.CELL = [_cell_x, _cell_y];
		_hero_inst.DECK_POS = _deck_pos;
		
	sfx_play(snd_pop, .75);
}

/// @function	setup_heroes()
function setup_heroes() {
	o_Game_Controller.heroes_list[| 0] = new Hero(1, "Test Hero 1", "Test Description", CARD_RARITY.COMMON,		CARD_TYPE.DAMAGE,	CARD_TARGET.FIRST,		100,	second / 3);
	o_Game_Controller.heroes_list[| 1] = new Hero(2, "Test Hero 2", "Test Description", CARD_RARITY.RARE,		CARD_TYPE.SPECIAL,	CARD_TARGET.STRONGEST,	10,		second / 1.5);
	o_Game_Controller.heroes_list[| 2] = new Hero(3, "Test Hero 3", "Test Description", CARD_RARITY.EPIC,		CARD_TYPE.DEBUFF,	CARD_TARGET.WEAKEST,	25,		second / 2);
	o_Game_Controller.heroes_list[| 3] = new Hero(4, "Test Hero 4", "Test Description", CARD_RARITY.LEGENDARY,	CARD_TYPE.SUPPORT,	CARD_TARGET.NONE,		0,		0);
	o_Game_Controller.heroes_list[| 4] = new Hero(5, "Test Hero 5", "Test Description", CARD_RARITY.RARE,		CARD_TYPE.DEBUFF,	CARD_TARGET.RANDOM,		10,		second / .75);

	for (var i = 0; i < 5; i++) {
		var _cols = [i * 50, i * 50, 50 + i * 50];
		var _col_in = make_colour_rgb(_cols[0] / 2, _cols[1] / 2, _cols[2] / 2);
		var _col_out = make_colour_rgb(_cols[0], _cols[1], _cols[2]);
	
		o_Game_Controller.heroes_list[| i].set_colours(_col_in, _col_out);
	}

}