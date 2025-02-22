///////////////////////////////////////////////
/////////////////// Stage 1 ///////////////////

/datum/disease2/effect/cat
	name = "Acute Tajitis"
	stage = 1
	chance_maxm = 10

/datum/disease2/effect/cat/activate(var/mob/living/carbon/mob,var/multiplier)
	mob.say("[pick("Meow.","*meow","*mrow","*mgeow")]")

/datum/disease2/effect/choreomania
    name = "Choreomania"
    stage = 1
    chance_maxm = 12
    var/list/dance = list(2,4,8,2,4,8,2,4,8,2,4,8,1,4,1,4,1,4,2,4,8,2)

/datum/disease2/effect/choreomania/activate(mob/living/carbon/mob, multiplier)

	if(prob(25))
		to_chat(mob, span_notice("You feel [pick("like dancing like a maniac, maniac...", "the need to chick chicky boom...")]"))

	if(prob(60))
		if(mob.buckled())
			mob.emote("whistle")
			to_chat(viewers(mob), span_warning("[mob.name] taps their foot rhythmically!"))
		else
			to_chat(viewers(mob),span_warning("[mob.name] dances uncontrollably!"))

			if(prob(30))
				to_chat(mob, span_warning("You feel like starting a conga line!"))
				for(var/mob/living/carbon/M in oview(2,mob))
					mob.spread_disease_to(M)

			for(var/D in dance)
				mob.dir = D
				animate(mob, pixel_x = 5, time = 5)
				sleep(3)
				animate(mob, pixel_x = -5, time = 5)
				animate(pixel_x = mob.default_pixel_x, pixel_y = mob.default_pixel_x, time = 2)
				sleep(3)

/datum/disease2/effect/pica
	name = "Pica"
	stage = 1
	chance_maxm = 10

/datum/disease2/effect/pica/activate(mob/living/carbon/mob, multiplier)
	if(prob(20))
		var/list/nearby = oview(5, mob)
		to_chat(mob, span_warning("You could go for a bite of [pick(nearby)]..."))
	else if (prob(20))
		var/list/item = mob.get_equipped_items()
		to_chat(mob, span_warning("[pick(item)] looks oddly [pick("delicious", "tasty", "scrumptious", "inviting")]..."))

///////////////////////////////////////////////
/////////////////// Stage 2 ///////////////////

/datum/disease2/effect/jellylegs
	name = "Jelly Legs"
	stage = 2
	chance_maxm = 5

/datum/disease2/effect/jellylegs/activate(var/mob/living/carbon/mob,var/multiplier)
	to_chat(mob, span_notice("Your body seems to lose balance!"))
	mob.slip("yourself.")

/datum/disease2/effect/morgellon
	name = "Morgellon's Disease"
	stage = 2
	chance_maxm = 7

/datum/disease2/effect/morgellon/activate(var/mob/living/carbon/mob,var/multiplier)
	if(prob(65))
		var/obj/item/organ/external/O = pick(mob.organs)
		to_chat(mob, span_warning("Your [O.name] [pick(" itches slightly...", " stings!")]"))
	else if(prob(30))
		to_chat(mob, span_notice("You feel [pick("something crawling under your skin.","little legs on you.")]"))
	else
		var/obj/effect/spider/spiderling/S = new(get_turf(mob))
		S.amount_grown = -1
