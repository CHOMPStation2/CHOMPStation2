/datum/trait/neutral/xenochimera_YR3
	sort = TRAIT_SORT_SPECIES
	allowed_species = list(SPECIES_XENOCHIMERA)
	name = "Xenochimera: YR3 strain"
	desc = "You're a xenochimera formed of a novel strain of the Roanoke's disease. Compared \
			to a normal xenochimera, you're far slower, hit harder, and have blunter claws. \
			The virus is adapted to a hotter environment, and you're resistant to burns and heat. \
			A strange quirk of the infection results in your body readily consuming nanotech"
	cost = 0
	category = 0
	custom_only = FALSE
	special_env = TRUE
	excludes = list(/datum/trait/negative/speed_slow_plus, /datum/trait/negative/speed_slow, /datum/trait/neutral/hotadapt, /datum/trait/neutral/coldadapt)
	var_changes = list("slowdown" = 1,  "burn_mod" = 0.7, "unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch/chimera, /datum/unarmed_attack/bite/sharp), "heat_level_1" = 420, "heat_level_2" = 480, "heat_level_3" = 1100, "breath_heat_level_1" = 450, "breath_heat_level_2" = 530, "breath_heat_level_3" = 1500, "heat_discomfort_level" = 390) //xenochim are already tank

/datum/trait/neutral/xenochimera_YR3/handle_environment_special(mob/living/carbon/human/H)
	var/list/nanitereagents = list(REAGENT_HEALINGNANITES, REAGENT_SHREDDINGNANITES, REAGENT_IRRADIATEDNANITES, REAGENT_NEUROPHAGENANITES, REAGENT_NIFREPAIRNANITES)
	if(istype(H.loc, /turf/simulated/floor/water/digestive_enzymes/nanites))
		var/turf/simulated/floor/water/digestive_enzymes/nanites/N = H.loc
		if(N.active)
			N.toggle_all(FALSE)
	for(var/reagent in nanitereagents)
		if(H.reagents.has_reagent(reagent))
			H.adjust_nutrition(H.reagents.get_reagent_amount(reagent))
			H.reagents.del_reagent(reagent)
	if(H.nif)
		var/obj/item/nif/implant = H.nif
		implant.wear(5)
		H.adjust_nutrition(10)
		if(!implant.durability)
			implant.unimplant(H)
			QDEL_NULL(implant)
			H.adjust_nutrition(100)
			to_chat(H, span_critical("Your NIF lets out one last sputter as it finally gives out"))

/datum/trait/neutral/mobegglaying
	name = "Egg Laying"
	desc = "You can lay eggs, much like an avian."
	cost = 0
	custom_only = FALSE

/datum/trait/neutral/mobegglaying/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/proc/mobegglaying)

/datum/trait/neutral/succubus_bite
	name = "Succubus Bite"
	desc = "Allows you to inject your prey with poison, much like a venemous snake."
	cost = 0
	custom_only = FALSE

/datum/trait/neutral/succubus_bite/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..()
	add_verb(H,/mob/living/proc/succubus_bite)

/datum/trait/neutral/hotadapt
	can_take = ORGANICS | SYNTHETICS //I think synths made for high heat should exist, considering they can be made spaceproof easily anyhow
	custom_only = FALSE

/datum/trait/neutral/coldadapt
	custom_only = FALSE

/datum/trait/neutral/abnormal_mind
	custom_only = FALSE //I see a lot of xenochimera that have this as a trope.
	can_take = ORGANICS | SYNTHETICS //I see more synths with dual minds than organics!
