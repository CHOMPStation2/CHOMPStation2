//Simple mobs
/mob/living/simple_mob
	//These are the basic base settings for simple_mobs that pretty much says "most living things kinda approximate around these values", special cases will be accounted for in following overrides.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 80, BP_TORSO = 80, BP_GROIN = 20, BP_L_FOOT = 80, BP_R_FOOT = 80, BP_L_LEG = 35, BP_R_LEG = 35, BP_L_ARM = 65, BP_R_ARM = 65, BP_L_HAND = 80, BP_R_HAND = 80), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 95, BP_TORSO = 90, BP_GROIN = 90), \
		"bone_strength" = list(BP_HEAD = 1.3, BP_TORSO = 1.15, BP_GROIN = 1, BP_L_FOOT = 0.7, BP_R_FOOT = 0.7, BP_L_LEG = 1.2, BP_R_LEG = 1.2, BP_L_ARM = 1, BP_R_ARM = 1, BP_L_HAND = 0.55, BP_R_HAND = 0.55), \
		"organ_multiplier" = list(BP_HEAD = 4, BP_TORSO = 3.5, BP_GROIN = 2.5)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1,"velloss_mult" = 1))

/mob/living/simple_mob/animal/giant_spider
	//Spiders have an exoskeleton and no internal skeleton, so there'll be just 97% chance of hitting bone (3% for stuff like eyes and orifices), but the bone is much easier to punch through.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 97, BP_TORSO = 97, BP_GROIN = 97, BP_L_FOOT = 97, BP_R_FOOT = 97, BP_L_LEG = 97, BP_R_LEG = 97, BP_L_ARM = 97, BP_R_ARM = 97, BP_L_HAND = 97, BP_R_HAND = 97), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 95, BP_TORSO = 90, BP_GROIN = 90), \
		"bone_strength" = list(BP_HEAD = 0.35, BP_TORSO = 0.3, BP_GROIN = 0.25, BP_L_FOOT = 0.15, BP_R_FOOT = 0.15, BP_L_LEG = 0.2, BP_R_LEG = 0.2, BP_L_ARM = 0.2, BP_R_ARM = 0.2, BP_L_HAND = 0.15, BP_R_HAND = 0.15), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1,"velloss_mult" = 1))

/mob/living/simple_mob/metroid
	//Metroids aren't real but we can make some guesses, and they sure as hell don't have any bones. They also don't have any arms or feet, so we're gonna pretend like those are referring to the parts of the metroid slime that have no organs in them.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 90, BP_TORSO = 95, BP_GROIN = 95), \
		"bone_strength" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3.4)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1.175,"velloss_mult" = 1.3))

/mob/living/simple_mob/mechanical
	//Okay, so my equations weren't really meant for stuff made out of metal, but we should be able to make it work anyways. We'll just make bone represent armor instead.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 85, BP_TORSO = 90, BP_GROIN = 90, BP_L_FOOT = 95, BP_R_FOOT = 95, BP_L_LEG = 95, BP_R_LEG = 95, BP_L_ARM = 95, BP_R_ARM = 95, BP_L_HAND = 95, BP_R_HAND = 95), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 80, BP_TORSO = 80, BP_GROIN = 80), \
		"bone_strength" = list(BP_HEAD = 2.5, BP_TORSO = 3, BP_GROIN = 2.75, BP_L_FOOT = 1.5, BP_R_FOOT = 1.5, BP_L_LEG = 2, BP_R_LEG = 2, BP_L_ARM = 1.75, BP_R_ARM = 1.75, BP_L_HAND = 1.35, BP_R_HAND = 1.35), \
		"organ_multiplier" = list(BP_HEAD = 3, BP_TORSO = 2.5, BP_GROIN = 2.5)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1,"velloss_mult" = 1))

/mob/living/simple_mob/tomato
	//Going to copy from metroids, since they're honestly kind of similar, just blob shaped mushy creatures.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 90, BP_TORSO = 95, BP_GROIN = 95), \
		"bone_strength" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3.4)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1.175,"velloss_mult" = 1.3))

