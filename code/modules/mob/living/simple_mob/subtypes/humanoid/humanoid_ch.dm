// Basically, all we're doing here (for now) is defining pain/etc sounds for combat use
/mob/living/simple_mob/humanoid
	pain_emote_1p = list("shout out in pain", "growl in pain", "grunt in pain", "gasp out in pain")
	pain_emote_3p = list("shouts out in pain", "growls in pain", "grunts in pain", "gasps out in pain")
	species_sounds = "Human Male" // Yes, we should allow them to differ based on gender, but if someone's making a custom humanoid later:tm: - set your humanoid's species_sounds to match, or var-edit it after spawn.
