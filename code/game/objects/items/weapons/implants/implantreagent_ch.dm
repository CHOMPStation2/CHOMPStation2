/obj/item/implant/reagent_generator/egg
	name = "regular egg laying implant"
	desc = "This is an implant that allows the user to lay eggs."
	generated_reagents = list("egg" = 2)
	usable_volume = 1500
	transfer_amount = 300
	var/verb_descriptor = list("squeezes", "pushes", "hugs")
	var/self_verb_descriptor = list("squeeze", "push", "hug")
	var/short_emote_descriptor = list("lays", "forces out", "pushes out")
	self_emote_descriptor = list("lay", "force out", "push out")
	random_emote = list("lets out an embarrassed moan", "yelps in embarrassment", "quietly groans in a mixture of discomfort and pleasure")
	assigned_proc = /mob/living/carbon/human/proc/use_reagent_implant_egg
	var/eggtype = /obj/item/reagent_containers/food/snacks/egg
	var/cascade

/obj/item/implant/reagent_generator/egg/post_implant(mob/living/carbon/source)
	START_PROCESSING(SSobj, src)
	to_chat(source, "<span class='notice'>You implant [source] with \the [src].</span>")
	add_verb(source,assigned_proc) //CHOMPEdit TGPanel
	add_verb(source,/mob/living/carbon/human/proc/toggle_cascade) //CHOMPEdit TGPanel
	return 1

/mob/living/carbon/human/proc/use_reagent_implant_egg()
	set name = "Force Someone Adjacent To Lay An Egg, If Applicable!"
	set desc = "Force someone adjacent to lay an egg by squeezing into their lower body! Whilst their reaction may vary, this is certainly going to overwhelm them for a moment!"
	set category = "Object"
	set src in view(1)
	//do_reagent_implant(usr)
	if(!isliving(usr) || !usr.checkClickCooldown())
		return

	if(usr.incapacitated() || usr.stat > CONSCIOUS)
		return

	var/obj/item/implant/reagent_generator/egg/rimplant
	for(var/obj/item/organ/external/E in organs)
		for(var/obj/item/implant/I in E.implants)
			if(istype(I, /obj/item/implant/reagent_generator))
				rimplant = I
				break

	rimplant.empty_message = list("Your lower belly feels smooth and empty, clearly there are no eggs left to be had!", "The reduced pressure in your lower belly tells you there are no eggs left, for now...")
	rimplant.full_message = list("Your lower belly is a bit bloated, possessing a mildly bumpy texture if pressed against...", "Your lower abdomen feels really heavy, making it a bit hard to walk.")
	rimplant.emote_descriptor = list("an egg right out of [src]'s lower belly!", "into [src]'s belly firmly, forcing them to lay an egg!", "[src] really tight, who promptly lays an egg!")

	if(rimplant.reagents.total_volume >= rimplant.usable_volume*0.75)
		if(usr != src)
			to_chat(usr, "<span class='notice'>[src] is very full on eggs, squeezing them now may result in a cascade!</span>")
		to_chat(src, "<span class='notice'>[pick(rimplant.full_message)]</span>")

	if(rimplant.reagents.total_volume <= rimplant.transfer_amount)
		if(usr != src)
			to_chat(usr, "<span class='notice'>It seems that [src] is out of eggs!</span>")
		to_chat(src, "<span class='notice'>[pick(rimplant.empty_message)]</span>")
		return
	visible_message("<span class='danger'>[usr] starts squeezing [src]'s lower body firmly...</span>")
	if (rimplant && do_after(usr,120,src))
		if(src.Adjacent(usr))
			var/egg = rimplant.eggtype
			new egg(get_turf(src))
			src.SetStunned(3)
			playsound(src,'sound/vore/insert.ogg',50,1)
			var/index = rand(1,3)

			if (usr != src)
				var/emote = rimplant.emote_descriptor[index]
				var/verb_desc = rimplant.verb_descriptor[index]
				var/self_verb_desc = rimplant.self_verb_descriptor[index]
				visible_message("<span class='notice'>[usr] [verb_desc] [emote]</span>",
								"<span class='notice'>You [self_verb_desc] [emote]</span>")
			else
				visible_message("<span class='notice'>[src] [pick(rimplant.short_emote_descriptor)] an egg.</span>",
									"<span class='notice'>You [pick(rimplant.self_emote_descriptor)] an egg.</span>")

			if(prob(15))
				visible_message("<span class='notice'>[src] [pick(rimplant.random_emote)].</span>")
			rimplant.reagents.remove_any(rimplant.transfer_amount)

			if(rimplant.cascade)
				to_chat(src, "<span class='notice'>You feel your legs quake as your muscles fail to stand strong!</span>")
				while(rimplant.reagents.total_volume >= rimplant.transfer_amount)
					if(do_after(src,30))
						src.SetStunned(3)
						playsound(src,'sound/vore/insert.ogg',50,1)
						src.apply_effect(10,STUTTER,0)
						new egg(get_turf(src))
						rimplant.reagents.remove_any(rimplant.transfer_amount)
						if(prob(25))
							visible_message("<span class='notice'>[src] [pick(rimplant.random_emote)].</span>")
		else
			return
/mob/living/carbon/human/proc/toggle_cascade()

	set name = "Toggle cascading"
	set desc = "Toggle whether or not being forced to lay an egg will cause you to lay all others as well, in rapid succession"
	set category = "Object"

	var/obj/item/implant/reagent_generator/egg/rimplant
	for(var/obj/item/organ/external/E in organs)
		for(var/obj/item/implant/I in E.implants)
			if(istype(I, /obj/item/implant/reagent_generator))
				rimplant = I
				break

	if(rimplant.cascade)
		rimplant.cascade = 0
		to_chat(src, "<span class='notice'>You toggle cascading off</span>")
	else
		rimplant.cascade = 1
		to_chat(src, "<span class='notice'>You toggle cascading on</span>")


/obj/item/implant/reagent_generator/egg/slow
	name = "slow egg laying implant"
	usable_volume = 3000
	transfer_amount = 600

/obj/item/implant/reagent_generator/egg/veryslow
	name = "very slow egg laying implant"
	usable_volume = 6000
	transfer_amount = 1200

/obj/item/implant/reagent_generator/egg/hicap
	name = "high capacity egg laying implant" // Note that the capacity does not affect the regeneration rate, rather, the transfer amount does
	usable_volume = 3000 // Effectively, the transfer_amount is the cost/time of making an egg. Usable volume is simply the max number of eggs.
	transfer_amount = 300

/obj/item/implant/reagent_generator/egg/doublehicap
	name = "extreme capacity egg laying implant"
	usable_volume = 6000
	transfer_amount = 300

/obj/item/implant/reagent_generator/egg/slowlowcap
	name = "slow, low capacity egg laying implant"
	usable_volume = 3000
	transfer_amount = 3000

/obj/item/implant/reagent_generator/egg/veryslowlowcap
	name = "very slow, low capacity egg laying implant"
	usable_volume = 6000
	transfer_amount = 6000
