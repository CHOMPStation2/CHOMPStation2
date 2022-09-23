/obj/item/clothing/shoes/MouseDrop_T(mob/living/target, mob/living/user)
	if(!istype(user)) return ..() // If the user passed in isn't a living mob, exit
	if(target != user) return ..() // If the user didn't drag themselves, exit
	if(user.incapacitated() || user.buckled) return ..() // If user is incapacitated or buckled, exit
	if(get_holder_of_type(src, /mob/living/carbon/human) == user) return ..() // No jumping into your own equipment
	if(ishuman(user) && user.get_effective_size() > 0.25) return ..() // Only micro characters

	var/full = 0
	for(var/mob/M in src)
		if(istype(M,/mob/living/voice)) //Don't count voices as people!
			continue
		full++
	if(full >= 2)
		to_chat(user, "<span class='warning'>It doesn't seem like there is room in \the [src]!</span>")
	else
		to_chat(user, "<span class='warning'>You crawl into \the [src]!</span>")
		user.forceMove(src)

	return ..()
