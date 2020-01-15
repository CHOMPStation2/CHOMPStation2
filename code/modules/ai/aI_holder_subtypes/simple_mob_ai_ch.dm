/datum/ai_holder/simple_mob/melee/pack_mob
	cooperative = TRUE
	call_distance = 28 // pack mobs should be able to communicate quite a ways - we can assume by howls/etc
	can_flee = TRUE
	flee_when_dying = TRUE // animals know to run when wounded/overmatched
	flee_when_outmatched = TRUE // animals know to run when wounded/overmatched

/datum/ai_holder/simple_mob/melee/pack_mob/post_melee_attack(atom/A)
	if(holder.Adjacent(A))
		holder.IMove(get_step(holder, pick(alldirs)))
		holder.face_atom(A)

