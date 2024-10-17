/datum/species/shadekin
	name = SPECIES_SHADEKIN
	name_plural = "Shadekin"
	icobase = 'icons/mob/human_races/r_shadekin_vr.dmi'
	deform = 'icons/mob/human_races/r_shadekin_vr.dmi'
	tail = "tail"
	icobase_tail = 1
	blurb = "Very little is known about these creatures. They appear to be largely mammalian in appearance. \
	Seemingly very rare to encounter, there have been widespread myths of these creatures the galaxy over, \
	but next to no verifiable evidence to their existence. However, they have recently been more verifiably \
	documented in the Virgo system, following a mining bombardment of Virgo 3. The crew of NSB Adephagia have \
	taken to calling these creatures 'Shadekin', and the name has generally stuck and spread. "		//TODO: Something that's not wiki copypaste
//CHOMPStation Removal TFF 12/24/19 - Wikilinks removed
//	wikilink = "https://wiki.vore-station.net/Shadekin"
	catalogue_data = list(/datum/category_item/catalogue/fauna/shadekin)

	language = LANGUAGE_SHADEKIN
	name_language = LANGUAGE_SHADEKIN
	species_language = LANGUAGE_SHADEKIN
	secondary_langs = list(LANGUAGE_SHADEKIN)
	num_alternate_languages = 3
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws/shadekin, /datum/unarmed_attack/bite/sharp/shadekin)
	rarity_value = 15	//INTERDIMENSIONAL FLUFFERS

	// male_scream_sound = null //CHOMPedit
	// female_scream_sound = null //CHOMPedit

	inherent_verbs = list(/mob/proc/adjust_hive_range)

	siemens_coefficient = 1
	darksight = 10

	slowdown = -0.5
	item_slowdown_mod = 0.5

	brute_mod = 0.7	// Naturally sturdy.
	burn_mod = 1.2	// Furry

	warning_low_pressure = 50
	hazard_low_pressure = -1

	warning_high_pressure = 300
	hazard_high_pressure = INFINITY

	cold_level_1 = -1	//Immune to cold
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 850	//Resistant to heat
	heat_level_2 = 1000
	heat_level_3 = 1150

	flags =  NO_SCAN | NO_MINOR_CUT | NO_INFECT
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_WHITELIST_SELECTABLE

	reagent_tag = IS_SHADEKIN		// for shadekin-unqiue chem interactions

	flesh_color = "#FFC896"
	blood_color = "#A10808"
	base_color = "#f0f0f0"
	color_mult = 1

	// has_glowing_eyes = TRUE			//Applicable through neutral taits.

	//death_message = "phases to somewhere far away!" //CHOMPEdit Removed
	// male_cough_sounds = null
	// female_cough_sounds = null
	// male_sneeze_sound = null
	// female_sneeze_sound = null

	speech_bubble_appearance = "ghost"

	genders = list(MALE, FEMALE, PLURAL, NEUTER)

	virus_immune = 1

	breath_type = null
	poison_type = null
	water_breather = TRUE	//They don't quite breathe

	vision_flags = SEE_SELF|SEE_MOBS
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_UNDERWEAR

	move_trail = /obj/effect/decal/cleanable/blood/tracks/paw

	has_organ = list(
		O_HEART =		/obj/item/organ/internal/heart,
		O_VOICE = 		/obj/item/organ/internal/voicebox,
		O_LIVER =		/obj/item/organ/internal/liver,
		O_KIDNEYS =		/obj/item/organ/internal/kidneys,
		O_BRAIN =		/obj/item/organ/internal/brain/shadekin,
		O_EYES =		/obj/item/organ/internal/eyes,
		O_STOMACH =		/obj/item/organ/internal/stomach,
		O_INTESTINE =	/obj/item/organ/internal/intestine
		)

	has_limbs = list(
		BP_TORSO =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/shadekin),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)

	//SHADEKIN-UNIQUE STUFF GOES HERE
	var/list/shadekin_abilities = list(/datum/power/shadekin/phase_shift,
									   /datum/power/shadekin/regenerate_other,
									   /datum/power/shadekin/create_shade,
									   /datum/power/shadekin/dark_tunneling, //CHOMPEdit Add - Dark Tunneling
									   /datum/power/shadekin/dark_respite, //CHOMPEdit Add - Dark Respite
									   /datum/power/shadekin/dark_maw) //CHOMPEdit Add - Dark Maw
	var/list/shadekin_ability_datums = list()
	var/list/active_dark_maws = list() //CHOMPEdit - Add dark maws
	var/kin_type
	var/energy_light = 0.25
	var/energy_dark = 0.75
	var/nutrition_conversion_scaling = 0.5 //CHOMPEdit - Add nutrition <-> dark energy conversion
	var/phase_gentle = TRUE //CHOMPEdit - Add gentle phasing, defaults to on.
	var/doing_phase = FALSE //CHOMPEdit - Prevent bugs when spamming phase button
	var/manual_respite = FALSE //CHOMPEdit - Dark Respite
	var/respite_activating = FALSE //CHOMPEdit - Dark Respite
	var/nutrition_energy_conversion = TRUE //CHOMPEdit - Add toggle to nutrition and energy conversions

