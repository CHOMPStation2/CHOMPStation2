/datum/species/shadekin
	siemens_coefficient = 1
	//SHADEKIN-UNIQUE STUFF GOES HERE
	shadekin_abilities = list(/datum/power/shadekin/phase_shift,
									   /datum/power/shadekin/regenerate_other,
									   /datum/power/shadekin/create_shade)
	shadekin_ability_datums = list()
	var/kin_type

/datum/species/shadekin/handle_shade(var/mob/living/carbon/human/H)
	//Shifted kin don't gain/lose energy (and save time if we're at the cap)
	var/darkness = 1
	var/dark_gains = 0

	var/turf/T = get_turf(H)
	if(!T)
		dark_gains = 0
		return

	var/brightness = T.get_lumcount() //Brightness in 0.0 to 1.0
	darkness = 1-brightness //Invert
	var/is_dark = (darkness >= 0.5)

	if(H.ability_flags & AB_PHASE_SHIFTED)
		dark_gains = 0
	else
		//Heal (very) slowly in good darkness
		if(is_dark)
			H.adjustFireLoss((-0.10)*darkness)
			H.adjustBruteLoss((-0.10)*darkness)
			H.adjustToxLoss((-0.10)*darkness)
			dark_gains = 0.75
		else
			dark_gains = 0.25

//HANDLING FOR KIN EYE TRAITS
		if(kin_type)
			switch(kin_type)
				if(BLUE_EYES)
					dark_gains = 0.5
				if(RED_EYES)
					if(is_dark)
						dark_gains = 0.1
					else
						dark_gains = -1
				if(PURPLE_EYES)
					if(is_dark)
						dark_gains = 1
					else
						dark_gains = -0.5
				if(YELLOW_EYES)
					if(is_dark)
						dark_gains = 3
					else
						dark_gains = -2
				if(GREEN_EYES)
					if(is_dark)
						dark_gains = 2
					else
						dark_gains = 0.125
				if(ORANGE_EYES)
					if(is_dark)
						dark_gains = 0.25
					else
						dark_gains = -0.5
//These are balanced around their playstyles and 2 planned new aggressive abilities

	set_energy(H, get_energy(H) + dark_gains)

	//Update huds
	update_shadekin_hud(H)

/datum/trait/kintype
	banned_species = list(	SPECIES_AKULA,
							SPECIES_ALRAUNE,
							SPECIES_NEVREAN,
							SPECIES_PROTEAN,
							SPECIES_RAPALA,
							SPECIES_SERGAL,
							SPECIES_SHADEKIN_CREW,
							SPECIES_VASILISSAN,
							SPECIES_VULPKANIN,
							SPECIES_XENOCHIMERA,
							SPECIES_ZORREN_HIGH,
							SPECIES_CUSTOM,
							SPECIES_WEREBEAST,
							SPECIES_FENNEC,
							SPECIES_XENOHYBRID,
							SPECIES_VOX,
							SPECIES_ZADDAT,
							SPECIES_PROMETHEAN)
	var/color = "Blue"
	desc = "Makes your shadekin adapted as a Blue eyed kin! This gives you decreased energy regeneration in darkness, decreased regeneration in the light amd unchanged health!"
	cost = 0
	var_changes = list(	"total_health" = 100,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))
	custom_only = FALSE

/datum/trait/kintype/New()
	..()
	name = "Shadekin [color] Adaption" //This works but desc can not be changed here sadly.

/datum/trait/kintype/red
	color = "Red"
	desc = "Makes your shadekin adapted as a Red eyed kin! This gives you minimal energy regeneration in darkness, moderate regeneration in the light amd increased health!"
	var_changes = list(	"total_health" = 200,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))
/datum/trait/kintype/purple
	color = "Purple"
	desc = "Makes your shadekin adapted as a Purple eyed kin! This gives you moderate energy regeneration in darkness, minor degeneration in the light amd increased health!"
	var_changes = list(	"total_health" = 150,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))

/datum/trait/kintype/yellow
	color = "Yellow"
	desc = "Makes your shadekin adapted as a Yellow eyed kin! This gives you the highest energy regeneration in darkness, high degeneration in the light amd unchanged health!"
	var_changes = list(	"total_health" = 100,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))

/datum/trait/kintype/green
	color = "Green"
	desc = "Makes your shadekin adapted as a Green eyed kin! This gives you high energy regeneration in darkness, minor regeneration in the light amd unchanged health!"
	var_changes = list(	"total_health" = 100,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))

/datum/trait/kintype/orange
	color = "Orange"
	desc = "Makes your shadekin adapted as a Orange eyed kin! This gives you minor energy regeneration in darkness, modeate degeneration in the light amd increased health!"
	var_changes = list(	"total_health" = 175,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))

/datum/trait/kintype/apply(var/datum/species/shadekin/S,var/mob/living/carbon/human/H)
	switch(color)
		if("Blue")
			H.shapeshifter_set_eye_color("0000FF")
			S.kin_type = BLUE_EYES
		if("Red")
			H.shapeshifter_set_eye_color("FF0000")
			S.kin_type = RED_EYES
		if("Green")
			H.shapeshifter_set_eye_color("00FF00")
			S.kin_type = GREEN_EYES
		if("Purple")
			H.shapeshifter_set_eye_color("FF00FF")
			S.kin_type = PURPLE_EYES
		if("Yellow")
			H.shapeshifter_set_eye_color("FFFF00")
			S.kin_type = YELLOW_EYES
		if("Orange")
			H.shapeshifter_set_eye_color("FFA500")
			S.kin_type = ORANGE_EYES


/datum/unarmed_attack/shadekinharmbap
	attack_name = "syphon strike"
	attack_verb = list("hit", "clawed", "slashed", "scratched")
	attack_sound = 'sound/weapons/slice.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	shredding = 0

/datum/unarmed_attack/shadekinharmbap/apply_effects(var/mob/living/carbon/human/shadekin/user,var/mob/living/carbon/human/target,var/armour,var/attack_damage,var/zone)
	..()
	if(user == target) //Prevent self attack to gain energy
		return
	var/obj/item/organ/internal/brain/shadekin/shade_organ = user.internal_organs_by_name[O_BRAIN]
	if(!istype(shade_organ))
		return
	shade_organ.dark_energy = CLAMP(shade_organ.dark_energy + attack_damage,0,shade_organ.max_dark_energy) //Convert Damage done to Energy Gained