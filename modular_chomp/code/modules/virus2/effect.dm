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

	switch(stage)
		if(1)
			if(prob(20))
			to_chat(mob, "<span class='warning'>You feel [pick("like dancing like a maniac, maniac...", "the need to chick chicky boom...")]</span>")

		if(2)
			if(prob(75))
				if(mob.buckled())
					mob.emote("whistle")
					to_chat(viewers(mob), "<span class='warning'>[mob.name] taps their foot rhythmically!</span>")
				else
					to_chat(viewers(mob),"<span class='warning'>[mob.name] dances uncontrollably!</span>")
					for(var/D in dance)
						mob.dir = D
						animate(mob, pixel_x = 5, time = 5)
						sleep(3)
						animate(mob, pixel_x = -5, time = 5)
						animate(pixel_x = mob.default_pixel_x, pixel_y = mob.default_pixel_x, time = 2)
						sleep(3)


///////////////////////////////////////////////
/////////////////// Stage 2 ///////////////////

/datum/disease2/effect/jellylegs
	name = "Jelly Legs"
	stage = 2
	chance_maxm = 5

/datum/disease2/effect/jellylegs/activate(var/mob/living/carbon/mob,var/multiplier)
	to_chat(mob, "<span class='notice'>As you step forward, your body loses balance...</span>")
	mob.slip("yourself.")