/datum/species/shadekin/New()
	..()
	for(var/power in shadekin_abilities)
		var/datum/power/shadekin/SKP = new power(src)
		shadekin_ability_datums.Add(SKP)

//CHOMPEdit Begin - Actually phase to the Dark on death
/datum/species/shadekin/handle_death(var/mob/living/carbon/human/H)
	H.clear_dark_maws() //CHOMPEdit - clear dark maws on death or similar
	if(respite_activating)
		return TRUE
	var/area/current_area = get_area(H)
	if((H.ability_flags & AB_DARK_RESPITE) || H.has_modifier_of_type(/datum/modifier/dark_respite) || current_area.limit_dark_respite)
		return
	var/list/floors = list()
	for(var/turf/unsimulated/floor/dark/floor in get_area_turfs(/area/shadekin))
		floors.Add(floor)
	if(!LAZYLEN(floors))
		log_and_message_admins("[H] died outside of the dark but there were no valid floors to warp to")
		return

	H.visible_message("<b>\The [H.name]</b> phases to somewhere far away!")
	var/obj/effect/temp_visual/shadekin/phase_out/phaseanimout = new /obj/effect/temp_visual/shadekin/phase_out(H.loc)
	phaseanimout.dir = H.dir
	respite_activating = TRUE

	H.drop_l_hand()
	H.drop_r_hand()

	H.shadekin_set_energy(0)
	H.ability_flags |= AB_DARK_RESPITE
	H.invisibility = INVISIBILITY_SHADEKIN

	H.adjustFireLoss(-(H.getFireLoss() * 0.75))
	H.adjustBruteLoss(-(H.getBruteLoss() * 0.75))
	H.adjustToxLoss(-(H.getToxLoss() * 0.75))
	H.adjustCloneLoss(-(H.getCloneLoss() * 0.75))
	H.germ_level = 0 // CHOMPAdd - Take away the germs, or we'll die AGAIN
	H.vessel.add_reagent("blood",blood_volume-H.vessel.total_volume)
	for(var/obj/item/organ/external/bp in H.organs)
		bp.bandage()
		bp.disinfect()
	H.nutrition = 0
	H.invisibility = INVISIBILITY_SHADEKIN
	BITRESET(H.hud_updateflag, HEALTH_HUD)
	BITRESET(H.hud_updateflag, STATUS_HUD)
	BITRESET(H.hud_updateflag, LIFE_HUD)

	if(istype(H.loc, /obj/belly))
		//Yay digestion... presumably...
		var/obj/belly/belly = H.loc
		add_attack_logs(belly.owner, H, "Digested in [lowertext(belly.name)]")
		to_chat(belly.owner, "<span class='notice'>\The [H.name] suddenly vanishes within your [belly.name]</span>")
		H.forceMove(pick(floors))
		if(H.ability_flags & AB_PHASE_SHIFTED)
			H.phase_shift()
		else
			var/obj/effect/temp_visual/shadekin/phase_in/phaseanim = new /obj/effect/temp_visual/shadekin/phase_in(H.loc)
			phaseanim.dir = H.dir
		H.invisibility = initial(H.invisibility)
		respite_activating = FALSE
		belly.owner.update_fullness()
		H.clear_fullscreen("belly")
		if(H.hud_used)
			if(!H.hud_used.hud_shown)
				H.toggle_hud_vis()
		H.stop_sound_channel(CHANNEL_PREYLOOP)
		H.add_modifier(/datum/modifier/dark_respite, 10 MINUTES)
		H.muffled = FALSE
		H.forced_psay = FALSE


		spawn(5 MINUTES)
			H.ability_flags &= ~AB_DARK_RESPITE
			to_chat(H, "<span class='notice'>You feel like you can leave the Dark again</span>")
	else
		H.add_modifier(/datum/modifier/dark_respite, 25 MINUTES)

		spawn(1 SECOND)
			H.forceMove(pick(floors))
			if(H.ability_flags & AB_PHASE_SHIFTED)
				H.phase_shift()
			else
				var/obj/effect/temp_visual/shadekin/phase_in/phaseanim = new /obj/effect/temp_visual/shadekin/phase_in(H.loc)
				phaseanim.dir = H.dir
			H.invisibility = initial(H.invisibility)
			respite_activating = FALSE

		spawn(15 MINUTES)
			H.ability_flags &= ~AB_DARK_RESPITE
			to_chat(H, "<span class='notice'>You feel like you can leave the Dark again</span>")

	return TRUE