/mob/living/simple_mob/animal/space/tree
	//It's uh, a tree? Gonna say here that the bark will act as a shitty equivalent to bones but be 100% encasing
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 100, BP_TORSO = 100, BP_GROIN = 100, BP_L_FOOT = 100, BP_R_FOOT = 100, BP_L_LEG = 100, BP_R_LEG = 100, BP_L_ARM = 100, BP_R_ARM = 100, BP_L_HAND = 100, BP_R_HAND = 100), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 95, BP_TORSO = 90, BP_GROIN = 90), \
		"bone_strength" = list(BP_HEAD = 0.075, BP_TORSO = 0.15, BP_GROIN = 0.2, BP_L_FOOT = 0.075, BP_R_FOOT = 0.075, BP_L_LEG = 0.1, BP_R_LEG = 0.1, BP_L_ARM = 0.075, BP_R_ARM = 0.075, BP_L_HAND = 0.05, BP_R_HAND = 0.05), \
		"organ_multiplier" = list(BP_HEAD = 4, BP_TORSO = 3.5, BP_GROIN = 2.5)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1,"velloss_mult" = 1))

/mob/living/simple_mob/slime
	//Slimes are also just getting copied from metroids, so scroll up for explanation.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 90, BP_TORSO = 95, BP_GROIN = 95), \
		"bone_strength" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3.4)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1.175,"velloss_mult" = 1.3))

/mob/living/simple_mob/vore/pitcher_plant
	//Uhhh, well, pitcher plants are kinda funny because they're mostly hollow. Gonna pretty much just say that they have no organs and no bones here. Maybe later on we can add a special function for bullets to also act on whatever is inside.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0), \
		"bone_strength" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_multiplier" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1,"velloss_mult" = 1))

/mob/living/simple_mob/vore/bee
	//Bees also have exoskeletons, so copying from spiders pretty much.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 97, BP_TORSO = 97, BP_GROIN = 97, BP_L_FOOT = 97, BP_R_FOOT = 97, BP_L_LEG = 97, BP_R_LEG = 97, BP_L_ARM = 97, BP_R_ARM = 97, BP_L_HAND = 97, BP_R_HAND = 97), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 95, BP_TORSO = 90, BP_GROIN = 90), \
		"bone_strength" = list(BP_HEAD = 0.35, BP_TORSO = 0.3, BP_GROIN = 0.25, BP_L_FOOT = 0.15, BP_R_FOOT = 0.15, BP_L_LEG = 0.2, BP_R_LEG = 0.2, BP_L_ARM = 0.2, BP_R_ARM = 0.2, BP_L_HAND = 0.15, BP_R_HAND = 0.15), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1,"velloss_mult" = 1))

/mob/living/simple_mob/vore/aggressive/corrupthound
	//These are mechanical, so copying from mechanical.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 85, BP_TORSO = 90, BP_GROIN = 90, BP_L_FOOT = 95, BP_R_FOOT = 95, BP_L_LEG = 95, BP_R_LEG = 95, BP_L_ARM = 95, BP_R_ARM = 95, BP_L_HAND = 95, BP_R_HAND = 95), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 80, BP_TORSO = 80, BP_GROIN = 80), \
		"bone_strength" = list(BP_HEAD = 2.5, BP_TORSO = 3, BP_GROIN = 2.75, BP_L_FOOT = 1.5, BP_R_FOOT = 1.5, BP_L_LEG = 2, BP_R_LEG = 2, BP_L_ARM = 1.75, BP_R_ARM = 1.75, BP_L_HAND = 1.35, BP_R_HAND = 1.35), \
		"organ_multiplier" = list(BP_HEAD = 3, BP_TORSO = 2.5, BP_GROIN = 2.5)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1,"velloss_mult" = 1))

