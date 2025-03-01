#define TRASH_BURN 0.05
#define LOW_BURN 0.1
#define GOOD_BURN 0.2
#define HIGH_BURN 0.5
#define SUPER_BURN 0.8
#define MEGA_BURN 1

#define LOW_CHANCE 3
#define MED_CHANCE 6
#define HIGH_CHANCE 12

#define BURN_TEMP_PAPER 	T0C + 150
#define BURN_TEMP_PLASTIC 	T0C + 350
#define BURN_TEMP_METAL 	T0C + 1400
#define BURN_TEMP_PHOROFIRE	T0C + 5000

// Additional fire_acts(), macro that assembles a proc that runs every time fire acts on the assigned object path of x.
// If it rolls the prob("c"hance) it will feed the lingering fire a 0 to 1 value as "b"urn.
// Then checks if the current turf temp is greater than t, is so it ex_act(1)s the object while leaving ash behind.
// With great agony, I wish to report that I feel like I'm coding in C98 with this bullshit - Willbird
#define FIREACT_BURNS(x,c,b,t) x/fire_act()\
{\
	if(prob(c))\
	{\
		var/turf/T = get_turf(src);\
		if(T)\
		{\
			var/datum/gas_mixture/G = T.return_air();\
			if(G && G.temperature >= t)\
			{\
				T.feed_lingering_fire(b);\
				new /obj/effect/decal/cleanable/ash(get_turf(src));\
				ex_act(1);\
			}\
		}\
	}\
};

//////////////////////////// TRASH BURN ////////////////////////////
FIREACT_BURNS(/obj/item/trash,HIGH_CHANCE,TRASH_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/paper,HIGH_CHANCE,TRASH_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/soap,LOW_CHANCE,TRASH_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/storage/pill_bottle,MED_CHANCE,TRASH_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/assembly/mousetrap,HIGH_CHANCE,TRASH_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/structure/table,LOW_CHANCE,TRASH_BURN,BURN_TEMP_METAL)
FIREACT_BURNS(/obj/structure/table/standard,LOW_CHANCE,TRASH_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/deck,LOW_CHANCE,TRASH_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/structure/closet,LOW_CHANCE,TRASH_BURN,BURN_TEMP_METAL)
FIREACT_BURNS(/obj/machinery/floodlight,LOW_CHANCE,TRASH_BURN,BURN_TEMP_PHOROFIRE)
FIREACT_BURNS(/obj/machinery/vending,LOW_CHANCE,TRASH_BURN,BURN_TEMP_PHOROFIRE)
FIREACT_BURNS(/obj/structure/loot_pile/mecha,LOW_CHANCE,TRASH_BURN,BURN_TEMP_PHOROFIRE)
FIREACT_BURNS(/obj/structure/table/marble,LOW_CHANCE,TRASH_BURN,BURN_TEMP_PHOROFIRE)
// The following two should be very limited to avoid frustrating crew
FIREACT_BURNS(/obj/structure/cable,LOW_CHANCE,TRASH_BURN,BURN_TEMP_PHOROFIRE) // Comment out if wires shouldn't be destroyed
FIREACT_BURNS(/obj/structure/disposalpipe/segment,LOW_CHANCE,TRASH_BURN,BURN_TEMP_PHOROFIRE) // Comment out if disposals shouldn't be destroyed
//////////////////////////// LOW BURN ////////////////////////////
FIREACT_BURNS(/obj/item/stack/material/plastic,LOW_CHANCE,LOW_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/paper_bin,HIGH_CHANCE,LOW_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/bedsheet,HIGH_CHANCE,LOW_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/book,HIGH_CHANCE,LOW_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/folder,HIGH_CHANCE,LOW_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/storage/fancy/cigar,HIGH_CHANCE,LOW_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/structure/flora/pottedplant,LOW_CHANCE,LOW_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/storage/box,MED_CHANCE,LOW_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/juke_remote,LOW_CHANCE,LOW_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/mop,LOW_CHANCE,LOW_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/storage/pouch,LOW_CHANCE,LOW_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/storage/backpack,LOW_CHANCE,LOW_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/storage/bag/trash,LOW_CHANCE,LOW_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/reagent_containers/food,LOW_CHANCE,LOW_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/packageWrap,HIGH_CHANCE,LOW_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/tape_roll,LOW_CHANCE,LOW_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/structure/sign/christmas,LOW_CHANCE,LOW_BURN,BURN_TEMP_PLASTIC) // IT CRIMBO, OH NO IT CRIMBO
FIREACT_BURNS(/obj/structure/table/woodentable,MED_CHANCE,LOW_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/structure/table/gamblingtable,MED_CHANCE,LOW_BURN,BURN_TEMP_PAPER)
//////////////////////////// GOOD BURN ////////////////////////////
FIREACT_BURNS(/obj/item/stack/material/stick,MED_CHANCE,GOOD_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/stack/material/wax,MED_CHANCE,GOOD_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/stack/material/fur,MED_CHANCE,GOOD_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/structure/closet/crate/laundry,MED_CHANCE,GOOD_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/structure/bookcase,LOW_CHANCE,GOOD_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/structure/simple_door/wood,LOW_CHANCE,GOOD_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/item/instrument,LOW_CHANCE,GOOD_BURN,BURN_TEMP_METAL)
FIREACT_BURNS(/obj/item/toy/plushie,MED_CHANCE,GOOD_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/towel,HIGH_CHANCE,GOOD_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/structure/closet/crate/wooden,MED_CHANCE,GOOD_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/structure/bed,MED_CHANCE,GOOD_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/structure/curtain,MED_CHANCE,GOOD_BURN,BURN_TEMP_PLASTIC)
FIREACT_BURNS(/obj/item/clothing,LOW_CHANCE,GOOD_BURN,BURN_TEMP_PLASTIC)
//////////////////////////// HIGH BURN ////////////////////////////
FIREACT_BURNS(/obj/item/stack/material/wood,MED_CHANCE,HIGH_BURN,BURN_TEMP_PAPER)
FIREACT_BURNS(/obj/structure/flora/tree,LOW_CHANCE,HIGH_BURN,BURN_TEMP_METAL)
//////////////////////////// MEGA BURN ////////////////////////////
FIREACT_BURNS(/obj/item/stack/material/phoron,MED_CHANCE,MEGA_BURN,PHORON_FLASHPOINT)
FIREACT_BURNS(/obj/structure/trash_pile,LOW_CHANCE,MEGA_BURN,BURN_TEMP_PLASTIC)

// Suits need special handling to avoid fires destroying rigs and such
/obj/item/clothing/suit/fire_act()
	return

// If cables can burn, do not burn these, no way to make them properly ingame
/obj/structure/cable/heavyduty/fire_act()
	return

// anti-lag ash cleanup, also includes blood and oil fuel sources
/obj/effect/decal/cleanable/fire_act()
	if(prob(MED_CHANCE))
		var/turf/T = get_turf(src)
		T?.feed_lingering_fire(0.025)
		qdel(src)

#undef FIREACT_BURNS

#undef LOW_CHANCE
#undef MED_CHANCE
#undef HIGH_CHANCE

#undef TRASH_BURN
#undef LOW_BURN
#undef GOOD_BURN
#undef HIGH_BURN
#undef SUPER_BURN
#undef MEGA_BURN

#undef BURN_TEMP_PAPER
#undef BURN_TEMP_PLASTIC
#undef BURN_TEMP_METAL
#undef BURN_TEMP_PHOROFIRE
