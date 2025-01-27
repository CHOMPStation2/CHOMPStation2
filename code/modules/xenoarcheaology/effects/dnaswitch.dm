/datum/artifact_effect/dnaswitch
<<<<<<< HEAD
	name = "DNA Mutator"
	effect_type = EFFECT_DNASWITCH
=======
	name = "dnaswitch"
	effect_type = EFFECT_ORGANIC
>>>>>>> 63e434274d (bunch of more xenoarch stuff (#16962))
	var/severity

	effect_state = "smoke"
	effect_color = "#77ff83"

/datum/artifact_effect/dnaswitch/New()
	..()
<<<<<<< HEAD
	effect = pick(EFFECT_TOUCH, EFFECT_AURA, EFFECT_PULSE)
	if(effect == EFFECT_AURA)
		severity = rand(10,50)
	else if(effect == EFFECT_PULSE)
		severity = rand(5,25)
	else
		severity = rand(20,90)
=======
	if(effect == EFFECT_AURA)
		severity = rand(5,30)
	else
		severity = rand(25,95)
>>>>>>> 63e434274d (bunch of more xenoarch stuff (#16962))

/datum/artifact_effect/dnaswitch/DoEffectTouch(var/mob/toucher)
	var/weakness = GetAnomalySusceptibility(toucher)
	if(ishuman(toucher) && prob(weakness * 100))
<<<<<<< HEAD
		to_chat(toucher, span_notice(span_green("[pick(
		"You feel a little different.",
		"You feel very strange.",
		"Your stomach churns.",
		"Your skin feels loose.",
		"You feel a stabbing pain in your head.",
		"You feel a tingling sensation in your chest.",
		"Your entire body vibrates.")]")))

=======
		to_chat(toucher,pick(span_green("You feel a little different."),
		span_green("You feel very strange."),
		span_green("Your stomach churns."),
		span_green("Your skin feels loose."),
		span_green("You feel a stabbing pain in your head."),
		span_green("You feel a tingling sensation in your chest."),
		span_green("Your entire body vibrates.")))
>>>>>>> 63e434274d (bunch of more xenoarch stuff (#16962))
		if(prob(75))
			scramble(1, toucher, weakness * severity)
		else
			scramble(0, toucher, weakness * severity)
	return 1

/datum/artifact_effect/dnaswitch/DoEffectAura()
	var/atom/holder = get_master_holder()
<<<<<<< HEAD
	if(istype(holder, /obj/item/anobattery))
		holder = holder.loc
	if(isliving(holder.loc))
		holder = holder.loc
	if(holder)
		var/turf/T = get_turf(holder)
		if(isturf(T))
			for(var/mob/living/carbon/human/H in range(src.effectrange,T))
				var/weakness = GetAnomalySusceptibility(H)
				if(prob(weakness * 100))
					if(prob(30))
						to_chat(H, span_notice(span_green("[pick(
						"You feel a little different.",
						"You feel very strange.",
						"Your stomach churns.",
						"Your skin feels loose.",
						"You feel a stabbing pain in your head.",
						"You feel a tingling sensation in your chest.",
						"Your entire body vibrates.")]")))
					if(prob(50))
						scramble(1, H, weakness * severity)
					else
						scramble(0, H, weakness * severity)

/datum/artifact_effect/dnaswitch/DoEffectPulse()
	var/atom/holder = get_master_holder()
	if(istype(holder, /obj/item/anobattery))
		holder = holder.loc
	if(isliving(holder.loc))
		holder = holder.loc
	if(holder)
		var/turf/T = get_turf(holder)
		if(isturf(T))
			for(var/mob/living/carbon/human/H in range(200, T))
				var/weakness = GetAnomalySusceptibility(H)
				if(prob(weakness * 100))
					if(prob(75))
						to_chat(H, span_notice(span_green("[pick(
						"You feel a little different.",
						"You feel very strange.",
						"Your stomach churns.",
						"Your skin feels loose.",
						"You feel a stabbing pain in your head.",
						"You feel a tingling sensation in your chest.",
						"Your entire body vibrates.")]")))
					if(prob(25))
						if(prob(75))
							scramble(1, H, weakness * severity)
						else
							scramble(0, H, weakness * severity)
=======
	if(holder)
		var/turf/T = get_turf(holder)
		for(var/mob/living/carbon/human/H in range(src.effectrange,T))
			var/weakness = GetAnomalySusceptibility(H)
			if(prob(weakness * 100))
				if(prob(30))
					to_chat(H, pick(span_green("You feel a little different."),
					span_green("You feel very strange."),
					span_green("Your stomach churns."),
					span_green("Your skin feels loose."),
					span_green("You feel a stabbing pain in your head."),
					span_green("You feel a tingling sensation in your chest."),
					span_green("Your entire body vibrates.")))
				if(prob(50))
					scramble(1, H, weakness * severity)
				else
					scramble(0, H, weakness * severity)

/datum/artifact_effect/dnaswitch/DoEffectPulse()
	var/atom/holder = get_master_holder()
	if(holder)
		var/turf/T = get_turf(holder)
		for(var/mob/living/carbon/human/H in range(200, T))
			var/weakness = GetAnomalySusceptibility(H)
			if(prob(weakness * 100))
				if(prob(75))
					to_chat(H, pick(span_green(" You feel a little different."),
					span_green(" You feel very strange."),
					span_green(" Your stomach churns."),
					span_green(" Your skin feels loose."),
					span_green(" You feel a stabbing pain in your head."),
					span_green(" You feel a tingling sensation in your chest."),
					span_green(" Your entire body vibrates.")))
				if(prob(25))
					if(prob(75))
						scramble(1, H, weakness * severity)
					else
						scramble(0, H, weakness * severity)
>>>>>>> 63e434274d (bunch of more xenoarch stuff (#16962))
