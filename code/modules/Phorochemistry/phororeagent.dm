var/induromol_frequency = rand(700, 750) * 2 + 1 //signallers only increase by .2 increments
var/induromol_code = rand(1, 50)

/datum/reagent/phororeagent
	name = REAGENT_UNKNOWN
	id = REAGENT_ID_UNKNOWN
	description = "Currently unknown"
	reagent_state = LIQUID

	//called by phorochemputer.dm, returns special message upon creating reagent
	//mostly dangerous initial reactions, to ensure protective gear is worn
	proc/initial_reaction(var/obj/item/reagent_containers/container, var/turf/T, var/volume, var/message)
		if(reagent_state == GAS)
			return "WARNING: Gaseous reaction detected! Repeating reaction inadvisable."
		return message

/*		Genetics is removed now.
/datum/reagent/phororeagent/extreme_mutagen //this one should work fine, but genetics may still be a little messed up
	id = REAGENT_ID_MUTAGENX
	name = REAGENT_MUTAGENX
	description = "Seems as if it would induce instant, random mutations in a living humanoid"
	color = "#20E7F5"

/datum/reagent/phororeagent/extreme_mutagen/on_mob_life(var/mob/living/M as mob)
	spawn(20) //give time to inject entire syringe if wanted
		var/damage = rand(5 * (src.volume / 30 + 1), 10 * (src.volume / 30 + 1))
		//to deal with blood dialysis of toxin

		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			H.dna.check_integrity()
			var/block
			if(prob(91 - (min(src.volume, 60) / 1.5))) //odds are always against you, and high doses are dangerous
				block = pick(FAKEBLOCK, FAKEBLOCK, DEAFBLOCK, DEAFBLOCK, CLUMSYBLOCK, BLINDBLOCK)
			else
				block = pick(HULKBLOCK,XRAYBLOCK,FIREBLOCK,TELEBLOCK,XRAYBLOCK,FIREBLOCK,TELEBLOCK)

			var/cur_DNA = H.dna.GetSEState(block)
			do
				H.dna.SetSEState(block, !cur_DNA)
			while(H.dna.GetSEState(block) == cur_DNA)
			//ensure it toggles 100% of the time
			//sometimes needs 3-4 toggles before it takes, not sure why

			domutcheck(M,null,MUTCHK_FORCED)
			M.update_mutations()

		M.adjustToxLoss(damage)
		M.reagents.add_reagent(REAGENT_ID_TOXIN, src.volume / 4) //add toxin damage over time
		holder.remove_reagent(src.id, src.volume) //instant use
*/
/datum/reagent/phororeagent/bicordrazine
	id = REAGENT_ID_BICORDRAZINE
	name = REAGENT_BICORDRAZINE
	description = "Testing indicates potentially a more efficient form of Tricordrazine"
	color = "#C8A5DC"
	metabolism = 2.5 * REM

/datum/reagent/phororeagent/bicordrazine/on_mob_life(var/mob/living/M as mob, var/alien)
	if(M.stat == 2)
		return
	if(!M)
		M = holder.my_atom
	if(!alien || alien != IS_DIONA)
		if(M.getOxyLoss())
			M.adjustOxyLoss(-2*REM)
		if(M.getBruteLoss() && prob(80))
			M.heal_organ_damage(2*REM,0)
		if(M.getFireLoss() && prob(80))
			M.heal_organ_damage(0,2*REM)
		if(M.getToxLoss() && prob(80))
			M.adjustToxLoss(-2*REM)
	..()

/datum/reagent/phororeagent/genedrazine
	id = REAGENT_ID_GENEDRAZINE
	name = REAGENT_GENEDRAZINE
	description = "Seems as if it would heal very quickly, but at the cost of genetic damage"

/datum/reagent/phororeagent/genedrazine/on_mob_life(var/mob/living/M as mob, var/alien)
	var/healedDamage = 0

	if(M.getOxyLoss())
		healedDamage = 1
		M.adjustOxyLoss(-4*REM)
	if(M.getBruteLoss())
		healedDamage = 1
		M.heal_organ_damage(4*REM,0)
	if(M.getFireLoss())
		healedDamage = 1
		M.heal_organ_damage(0,4*REM)
	if(M.getToxLoss())
		healedDamage = 1
		M.adjustToxLoss(-4*REM)

	if(healedDamage && prob(50))
		M.adjustCloneLoss(1)

	return ..()

/datum/reagent/phororeagent/lacertusol
	id = REAGENT_ID_LACERTUSOL
	name = REAGENT_ID_LACERTUSOL
	description = "Looks as if it turns off certain muscle inhibitors, increasing unarmed strength dramatically"
	color = "#FFFA73"
	//implementation in human_attackhand.dm

/datum/reagent/phororeagent/love_potion
	id = REAGENT_ID_AMORAPOTIO
	name = REAGENT_AMORAPOTIO
	description = "Seems as if it would induce incredibly strong feelings of affection"
	color = "#E3209B"
	metabolism = 0.5 * REM
	var/love_name

