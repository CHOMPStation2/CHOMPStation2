/mob/living/simple_mob/xeno_ch/proc/xeno_build()
	set name = "Build Resin Structure"
	set desc = "Build a xenomorph resin structure."
	set category = "Abilities.Xeno"

	var/list/options = list("Resin Door","Resin Membrane","Nest","Resin Wall","Weed Node")
	for(var/option in options)
		LAZYSET(options, option, image('modular_chomp/icons/mob/xeno_screen.dmi', option))
	var/choice = show_radial_menu(src, src, options, radius = 60)
	if(!choice || QDELETED(src) || src.incapacitated())
		return FALSE
	. = TRUE

	var/targetLoc = get_step(src, dir)

	if(iswall(targetLoc))
		targetLoc = get_turf(src)

	var/obj/O

	if(do_after(src, xeno_build_time))
		switch(choice)
			if("Resin Door")
				O = new /obj/structure/simple_door/resin(targetLoc)

			if("Resin Membrane")
				O = new /obj/structure/alien/membrane(targetLoc)

			if("Nest")
				O = new /obj/structure/bed/nest(targetLoc)

			if("Resin Wall")
				O = new /obj/structure/alien/wall(targetLoc)

			if("Weed Node")
				O = new /obj/effect/alien/weeds/node(targetLoc)

		if(O)
			visible_message(span_boldwarning("[src] vomits up a thick purple substance and begins to shape it!"), span_alium("You shape a [choice]."))
			O.color = "#321D37"
			playsound(src, 'sound/effects/blobattack.ogg', 40, 1)



/////
/////
// DATUM actions for xeno buttons
/////
/////



/datum/action/innate/xeno_ch
	check_flags = AB_CHECK_RESTRAINED | AB_CHECK_STUNNED | AB_CHECK_ALIVE
	button_icon = 'modular_chomp/icons/mob/xeno_screen.dmi'
	var/mob/living/simple_mob/xeno_ch/parent_xeno


/datum/action/innate/xeno_ch/Grant(mob/living/L)
	if(L)
		parent_xeno = L
	..()

/datum/action/innate/xeno_ch/xeno_build
	name = "Build resin structures"
	button_icon_state = "Nest"

/datum/action/innate/xeno_ch/xeno_build/Activate()
	parent_xeno.xeno_build()


/datum/action/innate/xeno_ch/xeno_neuro
	name = "Spit neurotoxin"
	button_icon_state = "Neuro Spit"

/datum/action/innate/xeno_ch/xeno_neuro/Activate()
	parent_xeno.neurotoxin()


/datum/action/innate/xeno_ch/xeno_acidspit
	name = "Spit acid"
	button_icon_state = "Acid Spit"

/datum/action/innate/xeno_ch/xeno_acidspit/Activate()
	parent_xeno.acidspit()


/datum/action/innate/xeno_ch/xeno_corrode
	name = "Corrode Object"
	button_icon_state = "Acid"

/datum/action/innate/xeno_ch/xeno_corrode/Activate()
	parent_xeno.corrosive_acid()


/datum/action/innate/xeno_ch/xeno_pounce
	name = "Pounce"
	button_icon_state = "Pounce"

/datum/action/innate/xeno_ch/xeno_pounce/Activate()
	parent_xeno.pounce_toggle()

/datum/action/innate/xeno_ch/xeno_spin
	name = "Spin"
	button_icon_state = "Spin"

/datum/action/innate/xeno_ch/xeno_spin/Activate()
	parent_xeno.speen()


/mob/living/simple_mob/xeno_ch/proc/grantallactions()
	build_action.Grant(src)
	neurotox_action.Grant(src)
	acidspit_action.Grant(src)
	corrode_action.Grant(src)
	pounce_action.Grant(src)
	spin_action.Grant(src)