/datum/modifier/dark_respite
	name = "Dark Respite"
	pain_immunity = 1

/datum/modifier/dark_respite/tick()
	if(istype(src.holder, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = src.holder
		if(H.nutrition)
			H.add_chemical_effect(CE_BLOODRESTORE, 5)
			H.nutrition = max(H.nutrition - 5, 0)

		if(istype(get_area(H), /area/shadekin))
			if(!src.pain_immunity)
				src.pain_immunity = 1
			//Very good healing, but only in the Dark.
			H.adjustFireLoss((-0.25))
			H.adjustBruteLoss((-0.25))
			H.adjustToxLoss((-0.25))
			H.heal_organ_damage(3, 0)
			H.add_chemical_effect(CE_ANTIBIOTIC, ANTIBIO_SUPER) //CHOMP Edit - increased ANTIBIO from Normal to Super
			for(var/obj/item/organ/I in H.internal_organs)
				if(I.robotic >= ORGAN_ROBOT)
					continue
				if(I.damage > 0)
					I.damage = max(I.damage - 0.25, 0)
				if(I.damage <= 5 && I.organ_tag == O_EYES)
					H.sdisabilities &= ~BLIND
			for(var/obj/item/organ/external/O in H.organs)
				if(O.status & ORGAN_BROKEN)
					O.mend_fracture()		//Only works if the bone won't rebreak, as usual
				for(var/datum/wound/W in O.wounds)
					if(W.bleeding())
						W.damage = max(W.damage - 3, 0)
						if(W.damage <= 0)
							O.wounds -= W
					if(W.internal)
						W.damage = max(W.damage - 3, 0)
						if(W.damage <= 0)
							O.wounds -= W
		else
			var/datum/species/shadekin/SK = H.species
			if(SK.manual_respite)
				to_chat(H, "<span class='notice'>As you leave the Dark, you stop focusing the Dark on healing yourself.</span>")
				SK.manual_respite = FALSE
				src.expire()
			if(src.pain_immunity)
				src.pain_immunity = 0
//CHOMPEdit End

/datum/species/shadekin/get_bodytype()
	return SPECIES_SHADEKIN

/datum/species/shadekin/get_random_name()
	return "shadekin"

/datum/species/shadekin/handle_environment_special(var/mob/living/carbon/human/H)
	handle_shade(H)

/datum/species/shadekin/add_inherent_verbs(var/mob/living/carbon/human/H)
	..()
	add_shadekin_abilities(H)

/datum/species/shadekin/proc/add_shadekin_abilities(var/mob/living/carbon/human/H)
	if(!H.ability_master || !istype(H.ability_master, /obj/screen/movable/ability_master/shadekin))
		H.ability_master = null
		H.ability_master = new /obj/screen/movable/ability_master/shadekin(H)
	for(var/datum/power/shadekin/P in shadekin_ability_datums)
		if(!(P.verbpath in H.verbs))
			add_verb(H, P.verbpath)
			H.ability_master.add_shadekin_ability(
					object_given = H,
					verb_given = P.verbpath,
					name_given = P.name,
					ability_icon_given = P.ability_icon_state,
					arguments = list()
					)
	add_verb(H,/mob/living/carbon/human/proc/phase_strength_toggle ) //CHOMPEdit - Add gentle phasing //CHOMPEdit
	add_verb(H,/mob/living/carbon/human/proc/nutrition_conversion_toggle ) //CHOMPEdit - Add nutrition conversion toggle //CHOMPEdit
	add_verb(H,/mob/living/carbon/human/proc/clear_dark_maws ) //CHOMPEdit - Add Dark maw clearing //CHOMPEdit

/datum/species/shadekin/proc/handle_shade(var/mob/living/carbon/human/H)
	//CHOMPEdit begin - No energy during dark respite
	if(H.has_modifier_of_type(/datum/modifier/dark_respite))
		set_energy(H, 0)
		update_shadekin_hud(H)
		return
	//CHOMPEdit End

	//Shifted kin don't gain/lose energy (and save time if we're at the cap)
	var/darkness = 1
	var/dark_gains = 0

	var/turf/T = get_turf(H)
	if(!T)
		dark_gains = 0
		return

	var/brightness = T.get_lumcount() //Brightness in 0.0 to 1.0
	//CHOMPEdit begin - dark in bellies
	if(isbelly(H.loc))
		brightness = 0
	//CHOMPEdit end
	darkness = 1-brightness //Invert
	var/is_dark = (darkness >= 0.5) || istype(get_area(H), /area/shadekin) //CHOMPEdit - Dark provides health

	if(H.ability_flags & AB_PHASE_SHIFTED)
		dark_gains = 0
	else
		//Heal (very) slowly in good darkness
		if(is_dark)
			H.adjustFireLoss((-0.10)*darkness)
			H.adjustBruteLoss((-0.10)*darkness)
			H.adjustToxLoss((-0.10)*darkness)
			//energy_dark and energy_light are set by the shadekin eye traits.
			//These are balanced around their playstyles and 2 planned new aggressive abilities
			dark_gains = energy_dark
		else
			dark_gains = energy_light
		//CHOMPEdit begin - Energy <-> nutrition conversion
		if(nutrition_energy_conversion && get_energy(H) == 100 && dark_gains > 0)
			H.nutrition += dark_gains * 5 * nutrition_conversion_scaling
		else if(nutrition_energy_conversion && get_energy(H) < 50 && H.nutrition > 500)
			H.nutrition -= nutrition_conversion_scaling * 50
			dark_gains += nutrition_conversion_scaling
		//CHOMPEdit end

	set_energy(H, get_energy(H) + dark_gains)

	//Update huds
	update_shadekin_hud(H)

/datum/species/shadekin/proc/get_energy(var/mob/living/carbon/human/H)
	var/obj/item/organ/internal/brain/shadekin/shade_organ = H.internal_organs_by_name[O_BRAIN]

	if(!istype(shade_organ))
		return 0
	//CHOMPEdit - Dark Respite
	if(H.ability_flags & AB_DARK_RESPITE || H.has_modifier_of_type(/datum/modifier/dark_respite))
		return 0
	//CHOMPEdit - Dark Respite
	if(shade_organ.dark_energy_infinite)
		return shade_organ.max_dark_energy

	return shade_organ.dark_energy

/datum/species/shadekin/proc/get_max_energy(var/mob/living/carbon/human/H)
	var/obj/item/organ/internal/brain/shadekin/shade_organ = H.internal_organs_by_name[O_BRAIN]

	if(!istype(shade_organ))
		return 0

	return shade_organ.max_dark_energy - (LAZYLEN(active_dark_maws) * 5)

/datum/species/shadekin/proc/set_energy(var/mob/living/carbon/human/H, var/new_energy)
	var/obj/item/organ/internal/brain/shadekin/shade_organ = H.internal_organs_by_name[O_BRAIN]

	if(!istype(shade_organ))
		return

	shade_organ.dark_energy = CLAMP(new_energy, 0, get_max_energy(H))

/datum/species/shadekin/proc/set_max_energy(var/mob/living/carbon/human/H, var/new_max_energy)
	var/obj/item/organ/internal/brain/shadekin/shade_organ = H.internal_organs_by_name[O_BRAIN]

	if(!istype(shade_organ))
		return 0

	shade_organ.max_dark_energy = new_max_energy

/datum/species/shadekin/proc/update_shadekin_hud(var/mob/living/carbon/human/H)
	var/turf/T = get_turf(H)
	if(H.shadekin_display)
		var/l_icon = 0
		var/e_icon = 0

		H.shadekin_display.invisibility = 0
		if(T)
			var/brightness = T.get_lumcount() //Brightness in 0.0 to 1.0
			var/darkness = 1-brightness //Invert
			switch(darkness)
				if(0.80 to 1.00)
					l_icon = 0
				if(0.60 to 0.80)
					l_icon = 1
				if(0.40 to 0.60)
					l_icon = 2
				if(0.20 to 0.40)
					l_icon = 3
				if(0.00 to 0.20)
					l_icon = 4

		switch(get_energy(H))
			if(0 to 24)
				e_icon = 0
			if(25 to 49)
				e_icon = 1
			if(50 to 74)
				e_icon = 2
			if(75 to 99)
				e_icon = 3
			if(100 to INFINITY)
				e_icon = 4

		H.shadekin_display.icon_state = "shadekin-[l_icon]-[e_icon]"
	return

/datum/species/shadekin/proc/get_shadekin_eyecolor(var/mob/living/carbon/human/H)
	var/eyecolor_rgb = rgb(H.r_eyes, H.g_eyes, H.b_eyes)

	var/eyecolor_hue = rgb2num(eyecolor_rgb, COLORSPACE_HSV)[1]
	var/eyecolor_sat = rgb2num(eyecolor_rgb, COLORSPACE_HSV)[2]
	var/eyecolor_val = rgb2num(eyecolor_rgb, COLORSPACE_HSV)[3]

	//First, clamp the saturation/value to prevent black/grey/white eyes
	if(eyecolor_sat < 10)
		eyecolor_sat = 10
	if(eyecolor_val < 40)
		eyecolor_val = 40

	eyecolor_rgb = rgb(eyecolor_hue, eyecolor_sat, eyecolor_val, space=COLORSPACE_HSV)

	H.r_eyes = rgb2num(eyecolor_rgb)[1]
	H.g_eyes = rgb2num(eyecolor_rgb)[2]
	H.b_eyes = rgb2num(eyecolor_rgb)[3]

	//Now determine what color we fall into.
	var/eyecolor_type = BLUE_EYES
	switch(eyecolor_hue)
		if(0 to 20)
			eyecolor_type = RED_EYES
		if(21 to 50)
			eyecolor_type = ORANGE_EYES
		if(51 to 70)
			eyecolor_type = YELLOW_EYES
		if(71 to 160)
			eyecolor_type = GREEN_EYES
		if(161 to 260)
			eyecolor_type = BLUE_EYES
		if(261 to 340)
			eyecolor_type = PURPLE_EYES
		if(341 to 360)
			eyecolor_type = RED_EYES

	return eyecolor_type

/datum/species/shadekin/post_spawn_special(var/mob/living/carbon/human/H)
	.=..()

	var/eyecolor_type = get_shadekin_eyecolor(H)

	switch(eyecolor_type)
		if(BLUE_EYES)
			total_health = 75 //ChompEDIT - balance tweaks
			energy_light = 0.5
			energy_dark = 0.5
			nutrition_conversion_scaling = 0.5 //CHOMPEdit - Add nutrition <-> dark energy conversion
		if(RED_EYES)
			total_health = 150 //ChompEDIT - balance tweaks
			energy_light = -1
			energy_dark = 0.5 //ChompEDIT
			nutrition_conversion_scaling = 2 //CHOMPEdit - Add nutrition <-> dark energy conversion
		if(PURPLE_EYES)
			total_health = 100 //ChompEDIT - balance tweaks
			energy_light = -0.5
			energy_dark = 1
			nutrition_conversion_scaling = 1 //CHOMPEdit - Add nutrition <-> dark energy conversion
		if(YELLOW_EYES)
			total_health = 50 //ChompEDIT - balance tweaks
			energy_light = -2
			energy_dark = 3
			nutrition_conversion_scaling = 0.5 //CHOMPEdit - Add nutrition <-> dark energy conversion
		if(GREEN_EYES)
			total_health = 100 //ChompEDIT - balance tweaks
			energy_light = 0.125
			energy_dark = 2
			nutrition_conversion_scaling = 0.5 //CHOMPEdit - Add nutrition <-> dark energy conversion
		if(ORANGE_EYES)
			total_health = 125 //ChompEDIT - balance tweaks
			energy_light = -0.5
			energy_dark = 0.5 //ChompEDIT
			nutrition_conversion_scaling = 1.5 //CHOMPEdit - Add nutrition <-> dark energy conversion

	H.maxHealth = total_health

	H.health = H.maxHealth

/datum/species/shadekin/produceCopy(var/list/traits, var/mob/living/carbon/human/H, var/custom_base)

	var/datum/species/shadekin/new_copy = ..()

	new_copy.total_health = total_health

	new_copy.energy_light = energy_light

	new_copy.energy_dark = energy_dark

	return new_copy
