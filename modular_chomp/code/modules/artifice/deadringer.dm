/obj/item/deadringer/process()
	if(activated)
		if (ismob(src.loc))
			var/mob/living/carbon/human/H = src.loc
			watchowner = H
			if(H.getBruteLoss() > bruteloss_prev || H.getFireLoss() > fireloss_prev)
				deathprevent()
				activated = 0
				if(watchowner.isSynthetic())
					to_chat(watchowner, span_blue("You fade into nothingness! [src]'s screen blinks, being unable to copy your synthetic body!"))
				else
					to_chat(watchowner, span_blue("You fade into nothingness, leaving behind a fake body!"))
				icon_state = "deadringer_cd"
				timer = 5
				return
	if(timer > 0)
		timer--
	if(timer == 2)
		reveal()
		if(corpse)
			new /obj/effect/effect/smoke/chem(corpse.loc)
			qdel(corpse)
	if(timer == 0)
		icon_state = "deadringer"
	return