/mob/living/simple_mob/vore/aggressive/frog
	//Frogs actually have some interesting anatomy. Giant head, small brain, large holes in the skull for eyes.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 65, BP_TORSO = 70, BP_GROIN = 20, BP_L_FOOT = 80, BP_R_FOOT = 80, BP_L_LEG = 35, BP_R_LEG = 35, BP_L_ARM = 65, BP_R_ARM = 65, BP_L_HAND = 80, BP_R_HAND = 80), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 50, BP_TORSO = 90, BP_GROIN = 90), \
		"bone_strength" = list(BP_HEAD = 1.3, BP_TORSO = 1.15, BP_GROIN = 1, BP_L_FOOT = 0.7, BP_R_FOOT = 0.7, BP_L_LEG = 1.2, BP_R_LEG = 1.2, BP_L_ARM = 1, BP_R_ARM = 1, BP_L_HAND = 0.55, BP_R_HAND = 0.55), \
		"organ_multiplier" = list(BP_HEAD = 4, BP_TORSO = 3.5, BP_GROIN = 2.9)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1,"velloss_mult" = 1))

/mob/living/simple_mob/animal/space/jelly
	//Copying from metroids again
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 90, BP_TORSO = 95, BP_GROIN = 95), \
		"bone_strength" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3.4)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1.175,"velloss_mult" = 1.3))

/mob/living/simple_mob/vore/sect_queen
	//Exoskeleton, so, gonna copy from spiders and give a small bonus to the bone strength for the sheer size.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 97, BP_TORSO = 97, BP_GROIN = 97, BP_L_FOOT = 97, BP_R_FOOT = 97, BP_L_LEG = 97, BP_R_LEG = 97, BP_L_ARM = 97, BP_R_ARM = 97, BP_L_HAND = 97, BP_R_HAND = 97), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 95, BP_TORSO = 90, BP_GROIN = 90), \
		"bone_strength" = list(BP_HEAD = 0.45, BP_TORSO = 0.4, BP_GROIN = 0.35, BP_L_FOOT = 0.25, BP_R_FOOT = 0.25, BP_L_LEG = 0.3, BP_R_LEG = 0.3, BP_L_ARM = 0.3, BP_R_ARM = 0.3, BP_L_HAND = 0.25, BP_R_HAND = 0.25), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1,"velloss_mult" = 1))

/mob/living/simple_mob/vore/oregrub
	//They seem mushy and blobby, so gonna copy from metroids.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 90, BP_TORSO = 95, BP_GROIN = 95), \
		"bone_strength" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3.4)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1.175,"velloss_mult" = 1.3))

/mob/living/simple_mob/vore/solargrub
	//Solargrubs also seem mushy and blobby, let's continue copying from metroids.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 90, BP_TORSO = 95, BP_GROIN = 95), \
		"bone_strength" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3.4)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1.175,"velloss_mult" = 1.3))

/mob/living/simple_mob/vore/slug
	//Slugs are also mushy and blobby, gonna copy from metroids as well.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 90, BP_TORSO = 95, BP_GROIN = 95), \
		"bone_strength" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3.4)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1.175,"velloss_mult" = 1.3))

/mob/living/simple_mob/vore/aggressive/mimic
	//Hmm, To be honest I imagine mimics having an exoskeleton, so I'm gonna copy from spiders and make a few changes for organ stuff.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 97, BP_TORSO = 97, BP_GROIN = 97, BP_L_FOOT = 97, BP_R_FOOT = 97, BP_L_LEG = 97, BP_R_LEG = 97, BP_L_ARM = 97, BP_R_ARM = 97, BP_L_HAND = 97, BP_R_HAND = 97), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 60, BP_TORSO = 80, BP_GROIN = 90), \
		"bone_strength" = list(BP_HEAD = 0.35, BP_TORSO = 0.3, BP_GROIN = 0.25, BP_L_FOOT = 0.15, BP_R_FOOT = 0.15, BP_L_LEG = 0.2, BP_R_LEG = 0.2, BP_L_ARM = 0.2, BP_R_ARM = 0.2, BP_L_HAND = 0.15, BP_R_HAND = 0.15), \
		"organ_multiplier" = list(BP_HEAD = 3.5, BP_TORSO = 3.5, BP_GROIN = 3.5)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1,"velloss_mult" = 1))