/datum/reagent/phororeagent/love_potion/on_mob_life(var/mob/living/M as mob, var/alien)
	if(!istype(holder, /datum/reagents/metabolism/bloodstream))
		if(ishuman(M))
			if(!love_name)
				var/dist = 100
				for(var/mob/living/carbon/human/H in view(M))
					if(H == M)
						continue
					var/distTo = sqrt(((M.x - H.x) ** 2) + ((M.y - H.y) ** 2))
					if(distTo < dist)
						dist = distTo
						love_name = H.name

				if(love_name)
					to_chat(M, span_darkpink("You see [love_name]..."))
					spawn(0)
						sleep(10)
						to_chat(M, span_darkpink("They are beautiful"))

						if(M.mind) //give protect objective
							var/datum/objective/protection = new/datum/objective()
							protection.explanation_text = span_darkpink("Protect [love_name] at all costs")
							M.mind.objectives.Add(protection)
							var/obj_count = 1
							to_chat(M, span_notice("Your current objectives:"))
							for(var/datum/objective/objective in M.mind.objectives)
								to_chat(M, span_bold("Objective #[obj_count]") + ": [objective.explanation_text]")
								obj_count++

							to_chat(M, "<BR>)")
			else
				if(prob(5))
					if(prob(98))
						var/list/love_messages = list("You feel strong affection towards [love_name]",
						"You can't stop thinking about [love_name]", "[love_name] is love, [love_name] is life",
						"[love_name] seems irresistable", "You cannot fathom life without [love_name]",
						"[love_name] seems to be the essence of perfection",
						"[love_name] can never be allowed to leave your side")

						to_chat(M, span_darkpink("[pick(love_messages)]"))

					else
						to_chat(M, span_darkpink("You begin to build a trouser tent"))
	return ..()

/datum/reagent/phororeagent/love_potion/on_remove(var/atom/A)
	if(!istype(holder, /datum/reagents/metabolism/bloodstream))
		if(istype(A, /mob/living))
			var/mob/living/M = A
			if(M.mind)
				var/message = "Your mind feels a lot more focused"
				var/end_message = ""
				var/list/message2list = list()
				var/i = 1
				var/length = length(message)
				while(i <= length)
					message2list += copytext(message, i, i + 1)
					i++
				var/col_perc = 1 / length
				var/col_inc = 0
				var/red = 0
				var/green = 0
				var/blue = 0
				for(var/char in message2list) //fade from pink to black text
					red = (227 * (1 - col_inc))
					green = (32 * (1 - col_inc))
					blue = (155 * (1 - col_inc))
					end_message += "<font color = '[rgb(red, green, blue)]'>[char]</font>"
					col_inc += col_perc

				to_chat(M, end_message)

				for(var/datum/objective/O in M.mind.objectives)
					if(findtext(O.explanation_text, "Protect [love_name] at all costs"))
						M.mind.objectives.Remove(O)
						var/obj_count = 1
						to_chat(M, span_notice("Your current objectives:"))
						for(var/datum/objective/objective in M.mind.objectives)
							to_chat(M, span_bold("Objective #[obj_count]") + ": [objective.explanation_text]")
							obj_count++

						to_chat(M, "<BR>")

/datum/reagent/phororeagent/love_potion/on_mob_death(var/mob/M)
	//update objectives
	if(M.mind)
		for(var/datum/objective/O in M.mind.objectives)
			if(findtext(O.explanation_text, "Protect [love_name] at all costs"))
				M.mind.objectives.Remove(O)
				var/obj_count = 1
				to_chat(M, span_notice("Your current objectives:"))
				for(var/datum/objective/objective in M.mind.objectives)
					to_chat(M, span_bold("Objective #[obj_count]") + ": [objective.explanation_text]")
					obj_count++

				to_chat(M, "<BR>")
				break

/obj/item/reagent_containers/glass/beaker/lovepotion
	name = "beaker (amorapotio)"
	prefill = list(REAGENT_ID_AMORAPOTIO = 60)

/datum/reagent/phororeagent/nasty
	id = REAGENT_ID_NASTY
	name = REAGENT_NASTY
	description = "Ewwwwwwwwwwwwwww"
	color = "#F5F2F7"

/datum/reagent/phororeagent/nasty/touch_mob(var/mob/M, var/volume)
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		H << span_warning("You are so repulsed by the liquid splashed on you that you feel like puking")
	//	H.vomit() not fast enough
		src = null
		spawn(0)
			if(!H.lastpuke)
				H.lastpuke = 1
				H << span_warning("You feel nauseous...")
				spawn(10)	//1 second until second warning
					H << span_warning("You feel like you are about to throw up!")
					spawn(20)	//and you have 2 more to escape
						H.Stun(8)

						H.visible_message(span_warning("[H] throws up!"),span_warning("You throw up!"))
						playsound(H.loc, 'sound/effects/splat.ogg', 50, 1)

						var/turf/location = H.loc
						if (istype(location, /turf/simulated))
							location.add_vomit_floor(H, 1)

						H.nutrition -= 40
						H.adjustToxLoss(-3)
						spawn(350)	//wait 35 seconds before next volley
							H.lastpuke = 0

/datum/reagent/phororeagent/nasty/touch_turf(var/turf/T, var/volume)
	var/obj/effect/decal/cleanable/vomit/V = locate(/obj/effect/decal/cleanable/vomit, T)
	if(!V)
		V = new/obj/effect/decal/cleanable/vomit(T)
		V.name = "ewwwwwww"
		V.desc = "That's nasty."
		V.icon_state = "vomittox_2"

	var/dist = 100
	var/mob/living/carbon/human/immune
	for(var/mob/living/carbon/human/H in viewers(T, 2))
		var/distTo = sqrt(((T.x - H.x) ** 2) + ((T.y - H.y) ** 2))
		if(distTo < dist && (istype(H.l_hand, /obj/item/reagent_containers) || \
		istype(H.r_hand, /obj/item/reagent_containers)))
			immune = H //so reagent spill does not affect user, they already threw up when it was created

	src = null
	for(var/mob/living/carbon/human/H in viewers(T, 7))
		if(H == immune)
			H << span_notice("You are absolutely disgusted, but you hold your stomach contents in.")
			continue
		H << span_warning("You are so disgusted by what looks like spilled vomit you might throw up!")
	//	H.vomit() not fast enough
		spawn(0)
			if(!H.lastpuke)
				H.lastpuke = 1
				H << span_warning("You feel nauseous...")
				spawn(50)	//5 seconds until second warning
					H << span_warning("You feel like you are about to throw up!")
					spawn(50)	//and you have 5 more for mad dash to the bucket
						H.Stun(5)

						H.visible_message(span_warning("[H] throws up!"),span_warning("You throw up!"))
						playsound(H.loc, 'sound/effects/splat.ogg', 50, 1)

						var/turf/location = H.loc
						if (istype(location, /turf/simulated))
							location.add_vomit_floor(H, 1)

						H.nutrition -= 40
						H.adjustToxLoss(-3)
						spawn(350)	//wait 35 seconds before next volley
							H.lastpuke = 0
					//	return ..()

