//succuby bite is back baby
/mob/living/proc/succubus_bite()
	set name = "Inject Prey"
	set desc = "Bite prey and inject them with various toxins."
	set category = "Abilities.Succubus" //CHOMPEdit

	if(last_special > world.time)
		return

	if(!ishuman(src))
		return //If you're not a human you don't have permission to do this.

	var/mob/living/carbon/human/C = src

	var/obj/item/grab/G = src.get_active_hand()

	if(!istype(G))
		to_chat(C, "<span class='warning'>You must be grabbing a creature in your active hand to bite them.</span>")
		return

	var/mob/living/carbon/human/T = G.affecting

	if(!istype(T) || T.isSynthetic())
		to_chat(src, "<span class='warning'>\The [T] is not able to be bitten.</span>")
		return

	if(G.state != GRAB_NECK)
		to_chat(C, "<span class='warning'>You must have a tighter grip to bite this creature.</span>")
		return

	var/choice = input(src, "What do you wish to inject?") as null|anything in list("Aphrodisiac", "Numbing", "Paralyzing")

	last_special = world.time + 600

	if(!choice)
		return

	src.visible_message(span_red("<b>[src] moves their head next to [T]'s neck, seemingly looking for something!</b>"))

	if(do_after(src, 300, T)) //Thrirty seconds.
		if(choice == "Aphrodisiac")
			src.show_message("<span class='warning'>You sink your fangs into [T] and inject your aphrodisiac!</span>")
			src.visible_message(span_red("[src] sinks their fangs into [T]!"))
			T.bloodstr.add_reagent("succubi_aphrodisiac",100)
			return 0
		else if(choice == "Numbing")
			src.show_message("<span class='warning'>You sink your fangs into [T] and inject your poison!</span>")
			src.visible_message(span_red("[src] sinks their fangs into [T]!"))
			T.bloodstr.add_reagent("numbing_enzyme",20) //Poisons should work when more units are injected
		else if(choice == "Paralyzing")
			src.show_message("<span class='warning'>You sink your fangs into [T] and inject your poison!</span>")
			src.visible_message(span_red("[src] sinks their fangs into [T]!"))
			T.bloodstr.add_reagent("succubi_paralize",20) //Poisons should work when more units are injected
		else
			return //Should never happen

/* //will maybe add something one day
mob/living/carbon/proc/charmed() //TODO
	charmed = 1
	spawn(0)
		for(var/i = 1,i > 0, i--)
			src << "<font color='#6F6FE2'><i>... [pick(charmed)] ...</i></font>"
		charmed = 0
*/

/datum/reagent/succubi_aphrodisiac
	name = "Aphrodisiac"
	id = "succubi_aphrodisiac"
	description = "A unknown liquid, it smells sweet"
	metabolism = REM * 0.8
	color = "#8A0829"
	scannable = 0

/datum/reagent/succubi_aphrodisiac/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(3))
		M.show_message("<span class='warning'>You feel funny, and fall in love with the person in front of you</span>")
		M.say(pick("!blushes", "!moans", "!giggles", "!turns visibly red")) //using mob say so we dont have to define this dumb one time use emote that equates to just blushing -shark
		//M.charmed() //TODO
	return

/datum/reagent/succubi_numbing //Using numbing_enzyme instead.
	name = "Numbing Fluid"
	id = "succubi_numbing"
	description = "A unknown liquid, it doesn't smell"
	metabolism = REM * 0.5
	color = "#41029B"
	scannable = 0

/datum/reagent/succubi_numbing/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)


	M.eye_blurry = max(M.eye_blurry, 10)
	M.Weaken(2)
	M.drowsyness = max(M.drowsyness, 20)
	if(prob(7))
		M.show_message("<span class='warning'>You start to feel weakened, your body seems heavy.</span>")
	return

/datum/reagent/succubi_paralize
	name = "Paralyzing Fluid"
	id = "succubi_paralize"
	description = "A unknown liquid, it doesn't smell"
	metabolism= REM * 0.5
	color = "#41029B"
	scannable = 0

/datum/reagent/succubi_paralize/affect_blood(var/mob/living/carbon/M, var/alien, var/removed) //will first keep it like that.  lets see what it changes. if nothing, than I will rework the effect again

	M.Weaken(20)
	M.eye_blurry = max(M.eye_blurry, 10)
	if(prob(10))
		M.show_message("<span class='warning'>You lose sensation of your body.</span>")
	return


//egglaying
var/eggs = 0


/mob/living/proc/mobegglaying()
	set name = "Egg laying"
	set desc = "you can lay Eggs"
	set category = "Abilities.General" //CHOMPEdit

	var/mob/living/carbon/human/C = src

	if(last_special > world.time)
		return

	var/choice = input(src, "What do you want to do?") as null|anything in list("Make a Egg", "lay your Eggs")
	last_special = world.time + 600

	if(!choice)
		return

	if(do_after(src, 300)) //Thrirty seconds.
		if(choice == "Make a Egg")
			src.show_message("<span class='warning'>You feel your belly bulging a bit, you made an egg!</span>")
			C.nutrition -=150
			eggs += 1
			return 0
		else if(choice == "Make a Egg" && eggs > 5)
			src.show_message("<span class='warning'>Your Belly is full of Eggs you cant have more!!</span>")
			return 0
		else if(choice == "lay your Eggs" && eggs > 0)
			src.visible_message(span_white("<b>[src] freezes and vissibly tries to squat down</b>"))

			while(eggs > 0)
				src.show_message("<span class='warning'>You lay a egg!</span>")
				eggs--
				var/obj/item/reagent_containers/food/snacks/egg/E = new(get_turf(src))
				E.pixel_x = rand(-6,6)
				E.pixel_y = rand(-6,6)
			return
		else
			src.visible_message("<span class='warning'>you dont have any eggs!</span>")
			return //Should never happen

/*
	if(layeggs == 1)
		src.visible_message("<font color='white'><b>[src] freezes and vissibly tries to squat down</b></font>")

	while(eggs > 0)
		src.show_message("<span class='warning'>You lay you egg!</span>")
		eggs--
		var/obj/item/reagent_containers/food/snacks/egg/E = new(get_turf(src))
		E.pixel_x = rand(-6,6)
		E.pixel_y = rand(-6,6)
	layeggs--

	return
*/

/mob/living/proc/insect_sting()
	set name = "Insect Sting"
	set desc = "Sting a target and inject a small amount of toxin"
	set category = "Abilities.General" //CHOMPEdit

	if(last_special > world.time)
		return

	var/list/victims = list()
	for(var/mob/living/carbon/C in oview(1))
		victims += C
	var/mob/living/carbon/T = input(src, "Who will we sting?") as null|anything in victims

	if(!T)
		return
	if(T.isSynthetic())
		to_chat(src, "<span class='notice'>We are unable to pierce the outer shell of [T].</span>")
		return

	to_chat(src, "<span class='notice'>You jab your stinger into [T].</span>")
	to_chat(T, "<span class='danger'>You feel a stabbing pain as you are stung!</span>")
	src.visible_message(span_red("[src] sinks their stinger into [T]!"))
	T.bloodstr.add_reagent("condensedcapsaicin_v",3)
	last_special = world.time + 50 // Many little jabs instead of one big one
