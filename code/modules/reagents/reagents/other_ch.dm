//Misc stuff.

//LIQUID EGG
/datum/reagent/liquidspideregg
	name = REAGENT_SPIDEREGG
	id = REAGENT_ID_SPIDEREGG
	description = "These are eggs, spiders crawl out of these.. probably not healthy inside of a person."
	taste_description = "SO MANY LEGS"
	reagent_state = LIQUID
	color = "#FFFFFF"
	overdose = REAGENTS_OVERDOSE * 100
	metabolism = REM * 0.1
	scannable = 1
	var/amount_grown = 0
	var/min_growth = 0
	var/max_growth = 2
	var/spiders_min = 6
	var/spiders_max = 24
	var/spider_type = /obj/effect/spider/spiderling

/datum/reagent/liquidspideregg/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(1))
		M.custom_pain("You can feel movement within your body!",45)
	amount_grown += rand(min_growth,max_growth)
	if(amount_grown >= 100)
		min_growth++
		max_growth++
		amount_grown = 0
		var/num = rand(spiders_min, spiders_max)
		var/obj/item/organ/external/O = null
		if(istype(M.loc, /obj/item/organ/external))
			O = M.loc

		for(var/i=0, i<num, i++)
			var/spiderling = new spider_type(M.loc, M)
			if(O)
				O.implants += spiderling

/datum/reagent/nutriment/pitcher_nectar //Pitcher plant reagent, doubles plant growth speed.
	name = REAGENT_ID_PITCHERNECTAR
	id = REAGENT_ID_PITCHERNECTAR
	description = "An odd, sticky slurry which promotes rapid plant growth."
	taste_description = "pineapple"
	reagent_state = LIQUID
	nutriment_factor = 60
	color = "#a839a2"

//New reagent definitions/overrides. If some of these get added upstream and cause a conflict later they might need deleting.
/datum/reagent/toxin/plantbgone/touch_mob(var/mob/living/L, amount) //Plantbgone override to damage plant mobs. Part of pitcher plants, touch_mob doesn't exist for plantbgone at the time of writing.
	if(istype(L) && L.faction)
		if(L.faction == "plants") //This would be better with a variable but I'm not adding that because upstream conflicts. If you send this upstream please do this.
			L.adjustToxLoss(15 * amount)
			L.visible_message(span_warning("[L] withers rapidly!"), span_danger("The chemical burns you!"))

//////SAP IN UNREFINED FORM////

/datum/reagent/toxin/bluesap //This is the first sap. Blue one.
	name = REAGENT_BLUESAP
	id = REAGENT_ID_BLUESAP
	description = "Glowing blue liquid."
	reagent_state = LIQUID
	color = "#91f9ff" // rgb(145, 249, 255)
	metabolism = 0.01
	strength = 10//Don't drink it
	mrate_static = TRUE

/datum/reagent/purplesap
	name = REAGENT_ID_PURPLESAP
	id = REAGENT_PURPLESAP
	description = "Purple liquid. It is very sticky and smells of ammonia."
	color = "#7a48a0"
	taste_description = "Ammonia"

/datum/reagent/orangesap
	name = REAGENT_ORANGESAP
	id = REAGENT_ID_ORANGESAP
	description = "Orange liquid. It wobbles around a bit like jelly."
	color = "#e0962f"
	taste_description = "Ammonia"

//YW stuff

/datum/reagent/benzilate
	name = REAGENT_BENZILATE
	id = REAGENT_ID_BENZILATE
	description = "Grey... goo? This smells like hot acid. Consuming this likely wouldn't be good for your health."
	taste_description = "raw iron"
	taste_mult = 0.4
	metabolism = REM * 2.5
	color = "#929292"

/datum/reagent/phenethylamine
	name = REAGENT_PHENETHYLAMINE
	id = REAGENT_ID_PHENETHYLAMINE
	description = "Just looking at this makes you feel odd. Whether or not this would be good to consume is likely a gamble."
	color = "#463667"
	data = list("count"=1)
/datum/reagent/phenethylamine/on_mob_life(var/mob/living/M as mob)
	if(!M) M = holder.my_atom
	if(data)
		switch(data["count"])
			if(1 to 30)
				if(prob(9)) M.visible_emote("blushes")
				if(prob(9)) to_chat(M, span_warning("You feel so needy.."))
			if (30 to INFINITY)
				if(prob(3)) M.visible_emote("blushes")
				if(prob(5)) M.audible_emote("moans out lewdly!")
				if(prob(9)) to_chat(M, span_warning("You can't help but want to touch yourself then and now!"))
		data["count"]++
	holder.remove_reagent(src.id, 0.2)
	//..()
	return

/datum/reagent/benzilate/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	var/drug_strength = 12
	if(alien == IS_SKRELL)
		drug_strength = drug_strength * 0.6
	M.make_dizzy(drug_strength)
	M.Confuse(drug_strength * 14)

/obj/item/reagent_containers/pill/benzilate
	name = "Benzilate pill"
	desc = "You probably shouldn't swallow this."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/benzilate/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_BENZILATE, 50)
	color = reagents.get_color()


/obj/item/reagent_containers/pill/phenethylamine
	name = "Phenethylamine pill"
	desc = "Smells like... lilacs?"
	icon_state = "pill5"

/obj/item/reagent_containers/pill/phenethylamine/Initialize(mapload)
	. = ..()
	reagents.add_reagent(REAGENT_ID_PHENETHYLAMINE, 50)
	color = reagents.get_color()


// PILLS THAT WE PROBABLY SHOULDN'T HAVE AAAAAAAAAA. The below is only so they can be included through mapping or "spawn " command. -Carl

/obj/item/storage/pill_bottle/benzilate
	name = "bottle of Benzilate pills"
	desc = "This just hurts to look at with how many words of caution are scrawled on the lable. Better eat all of 'em!"

/obj/item/storage/pill_bottle/benzilate/New()
	..()
	new /obj/item/reagent_containers/pill/benzilate( src )
	new /obj/item/reagent_containers/pill/benzilate( src )
	new /obj/item/reagent_containers/pill/benzilate( src )
	new /obj/item/reagent_containers/pill/benzilate( src )
	new /obj/item/reagent_containers/pill/benzilate( src )
	new /obj/item/reagent_containers/pill/benzilate( src )
	new /obj/item/reagent_containers/pill/benzilate( src )

/obj/item/storage/pill_bottle/phenethylamine
	name = "bottle of Phenethylamine pills"
	desc = "Looks like someone drew a happy face on the label, replacing whatever was previously present."

/obj/item/storage/pill_bottle/phenethylamine/New()
	..()
	new /obj/item/reagent_containers/pill/phenethylamine( src )
	new /obj/item/reagent_containers/pill/phenethylamine( src )
	new /obj/item/reagent_containers/pill/phenethylamine( src )
	new /obj/item/reagent_containers/pill/phenethylamine( src )
	new /obj/item/reagent_containers/pill/phenethylamine( src )
	new /obj/item/reagent_containers/pill/phenethylamine( src )
	new /obj/item/reagent_containers/pill/phenethylamine( src )