/datum/reagent/phororeagent/nasty/initial_reaction(var/obj/item/reagent_containers/container, var/turf/T, var/volume, var/message)
	for(var/mob/living/carbon/human/H in viewers(T, 7))
		H << span_warning("There is something about the reagent from the telepad you find absolutely repulsive.")
		H.vomit()
	return ..()

/datum/reagent/phororeagent/babelizine
	id = REAGENT_ID_BABELIZINE
	name = REAGENT_BABELIZINE
	description = "Similar to an enzyme produced by the incredibly rare Babel Fish, might have great linguistic applications"
	color = "#E5F58E"
	metabolism = 0.2 * REM

/datum/reagent/phororeagent/babelizine/on_mob_life(var/mob/living/M as mob, var/alien)
	M.universal_understand = 1
	..()

/datum/reagent/phororeagent/babelizine/on_remove(var/atom/A)
	if(istype(A, /mob/living))
		var/mob/living/M = A
		M.universal_understand = 0
		to_chat(M, span_warning("You no longer feel attuned to the spoken word."))

/datum/reagent/phororeagent/babelizine/on_mob_death(var/mob/M)
	holder.remove_reagent(src.id, src.volume)

/datum/reagent/phororeagent/calcisol
	id = REAGENT_ID_CALCISOL
	name = REAGENT_CALCISOL
	description = "Looks as though it could have profound effects upon broken limbs"
	color = "#EDE6E1"

/datum/reagent/phororeagent/calcisol/on_mob_life(var/mob/living/M as mob, var/alien) //12 units per bone
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/list/broken = list()
		for(var/obj/item/organ/external/E in H.organs)
			if(E && (E.status & ORGAN_BROKEN))
				broken += E

		if(broken.len >= 1 && src.volume >= 12)
			var/obj/item/organ/external/bone = broken[rand(1, broken.len)]
			bone.brute_dam = min(25, bone.brute_dam) //ensure bone doesn't break again
			bone.status &= ~ORGAN_BROKEN
		//	bone.perma_injury = 0 Not sure what Polaris equivalent is or why this was necessary
			H.visible_message(
			span_notice("You hear a loud crack as [H.name]'s [bone.name] appears to heal miraculously."))
			holder.remove_reagent(src.id, 12)
	..()


/datum/reagent/phororeagent/malaxitol
	id = REAGENT_ID_MALAXITOL
	name = REAGENT_MALAXITOL
	description = "Analysis indicates it could greatly speed up the rate at which other reagents are metabolized"
	color = "#A155ED"
	metabolism = 2 * REM

/datum/reagent/phororeagent/malaxitol/on_mob_life(var/mob/living/M as mob, var/alien)
	for(var/datum/reagent/R in M.reagents.reagent_list)
		if(R.id == src.id)
			continue
		R.on_mob_life(M, alien)

	..()

/datum/reagent/phororeagent/paralitol
	id = REAGENT_ID_PARALITOL
	name = REAGENT_PARALITOL
	description = "Seems as if it could work as an extreme muscle inhibitor"
	color = "#2F85CC"
	metabolism = 3 * REM

/datum/reagent/phororeagent/paralitol/on_mob_life(var/mob/living/M as mob, var/alien)
	M.Weaken(2)
	M.stuttering = 50
	return ..()

/datum/reagent/phororeagent/doloran //I don't like this one, could really use different mechanics, kind of just paralitol with pain -DrBrock
	id = REAGENT_ID_DOLORAN
	name = REAGENT_DOLORAN
	description = "Looks as if it could cause horrifically intense pain"
	color = "#F20A0E"
	metabolism = 2 * REM

/datum/reagent/phororeagent/doloran/on_mob_life(var/mob/living/M as mob, var/alien)
	M.halloss = 100
	M.stuttering = 10

	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		H.shock_stage = min(H.shock_stage, 100)


	if(prob(10))
		if(prob(33))
			M.emote("scream")
		else
			if(prob(50))
				M.emote("me", 1, "grits their teeth")
			else
				M.emote("me", 1, "writhes in pain")
	..()

/datum/reagent/phororeagent/fulguracin
	id = REAGENT_ID_FULGURACIN
	name = REAGENT_FULGURACIN
	description = "Looks as though it could work as an extreme electrical inhibitor"
	color = "#362F31"

