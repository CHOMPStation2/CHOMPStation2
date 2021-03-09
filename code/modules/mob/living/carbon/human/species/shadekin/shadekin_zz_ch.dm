/datum/species/shadekin
	siemens_coefficient = 1
	//SHADEKIN-UNIQUE STUFF GOES HERE
	shadekin_abilities = list(/datum/power/shadekin/phase_shift,
									   /datum/power/shadekin/regenerate_other,
									   /datum/power/shadekin/create_shade)
	shadekin_ability_datums = list()
	var/kin_type
	var/energy_light = 0.25
	var/energy_dark = 0.75

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
			//energy_dark and energy_light are set by the shadekin eye traits.
			//These are balanced around their playstyles and 2 planned new aggressive abilities
			dark_gains = energy_dark
		else
			dark_gains = energy_light

	set_energy(H, get_energy(H) + dark_gains)

	//Update huds
	update_shadekin_hud(H)

/datum/trait/kintype
	allowed_species = list(SPECIES_SHADEKIN)
	var/color = BLUE_EYES
	name = "Shadekin Blue Adaptation"
	desc = "Makes your shadekin adapted as a Blue eyed kin! This gives you decreased energy regeneration in darkness, decreased regeneration in the light amd unchanged health!"
	cost = 0
	var_changes = list(	"total_health" = 100,
						"energy_light" = 0.5,
						"energy_dark" = 0.5,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))
	custom_only = FALSE

/datum/trait/kintype/red
	name = "Shadekin Red Adaptation"
	color =	RED_EYES
	desc = "Makes your shadekin adapted as a Red eyed kin! This gives you minimal energy regeneration in darkness, moderate regeneration in the light amd increased health!"
	var_changes = list(	"total_health" = 200,
						"energy_light" = -1,
						"energy_dark" = 0.1,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))
/datum/trait/kintype/purple
	name = "Shadekin Purple Adaptation"
	color = PURPLE_EYES
	desc = "Makes your shadekin adapted as a Purple eyed kin! This gives you moderate energy regeneration in darkness, minor degeneration in the light amd increased health!"
	var_changes = list(	"total_health" = 150,
						"energy_light" = 1,
						"energy_dark" = -0.5,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))

/datum/trait/kintype/yellow
	name = "Shadekin Yellow Adaptation"
	color = YELLOW_EYES
	desc = "Makes your shadekin adapted as a Yellow eyed kin! This gives you the highest energy regeneration in darkness, high degeneration in the light amd unchanged health!"
	var_changes = list(	"total_health" = 100,
						"energy_light" = 3,
						"energy_dark" = -2,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))

/datum/trait/kintype/green
	name = "Shadekin Green Adaptation"
	color = GREEN_EYES
	desc = "Makes your shadekin adapted as a Green eyed kin! This gives you high energy regeneration in darkness, minor regeneration in the light amd unchanged health!"
	var_changes = list(	"total_health" = 100,
						"energy_light" = 2,
						"energy_dark" = 0.125,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))

/datum/trait/kintype/orange
	name = "Shadekin Orange Adaptation"
	color = ORANGE_EYES
	desc = "Makes your shadekin adapted as a Orange eyed kin! This gives you minor energy regeneration in darkness, modeate degeneration in the light amd increased health!"
	var_changes = list(	"total_health" = 175,
						"energy_light" = 0.25,
						"energy_dark" = -0.5,
						"unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/shadekinharmbap))

/datum/trait/kintype/apply(var/datum/species/shadekin/S,var/mob/living/carbon/human/H)
	if(color && istype(S)) //Sanity check to see if they're actually a shadekin, otherwise just don't do anything. They shouldn't be able to spawn with the trait.
		S.kin_type = color
		..(S,H)
		switch(color)
			if(BLUE_EYES)
				H.shapeshifter_set_eye_color("0000FF")
			if(RED_EYES)
				H.shapeshifter_set_eye_color("FF0000")
			if(GREEN_EYES)
				H.shapeshifter_set_eye_color("00FF00")
			if(PURPLE_EYES)
				H.shapeshifter_set_eye_color("FF00FF")
			if(YELLOW_EYES)
				H.shapeshifter_set_eye_color("FFFF00")
			if(ORANGE_EYES)
				H.shapeshifter_set_eye_color("FFA500")


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