/mob/living/simple_mob/vore/solarmoth
	//Solarmoths are getting directly copied from spiders, again because of exoskeleton
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 97, BP_TORSO = 97, BP_GROIN = 97, BP_L_FOOT = 97, BP_R_FOOT = 97, BP_L_LEG = 97, BP_R_LEG = 97, BP_L_ARM = 97, BP_R_ARM = 97, BP_L_HAND = 97, BP_R_HAND = 97), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 95, BP_TORSO = 90, BP_GROIN = 90), \
		"bone_strength" = list(BP_HEAD = 0.35, BP_TORSO = 0.3, BP_GROIN = 0.25, BP_L_FOOT = 0.15, BP_R_FOOT = 0.15, BP_L_LEG = 0.2, BP_R_LEG = 0.2, BP_L_ARM = 0.2, BP_R_ARM = 0.2, BP_L_HAND = 0.15, BP_R_HAND = 0.15), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1,"velloss_mult" = 1))

/mob/living/simple_mob/blob
	//Apparently these are considered slimes in code, so gonna copy from metroid for them.
	ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_HEAD = 90, BP_TORSO = 95, BP_GROIN = 95), \
		"bone_strength" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3.4)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1.175,"velloss_mult" = 1.3))

//Species
/datum/species/shapeshifter/promethean/handle_post_spawn(var/mob/living/carbon/human/H)
	.=..()
	//Honestly this is mostly for balancing purposes, since prometheans have no bones and weirder organs it fucks with the numbers, so giving them a bit more flesh damage
	H.ballistic_variables = list(\
		"bone_chance_unencased" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_leave_early" = list("l_arm", "r_arm", "l_hand", "r_hand", "l_foot", "r_foot"), \
		"organ_hit_weight" = list(\
			BP_HEAD = list(\
				/*Standard organs*/O_BRAIN = 90, O_EYES = 5, \
				/*Diona organs*/O_RESPONSE = 10, O_RESPONSE = 15, O_GBLADDER = 15, \
				/*Replicant organs*/O_VRLINK = 20, \
				/*Xeno organs*/O_ACID = 10, O_RESIN = 10), \
			BP_TORSO = list(\
				/*Standard organs*/O_HEART = 5, O_LUNGS = 50, O_SPLEEN = 15, O_VOICE = 10, \
				/*Synth organs*/O_CELL = 5, O_PUMP = 15, O_HEATSINK = 35, O_CYCLER = 15, O_DIAGNOSTIC = 10, \
				/*Promethean organs*/O_REGBRUTE = 20, O_REGBURN = 20, O_REGOXY = 20, O_REGTOX = 20, \
				/*Diona organs*/O_STRATA = 35, O_BRAIN = 20, O_NUTRIENT = 10, \
				/*Replicant organs*/O_AREJECT = 35, \
				/*Xeno organs*/O_PLASMA = 10, O_HIVE = 10), \
			BP_GROIN = list(\
				/*Standard organs*/O_INTESTINES = 50, O_STOMACH = 20, O_LIVER = 20, O_KIDNEYS = 15, O_APPENDIX = 5, \
				/*Diona organs*/O_POLYP = 10, O_ANCHOR = 15, \
				/*Replicant organs*/O_VENTC = 20, \
				/*Xeno organs*/ O_EGG = 25) ), \
		"organ_hit_chance" = list(BP_TORSO = 85), \
		"bone_strength" = list(BP_HEAD = 0, BP_TORSO = 0, BP_GROIN = 0, BP_L_FOOT = 0, BP_R_FOOT = 0, BP_L_LEG = 0, BP_R_LEG = 0, BP_L_ARM = 0, BP_R_ARM = 0, BP_L_HAND = 0, BP_R_HAND = 0), \
		"organ_multiplier" = list(BP_HEAD = 3.6, BP_TORSO = 3.5, BP_GROIN = 3.4)/*Only used for simple mobs*/, \
		"flesh_factors" = list("damage_mult" = 1.175,"velloss_mult" = 1.3))
	H.ballistic_variables = widelist(H.ballistic_variables)
