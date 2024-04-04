/mob/living/can_pathfinding_enter(atom/movable/actor, dir, datum/pathfinding/search)
	// mobs are ignored by pathfinding for now
	// in the future we'll need a way for mobs to not collide into
	// each other during cooperative AI actions
	// or even for say, mulebots moving around humans when blocked.
	return TRUE

/mob/living/can_pathfinding_exit(atom/movable/actor, dir, datum/pathfinding/search)
	// mobs are ignored by pathfinding for now
	// in the future we'll need a way for mobs to not collide into
	// each other during cooperative AI actions
	// or even for say, mulebots moving around humans when blocked.
	return TRUE
