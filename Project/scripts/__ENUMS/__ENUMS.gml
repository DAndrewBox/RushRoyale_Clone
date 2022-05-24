enum CARD_RARITY {
	COMMON,
	RARE,
	SUPER_RARE,
	ULTRA_RARE,
	SECRET
}

enum CARD_TYPE {
	DAMAGE,
	SUPPORT,
	DEBUFF,
	SPECIAL
}

enum CARD_TARGET {
	NONE,
	FIRST,
	STRONGEST,
	WEAKEST,
	RANDOM
}

enum CARD_ABILITY {
	NONE,
	FREEZE,		// Slow down enemies
	STUN,		// Stun enemies
	TELEPORT,	// Teleport with units same rank
	DUPLICATE,	// Duplicate merged unit
	UPGRADE,	// Rank up a unit
	MIMIC,		// Can merge with any unit on same rank
	GROWTH,		// Rank up on certain amounts of time
}

enum ENEMY_TYPE {
	COMMON,		// 100% HP,	100% SPEED,	100% DAMAGE
	FAST,		// 50% HP,	150% SPEED,	100% DAMAGE
	MINIBOSS,	// 200% HP,	75% SPEED,	200% DAMAGE
	BOSS
}

enum FACTIONS {
	HERO,
	ANTIHERO,
	MERCENARY,
	ANTIVILLIAN,
	VILLIAN
}

enum COLLECTIONS {
	FIRST_EDITION,
	TEST_1,
	TEST_2,
	TEST_3
}