/datum/gear/cigar_case
	display_name = "cigar case"
	path = /obj/item/storage/fancy/cigar

/datum/gear/cigar_case/New()
	..()
	var/list/cigars = list()
	for(var/cigar in (typesof(/obj/item/storage/fancy/cigar)))
		var/obj/item/storage/fancy/cigar/cigar_brand = cigar
		cigars[initial(cigar_brand.name)] = cigar_brand
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(cigars))
/*				// The two below here are the versions outside of a tgui selection prompt.
/datum/gear/sm_lighter/safesmzippo
	display_name = "Supermatter Lighter, Hardlight"			// Base Supermatter zippo
	description = "A State of the Art Lighter holding an active supermatter shard in a containment field, this one is contained with a hardlight barrier."
	path = /obj/item/flame/lighter/safesmzippo

/datum/gear/sm_lighter/syndismzippo
	display_name = "Supermatter Lighter, Phoron"			// Syndicate Supermatter zippo
	description = "A State of the Art Lighter holding an active supermatter shard in a containment field, this one is contained with a phoron shield."
	path = /obj/item/flame/lighter/syndismzippo
*/
/datum/gear/sm_lighter
	display_name = "Supermatter Lighter Selection"
	path = /obj/item/flame/lighter/supermatter
	description = "State of the Art Supermatter Lighters."

/datum/gear/sm_lighter/New()
	..()
	var/list/sm_lighters = list()
	for(var/sm_lighter in typesof(/obj/item/flame/lighter/supermatter))
		if(sm_lighter in typesof(/obj/item/flame/lighter/supermatter/expsmzippo))	//		Removes the experimental/weapon variant of the SM Lighter
			continue
		var/obj/item/flame/lighter/supermatter/sm_lighter_type = sm_lighter
		sm_lighters[initial(sm_lighter_type.name)] = sm_lighter_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(sm_lighters))
