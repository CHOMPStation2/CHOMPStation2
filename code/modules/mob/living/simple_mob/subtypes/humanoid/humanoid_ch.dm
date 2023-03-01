// Basically, all we're doing here (for now) is defining pain/etc sounds for combat use
/mob/living/simple_mob/humanoid
	pain_emote_1p = list("shout out in pain", "growl in pain", "grunt in pain", "gasp out in pain")
	pain_emote_3p = list("shouts out in pain", "growls in pain", "grunts in pain", "gasps out in pain")

/mob/living/simple_mob/humanoid/Initialize()
	pain_sound = get_species_sound(male_generic_sounds["pain"])
	female_pain_sound = get_species_sound(female_generic_sounds["pain"])
	male_pain_sound = get_species_sound(male_generic_sounds["pain"])
	death_sound = get_species_sound(male_generic_sounds["death"])
	male_death_sound = get_species_sound(male_generic_sounds["death"])
	female_death_sound = get_species_sound(female_generic_sounds["death"])

	. = ..()
