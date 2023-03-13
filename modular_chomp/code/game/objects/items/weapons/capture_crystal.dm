/obj/item/capture_crystal
	var/spawn_mob_name = "A mob"

/obj/item/capture_crystal/loadout
	active = TRUE

/obj/item/capture_crystal/loadout/attack(mob/living/M, mob/living/user)
	if(!bound_mob && M != user)
		to_chat(user, "<span class='notice'>\The [src] emits an unpleasant tone...</span>")
		playsound(src, 'sound/effects/capture-crystal-negative.ogg', 75, 1, -1)
		return
	. = ..()

/obj/item/capture_crystal/loadout/attack_self(mob/living/user)
	if(!bound_mob)
		to_chat(user, "<span class='notice'>\The [src] emits an unpleasant tone... It is not ready yet.</span>")
		playsound(src, 'sound/effects/capture-crystal-problem.ogg', 75, 1, -1)
		return
	. = ..()

/obj/item/capture_crystal/loadout/capture_chance()
	return 0
