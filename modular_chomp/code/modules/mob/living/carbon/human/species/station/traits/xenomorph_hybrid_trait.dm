/*	Shamelessly stolen from xenochimera_trait_vr.dm
**	For now, these are just neutral traits for Xenomorph Hybrids only to take.
**	Traits defined as custom_only = FALSE in neutral.dm will be available for Xenomorph Hybrids to take as well.
**	As such, be careful not to duplicate the traits, and only add dupes where necessary.
**	However, if custom_only = FALSE is set, then any species including things like humans can take it. A little silly.
**	Therefore, use this file only for Xenomorph Hybrid traits that you want to keep custom + Xenomorph Hybrid only.
*/

/datum/trait/neutral/xenomorph_praetorian
	sort = TRAIT_SORT_SPECIES
	allowed_species = list(SPECIES_XENOMORPH_HYBRID)
	name = "Xenomorph Hybrid: Praetorian"
	desc = "Our body has shifted and matured to take the shape and stature of a Praetorian. Our \
			bulky size impedes our speed, but we feel significantly tougher and stronger."
	cost = 0
	category = 0
	custom_only = FALSE
	var_changes = list("item_slowdown_mod" = 0.5, "total_health" = 175, "brute_mod" = 0.8, "slowdown" = 0.1) // Can carry heavy stuff better, more health, more brute resist, but slight slowdown.

/datum/trait/neutral/xenomorph_warrior
	sort = TRAIT_SORT_SPECIES
	allowed_species = list(SPECIES_XENOMORPH_HYBRID)
	name = "Xenomorph Hybrid: Warrior"
	desc = "Our body has shifted and matured to take the shape and stature of a Warrior. Compared \
			to a drone, we feel more resistant to stunning effects."
	cost = 0
	category = 0
	custom_only = FALSE
	var_changes = list("stun_mod" = 0.8, "weaken_mod" = 0.8) // Has 20% faster recovery for stun and weaken effects.

/datum/trait/neutral/xenomorph_hunter
	sort = TRAIT_SORT_SPECIES
	allowed_species = list(SPECIES_XENOMORPH_HYBRID)
	name = "Xenomorph Hybrid: Hunter"
	desc = "Our body has shifted and matured to take the shape and stature of a Hunter. Our \
			flexibility and speed is like no other, but our form has grown more \
			fragile as a result."
	cost = 0
	category = 0
	custom_only = FALSE
	var_changes = list("slowdown" = -0.5, "item_slowdown_mod" = 0.5, "total_health" = 125) // Much faster and carry-capable, but slightly less tanky.
	has_preferences = list("pass_table" = list(TRAIT_PREF_TYPE_BOOLEAN, "On spawn", TRAIT_NO_VAREDIT_TARGET, TRUE))

/datum/trait/neutral/xenomorph_hunter/apply(var/datum/species/S,var/mob/living/carbon/human/H, var/list/trait_prefs)
	..()
	if (trait_prefs?["pass_table"] || !trait_prefs)
		H.pass_flags |= PASSTABLE
	add_verb(H,/mob/living/proc/toggle_pass_table) //CHOMPEdit TGPanel

/datum/trait/neutral/xenomorph_queen
	sort = TRAIT_SORT_SPECIES
	allowed_species = list(SPECIES_XENOMORPH_HYBRID)
	name = "Xenomorph Hybrid: Queen"
	desc = "Our body has shifted and matured to take the shape and stature of a mighty Queen. Our \
			strength is unparalleled."
	cost = 0
	category = 0
	custom_only = FALSE
	var_changes = list("total_health" = 200) // Bigger health pool