/datum/reagent/phororeagent/fulguracin/touch_mob(var/mob/M, var/volume)
	if(istype(M, /mob/living/silicon))
		var/mob/living/silicon/S = M
		S.take_organ_damage(0, volume/2, emp = 1)
		S << span_notice("Some of your systems report damage as a result of the liquid.")
	else
		if(istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = M
			if(H.isSynthetic())
				H.take_overall_damage(0, volume/2)
				H << span_notice("Some of your systems report damage as a result of the liquid.")
//implementation also in power.dm and electrical_field.dm

/datum/reagent/phororeagent/mortemol
	id = REAGENT_ID_MORTEMOL
	name = REAGENT_MORTEMOL
	description = "Further testing required, could potentially reanimate dead cells if delivered with enough force"
	color = "#000000"
	metabolism = 5 * REM //gotta balance it somehow
	data = list(0) //use data? Might cause problems with blood dialysis

/datum/reagent/phororeagent/mortemol/touch_mob(var/mob/M, var/volume) //requires a splash to start effects because dead humans don't process reagents
	if(!istype(M, /mob/living/carbon))
		return 0

	var/mob/living/carbon/C = M
	if(holder)
		if(!istype(holder.my_atom, /obj/effect/effect/smoke/chem))
			if(C.reagents)
				if(C.stat && !(data[1]))
					data[1] = 1
					C.reagents.add_reagent(id, volume, data)
					C.rejuvenate()
					C.rejuvenate() //I like C.rejuvenate()
					C.visible_message(span_notice("[C] seems to wake from the dead!"))
				else
					C.reagents.add_reagent(id, volume)

/datum/reagent/phororeagent/mortemol/on_mob_life(var/mob/living/M as mob, var/alien)
	if(data[1])
		M.halloss = 100
		M.stuttering = 1

	return ..()

/datum/reagent/phororeagent/mortemol/on_remove(var/atom/A)
	if(data[1])
		if(istype(A, /mob))
			var/mob/M = A
			to_chat(M, span_notice("You feel the last traces of chemicals leave your body as you return to death once more..."))
			M.death(0)
		//Reagent giveth, and reagent taketh away

/datum/reagent/phororeagent/mortemol/on_mob_death(var/mob/M)
	if(data[1])
		return
	else
		if(istype(M, /mob/living/carbon))
			var/mob/living/carbon/C = M
			data[1] = 1
			C.rejuvenate()
			C.rejuvenate() //Necessary to call twice in testing
			C.visible_message(span_notice("[C] seems to wake from the dead!"))

/datum/reagent/phororeagent/tegoxane
	id = REAGENT_ID_TEGOXANE
	name = REAGENT_TEGOXANE
	description = "Seems like it could render biotic matter incapable of being seen, so long as no large movements are made"
	color = "#7C7D7A"
	var/saved_icon
	var/hair
	var/beard

/datum/reagent/phororeagent/tegoxane/on_mob_life(var/mob/living/M as mob, var/alien)
	if(!saved_icon)
		saved_icon = M.icon //kind of hacky, shouldn't really cause too many problems

	M.icon = 'icons/mob/belt.dmi' //belts because I can

	if(istype(M, /mob/living/carbon/human)) //hair still shows even though you're invisible...
		var/mob/living/carbon/human/H = M
		if(!hair || ((H.h_style != hair) && (H.h_style != "Bald")))
			hair = H.h_style
			spawn(10)
				H.update_hair()
		if(!beard || ((H.f_style != beard) && (H.f_style != "Shaved")))
			beard = H.f_style
			spawn(10)
				H.update_hair()

		H.h_style = "Bald"
		H.f_style = "Shaved"

	if(!M.digitalcamo)
		to_chat(M, span_notice("Your skin starts to feel strange"))
	M.digitalcamo = 1
	return ..()

/datum/reagent/phororeagent/tegoxane/on_remove(var/atom/A)
	if(istype(A, /mob))
		var/mob/M = A
		to_chat(M, span_notice("Your skin feels normal again"))
		M.digitalcamo = 0
		M.icon = saved_icon
		if(istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = M
			if(hair)
				H.h_style = hair
			if(beard)
				H.f_style = beard
			H.update_hair()

/datum/reagent/phororeagent/tegoxane/on_mob_death(var/mob/M)
	M.icon = saved_icon
	M.digitalcamo = 0
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		if(hair)
			H.h_style = hair
		if(beard)
			H.f_style = beard
		H.update_hair()


/datum/reagent/phororeagent/expulsicol
	id = REAGENT_ID_EXPULSICOL
	name = REAGENT_EXPULSICOL
	description = "Structure indicates it could purge living cells of non-essential reagents"
	color = "#8C4C3E"
	var/message_given = 0

/datum/reagent/phororeagent/expulsicol/on_mob_life(var/mob/living/M as mob, var/alien)
	if(!message_given)
		to_chat(M, "You don't feel very good...")
		message_given = 1

		spawn(20)
			if(ishuman(M))
				var/mob/living/carbon/human/H = M

				H.visible_message(span_warning("[H] throws up!"),span_warning("You throw up!"))
				playsound(H.loc, 'sound/effects/splat.ogg', 50, 1)

				var/turf/location = H.loc
				if (istype(location, /turf/simulated))
					location.add_vomit_floor(src, 1)

				H.nutrition -= 40

			for(var/datum/reagent/R in M.reagents.reagent_list)
				if(R.id == src.id)
					continue
				M.reagents.remove_reagent(R.id, R.volume)

			M.reagents.remove_reagent(src.id, src.volume)
/////////////////////////////////////////////////////////////////////

/datum/reagent/phororeagent/oculusosone
	id = REAGENT_ID_OCULUSOSONE
	name = REAGENT_OCULUSOSONE
	description = "Might greatly enhance humanoid eye function"
	color = "#FE9144"
	metabolism = 0.5 * REM

/datum/reagent/phororeagent/oculusosone/on_mob_life(var/mob/living/M as mob, var/alien)
	if(M.client)
		if(M.client.view == 7)
			if(ishuman(M) && !(alien == IS_SLIME))
				//check for mechanical eyes
				var/mob/living/carbon/human/H = M
				var/obj/item/organ/eyes = H.internal_organs_by_name["eyes"]
				if(eyes.status & ORGAN_ROBOT)
					return ..()

			to_chat(M, span_notice("You blink and your eyes quickly adapt to enhanced function."))
			M.client.view = 10
	return ..()

/datum/reagent/phororeagent/oculusosone/on_remove(var/atom/A) //Either this is not getting called, or some such.Not being removed on leave.
	if(istype(A, /mob))
		var/mob/M = A
		if(ishuman(M))
			//check for mechanical eyes
			var/mob/living/carbon/human/H = M
			if(H.get_species() == SPECIES_PROMETHEAN)
				if(M.client)
					M.client.view = 7
					to_chat(M, span_notice("After a few blinks, you realize the Oculusosone has worn off."))
				return ..()
			var/obj/item/organ/eyes = H.internal_organs_by_name["eyes"]
			if(eyes.status & ORGAN_ROBOT)
				return ..()

		if(M.client)
			M.client.view = 7
			to_chat(M, span_notice("After a few blinks, you realize the Oculusosone has worn off."))
	return ..()
//////////////////////////////////////////////////////////////////////////////////

/datum/reagent/phororeagent/destitutionecam
	id = REAGENT_ID_DESTITUTIONECAM
	name = REAGENT_ID_DESTITUTIONECAM
	description = "Under no circumstances should this substance come into contact with dead bodies"
	color = "#5AD92B"

//doesn't do anything, I just like people trying to procure a corpse to test it -DrBrock
/datum/reagent/phororeagent/destitutionecam/touch_mob(var/mob/M, var/volume)
	if(M.stat == 2)
		usr << span_notice("Absolutely nothing happens. You feel disappointed.")
	return ..()

/datum/reagent/phororeagent/sapoformator
	id = REAGENT_ID_SAPOFORMATOR
	name = REAGENT_SAPOFORMATOR
	description = "Enough units splashed on the ground would appear to have great cleaning effects"
	color = "#EEE139"

/datum/reagent/phororeagent/sapoformator/reaction_obj(var/obj/O, var/volume)
	if(istype(O,/obj/effect/decal/cleanable))
		del(O)
	else
		if(O)
			O.clean_blood()

/datum/reagent/phororeagent/sapoformator/touch_turf(var/turf/T, var/volume)
	if(src.holder)
		if(istype(src.holder.my_atom, /obj/effect/effect/water/chempuff))
			if(istype(T, /turf/simulated))
				var/turf/simulated/S = T
				S.dirt = 0
			T.clean_blood()
			for(var/obj/effect/decal/cleanable/C in T.contents)
				src.reaction_obj(C, volume)
				del(C)

	src = null
	if(volume >= 25)
		usr << span_notice("The solution begins to fizzle.")
		playsound(T, 'sound/effects/bamf.ogg', 50, 1)
		var/datum/reagents/cleaner = new()
		cleaner.my_atom = T
		cleaner.add_reagent(REAGENT_ID_CLEANER, 10)
		var/datum/effect/effect/system/foam_spread/soapfoam = new()
		soapfoam.set_up(12, T, cleaner, 0)
		soapfoam.start()
		sleep(50)
		var/list/soaps = typesof(/obj/item/soap)// - /obj/item/soap/fluff/azare_siraj_1
		var/soap_type = pick(soaps)
		var/obj/item/soap/S = new soap_type()
		S.loc = T
		if(volume >= 50)
			volume -= 50
			var/list/tiles = list()
			if(istype(locate(T.x + 1, T.y, T.z), /turf/simulated/floor))
				tiles.Add(locate(T.x + 1, T.y, T.z))
			if(istype(locate(T.x - 1, T.y, T.z), /turf/simulated/floor))
				tiles.Add(locate(T.x - 1, T.y, T.z))
			if(istype(locate(T.x, T.y + 1, T.z), /turf/simulated/floor))
				tiles.Add(locate(T.x, T.y + 1, T.z))
			if(istype(locate(T.x, T.y - 1, T.z), /turf/simulated/floor))
				tiles.Add(locate(T.x, T.y - 1, T.z))

			while(tiles.len > 0 && volume >= 0)
				soap_type = pick(soaps)
				S = new soap_type()
				var/turf/location = pick(tiles)
				tiles.Remove(location)
				S.loc = location
				volume -= 20

	else
		usr << span_notice("The solution does not appear to have enough mass to react.")

/datum/reagent/phororeagent/rad_x
	id = REAGENT_ID_RADX
	name = REAGENT_RADX
	description = "Metabolizes slowly until absorbing radiation damage"
	color = "#64110B"
	metabolism = 0.15
	overdose = 45

/datum/reagent/phororeagent/rad_x/on_mob_life(var/mob/living/M as mob, var/alien)
	var/metabolize = max(M.radiation - 25, 0)
	holder.remove_reagent(src.id, metabolize * 0.025)
	return ..()

/datum/reagent/phororeagent/caloran
	id = REAGENT_ID_CALORAN
	name = REAGENT_CALORAN
	description = "Would grant incredible heat resistance to living organisms with some side effects"
	color = "#C64714"
	metabolism = 5 * REM
	overdose = 20
	var/burn = -1

/datum/reagent/phororeagent/caloran/on_mob_life(var/mob/living/M as mob, var/alien)
	if(volume >= 2)
		if(burn == -1)
			to_chat(M, span_notice("You feel your skin painfully harden."))
			M.take_overall_damage(20, 0)
			burn = M.getFireLoss()
		else
			if(M.getFireLoss() < burn)
				burn = M.getFireLoss()
			else
				M.adjustFireLoss(burn - M.getFireLoss())
		return ..()

/datum/reagent/phororeagent/caloran/on_remove(var/atom/A)
	if(istype(A, /mob))
		var/mob/M = A
		to_chat(M, span_notice("Your skin returns to normal, no longer desensitized to extreme heat."))
	return ..()

/datum/reagent/phororeagent/the_stuff
	id = REAGENT_ID_THESTUFF
	name = REAGENT_THESTUFF
	description = "Looks as though it would metabolize into the ultimate hallucinogenic cocktail"
	color = "#1A979D"
	metabolism = 10 * REM
	var/init = 0

/datum/reagent/phororeagent/the_stuff/on_mob_life(var/mob/living/M as mob, var/alien)
	if(!init)
		to_chat(M, span_warning("You start tripping balls."))
		init = 1
	var/drugs = list(REAGENT_ID_BLISS, REAGENT_ID_SEROTROTIUM, REAGENT_ID_PSILOCYBIN, REAGENT_ID_NUKACOLA, REAGENT_ID_ATOMICBOMB, REAGENT_ID_HIPPIESDELIGHT)
	for(var/drug in drugs)
		M.reagents.add_reagent(drug, 1)
	M.reagents.add_reagent(REAGENT_ID_MINDBREAKER, 0.2)
	return ..()

/datum/reagent/phororeagent/frioline
	id = REAGENT_ID_FRIOLINE
	name = REAGENT_FRIOLINE
	description = "Could cause rapid and sustained decrease in body temperature"
	color = "#A0E1F7"

/datum/reagent/phororeagent/frioline/on_mob_life(var/mob/living/M as mob, var/alien)
	if(M.bodytemperature > 310)
		to_chat(M, span_notice("You suddenly feel very cold."))
	M.bodytemperature = max(165, M.bodytemperature - 30)
	return ..()

/datum/reagent/phororeagent/luxitol
	id = REAGENT_ID_LUXITOL
	name = REAGENT_LUXITOL
	description = "Mimics compounds in known connection with bioluminescence"
	color = "#61E34F"
	metabolism = 0.2 * REM

/datum/reagent/phororeagent/luxitol/on_mob_life(var/mob/living/M as mob, var/alien)
	M.set_light(10)
	return ..()

/datum/reagent/phororeagent/luxitol/on_remove(var/atom/A)
	if(istype(A, /mob))
		var/mob/M = A
		M.set_light(0)
	return ..()

/datum/reagent/phororeagent/liquid_skin
	id = REAGENT_ID_LIQUIDSKIN
	name = REAGENT_LIQUIDSKIN
	description = "Fills in microscopic ridges on biotic surfaces and hardens"
	color = "#F7E9BE"

/datum/reagent/phororeagent/liquid_skin/touch_mob(var/mob/M, var/volume)
	if(istype(M, /mob/living))
		var/mob/living/L = M
		var/burned = L.getFireLoss() > 0
		if(burned)
			L << span_notice("In a strange sensation, you feel some burns stop hurting.")
			L.heal_organ_damage(0, min(15, volume / 4))

		if (mFingerprints in L.mutations)
			if(!burned)
				L << span_warning("Another application of the substance does nothing weird to your hands.")
		else
			L.mutations.Add(mFingerprints)
			L << span_notice("Your fingers feel strange after the substance splashes on your hands.")
	return ..()

/datum/reagent/phororeagent/energized_phoron
	id = REAGENT_ID_ENERGIZEDPHORON
	name = REAGENT_ENERGIZEDPHORON
	description = "Creates an unstable electrical field between molecules"
	color = "#F5EF38"

/datum/reagent/phororeagent/energized_phoron/initial_reaction(var/obj/item/reagent_containers/container, var/turf/T, var/volume, var/message)
	empulse(T, round(volume / 8), round(volume / 5), 1)
	src = null
	spawn(1)
		container.reagents.clear_reagents()
	return "You shoved extreme electricity into phoron, what did you expect?"

/datum/reagent/phororeagent/energized_phoron/on_transfer(var/volume)
	initial_reaction(src.holder, src.holder.my_atom, volume, null)
	return 0

/datum/reagent/phororeagent/induromol
	id = REAGENT_ID_INDUROMOL
	name = REAGENT_INDUROMOL
	description = "Please inform DrBrock of this description being viewed"
	color = "#C6C6C6"
	reagent_state = LIQUID
	metabolism = 0 //does nothing but wait until the time is ready

/datum/reagent/phororeagent/induromol/New()
	var/freq = "[copytext(num2text(induromol_frequency), 1, 4)].[copytext(num2text(induromol_frequency), 4, 5)]"
	description = "Hardens in response to electromagnetic waves, especially frequency [freq] and code [induromol_code]"
	..()

/datum/reagent/phororeagent/induromol/on_mob_life(var/mob/living/M as mob)
	if(reagent_state == SOLID)
		var/mob/living/carbon/human/H = M
		for(var/obj/item/organ/O in H.internal_organs)
			var/silent = 1
			if(prob(3)) //needs low percentage or spams chat with pain messages
				silent = 0
			O.take_damage(1, silent)

	..()
//implementation also in communcations.dm

/datum/reagent/phororeagent/obscuritol
	id = REAGENT_ID_OBSCURITOL
	name = REAGENT_OBSCURITOL
	description = "Exhibits strange electromagnetic properties"
	color = "#5D505E"

/datum/reagent/phororeagent/obscuritol/initial_reaction(var/obj/item/reagent_containers/container, var/turf/T, var/volume, var/message)
	var/obj/machinery/light/L
	for(var/obj/machinery/light/light in orange(3, T))
		if(light.status != 2) //LIGHT_BROKEN
			L = light
			break

	if(L)
		L.broken()

	for(var/obj/machinery/light/light in orange(6, T))
		light.flicker(rand(5, 10))
	return "Abnormal electromagnetic pulses detected, machinery recalibrated."

/datum/reagent/phororeagent/obscuritol/touch_turf(var/turf/T, var/volume) //-round(-x) = Ceiling(x)
	for(var/obj/machinery/light/light in orange(-round(-1 * (volume / 10)), T))
		light.broken()

	for(var/obj/machinery/light/light in orange(-round(-1 * (volume / 6)), T))
		light.flicker()

/datum/reagent/phororeagent/tartrate
	id = REAGENT_ID_TARTRATE
	name = REAGENT_TARTRATE
	description = "Mix with enough Aluminum Nitrate for tasty results!"
	color = "#EA67B1"
	//OVENLESS BROWNIES! Shameless Rick and Morty references!

/datum/reagent/phororeagent/oxyphoromin
	id = REAGENT_ID_OXYPHOROMIN
	name = REAGENT_OXYPHOROMIN
	description = "Extreme painkiller derived of Oxycodone, dangerous in high doses"
	color = "#540E5C"
	metabolism = 5 * REM
	overdose = 15

/datum/reagent/phororeagent/oxyphoromin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.add_chemical_effect(CE_PAINKILLER, 600)
	M.eye_blurry = min(M.eye_blurry + 10, 250)
	M.Confuse(5)

/datum/reagent/phororeagent/oxyphoromin/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.druggy = max(M.druggy, 60)
	M.hallucination = max(M.hallucination, 3)

/*
//Temporarily disabled till map is complete. Need to adjust coordinates to reflect safe and unsafe XYZ.
/datum/reagent/phororeagent/liquid_bluespace
	id = REAGENT_ID_LIQUIDBLUESPACE
	name = REAGENT_LIQUIDBLUESPACE
	description = "Appears to bend local spacetime around the container"
	color = "#4ECBF5"
	metabolism = 0
	var/initial_time = 0

/datum/reagent/phororeagent/liquid_bluespace/on_mob_life(var/mob/living/M as mob)
	if(!initial_time)
		initial_time = world.time

	if(world.time - initial_time >= 30) //three second startup lag
		if(!metabolism)
			metabolism = 1
			to_chat(M, span_notice("You begin to feel transcendental."))

		if(M.z > 5 || M.z == 2 || M.z < 1) //no centcomm teleport, also not dealing with other unknown sectors
			to_chat(M, span_warning("You feel the bluespace leave your body on this sector, nothing happens."))
			src = null
			return

		var/valid_location = 0
		var/x = 0
		var/y = 0
		var/z = 0

		do
			var/list/params //list(x min, x max, y min, y max, sector)
			switch(M.z)
				if(1)
					params = list(95, 209, 76, 246, 1) //main station
				if(3)
					params = list(113, 141, 110, 143, 3) //telecomms station
				if(4)
					params = list(58, 95, 34, 80, 4) //engineering outpost
				if(5)
					if(prob(50))
						params = list(35, 73, 89, 120, 5) //mining station
					else
						params = list(65, 99, 121, 182, 5) //research station

			x = rand(params[1], params[2])
			y = rand(params[3], params[4])
			z = params[5]

			var/turf/new_loc = locate(x, y, z)
			//ensure they don't land inside rock unless on mining asteroid
			valid_location = (!istype(new_loc, /turf/simulated/mineral) || z == 5 || z == 4)
		while(!valid_location)

		M.x = x
		M.y = y
		M.z = z

		if(prob(33))
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(3, 1, get_turf(M))
			s.start()
	..()

/datum/reagent/phororeagent/liquid_bluespace/on_remove(var/atom/A)
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = A
		H.vomit()
*/
/datum/reagent/phororeagent/gaseous
	reagent_state = GAS

/datum/reagent/phororeagent/gaseous/initial_reaction(var/obj/item/reagent_containers/container, var/turf/T, var/volume, var/message)
	var/datum/effect/effect/system/smoke_spread/chem/effect = new/datum/effect/effect/system/smoke_spread/chem()
	var/datum/reagents/R = new/datum/reagents()
	R.my_atom = container
	R.add_reagent(src.id, volume)
	effect.set_up(R, 17, 0, T, 0)
	effect.start()
	spawn(1)
		container.reagents.clear_reagents()
	return ..()

/datum/reagent/phororeagent/gaseous/on_transfer(var/volume)
	initial_reaction(src.holder, src.holder.my_atom, volume, null)
	return 0

/datum/reagent/phororeagent/gaseous/gaseous_death
	id = REAGENT_ID_GASEOUSDEATH
	name = REAGENT_GASEOUSDEATH
	description = "Full eradication of living matter, lethally toxic!"
	color = "#000000"

/datum/reagent/phororeagent/gaseous/gaseous_death/touch_turf(var/turf/T)
	var/mob_affected = 0
	for(var/mob/living/L in T.contents)
		mob_affected = 1
		if(istype(L, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = L
			if(!gaseous_reagent_check(H) && H.stat != 2) //protective clothing and living check
				H << span_boldwarning("You realize you probably should have worn some safety equipment around dangerous chemicals.")
				H.death(0)
		else if(!istype(L, /mob/living/silicon))
			L.death(0)

	if(mob_affected)
		src = null
/*
/datum/reagent/phororeagent/gaseous/gaseous_death/touch_mob(var/mob/M, var/volume)
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		if(!gaseous_reagent_check(H) && H.stat != 2) //protective clothing and living check
			H << span_boldwarning("You realize you probably should have worn some safety equipment around dangerous chemicals.")
			H.death(0)
	else if(!istype(M, /mob/living/silicon))
		M.death(0)
	src = null*/

/datum/reagent/phororeagent/gaseous/occaecosone
	id = REAGENT_ID_OCCAECOSONE
	name = REAGENT_OCCAECOSONE
	description = "Would react very negatively with proteins in biotic eyes"
	color = "#213E73"

//chemsmoke no longer affects mobs because reasons, this sort of hacky workaround must be used for the same effect -DrBrock
/datum/reagent/phororeagent/gaseous/occaecosone/touch_turf(var/turf/T)
	var/mob_affected = 0
	for(var/mob/living/L in T.contents)
		mob_affected = 1
		if(istype(L, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = L
			if(!gaseous_reagent_check(H)) //protective clothing check
				var/obj/item/organ/eyes = H.internal_organs_by_name["eyes"]
				if(!(eyes.status & ORGAN_ROBOT))
					eyes.take_damage(50)
					H << span_boldwarning("The gas stings your eyes like you have never felt before!")
		else if(!istype(L, /mob/living/silicon))
			L.eye_blind = 500

	if(mob_affected)
		src = null

/*
/datum/reagent/phororeagent/gaseous/occaecosone/touch_mob(var/mob/M, var/volume)
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		if(!gaseous_reagent_check(H)) //protective clothing check
			var/obj/item/organ/eyes = H.internal_organs_by_name["eyes"]
			if(!(eyes.status & ORGAN_ROBOT))
				eyes.take_damage(50)
				H << span_boldwarning("The gas stings your eyes like you have never felt before!")
	else if(!istype(M, /mob/living/silicon))
		M.eye_blind = 500
	src = null*/


//It is POSSIBLE but very hard to "stop, drop, and roll" out the fire from an unprotected ignisol encounter before going into crit
//I really just like the idea of scientists running out of a lab on fire to the science shower - DrBrock
/datum/reagent/phororeagent/gaseous/ignisol
	id = REAGENT_ID_IGNISOL
	name = REAGENT_IGNISOL
	description = "Creates highly flammable reaction with biotic substances"
	color = "#F78431"

//chemsmoke no longer affects mobs because reasons, this sort of hacky workaround must be used for the same effect -DrBrock
/datum/reagent/phororeagent/gaseous/ignisol/touch_turf(var/turf/T)
	var/mob_affected = 0
	for(var/mob/living/L in T.contents)
		mob_affected = 1
		if(istype(L, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = L
			if(!gaseous_reagent_check(H)) //protective clothing check
				H.on_fire = 1
				H.adjust_fire_stacks(20)
				H.update_fire()
		else
			if(!istype(L, /mob/living/silicon))
				L.on_fire = 1
				L.adjust_fire_stacks(20)

	if(mob_affected)
		src = null

/*/datum/reagent/phororeagent/gaseous/ignisol/touch_mob(var/mob/M, var/volume)
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		if(!gaseous_reagent_check(H)) //protective clothing check
			H.on_fire = 1
			H.adjust_fire_stacks(20)
			H.update_fire()
	else
		if(istype(M, /mob/living) && !istype(M, /mob/living/silicon))
			var/mob/living/L = M
			L.on_fire = 1
			L.adjust_fire_stacks(20)
	src = null*/

/*
Everything put here is either broken, potentially impossible to implement without major changes to many .dm files,
not yet finished to a satisfactory degree, or I just don't like it enough to keep it in

/datum/reagent/acid/phoronic_acid //I don't like this one, far too powerful in a smoke grenade
	name = REAGENT_PHORONICACID
	id = REAGENT_ID_PHORONICACID
	description = "Violently corrosive substance, large volumes could potentially breach hull"
	color = "#CDEB0C"
	power = 12
	meltdose = 5

	reaction_turf(var/turf/T, var/volume) //can't melt space, centcomm walls, or shuttles
											//maybe make work off explosion resistance?
		if(!istype(T, /turf/space) && !istype(T, /turf/unsimulated/wall) && !istype(T.loc, /area/shuttle) \
		&& !istype(T.loc, /area/supply/station)) //TODO: Deal with bluespace tiles
			src = null //ensure sleep proc doesn't return upon completion
			if(volume <= 10)
				return
			for(var/mob/M in viewers(7, T))
				to_chat(M, "<font color="green">You hear sizzling as the solution begins to eat away the [T.name].</font>")
			sleep(30)
			if(volume >= 50)
				for(var/mob/M in viewers(7, T))
					to_chat(M, "<font color="green">The acid melts through the [T.name]!</font>")

				if(istype(T, /turf/simulated/wall))
					for(var/obj/O in T.contents) //Shamelessly stolen from walls.dm
						if(istype(O,/obj/structure/sign/poster))
							var/obj/structure/sign/poster/P = O
							P.roll_and_drop(T)
						else
							O.loc = T
					T.ChangeTurf(/turf/simulated/floor/plating)
				else
					T.ChangeTurf(/turf/space)
				//del(src)
			else
				for(var/mob/M in viewers(7, T))
					to_chat(M, "<font color="green">The sizzling stops leaving the floor intact.</font>")
		return

	reaction_obj(var/obj/O, var/volume)
		if(istype(O, /obj/machinery) || istype(O, /obj/structure))
			src = null //ensure sleep proc doesn't return upon completion
			if(volume <= 10)
				return
			for(var/mob/M in viewers(7, O))
				to_chat(M, "<font color="green">You hear sizzling as the solution begins to eat away the [O.name].</font>")
			sleep(30)
			if(volume >= 50)
				for(var/mob/M in viewers(7, O))
					to_chat(M, "<font color="green">The acid melts through the [O.name]!</font>")
				del(O)
			else
				for(var/mob/M in viewers(7, O))
					to_chat(M, "<font color="green">The sizzling stops leaving the floor intact.</font>")
		else
			return ..()

nocturnol //Should give night vision, does not seem to work using this method of implementation
	id = REAGENT_ID_NOCTURNOL
	name = REAGENT_NOCTURNOL
	description = "Reagent bears strong resemblance to enzymes found in feline eyes"
	color = "#61E34F"

	on_mob_life(var/mob/living/M as mob, var/alien)
		M.see_in_dark = 50
		return ..()

	on_remove(var/atom/A)
		if(istype(A, /mob/living/carbon))
			var/mob/living/carbon/human/H = A
			H.see_in_dark = H.species.darksight
		else
			if(istype(A, /mob))
				var/mob/M = A
				M.see_in_dark = 2
		return ..()
*/
