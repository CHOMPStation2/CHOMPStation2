#define TRASH_BURN 0.05
#define LOW_BURN 0.1
#define GOOD_BURN 0.2
#define HIGH_BURN 0.5
#define SUPER_BURN 0.8
#define MEGA_BURN 1

#define LOW_CHANCE 3
#define MED_CHANCE 6
#define HIGH_CHANCE 12

// Additional fire_acts(), macro that assembles a proc that runs every time fire acts on the assigned object path of x.
// If it rolls the prob("c"hance) it will feed the lingering fire a 0 to 1 value as "b"urn. Then ex_act(1) the object while leaving ash behind.
// With great agony, I wish to report that I feel like I'm coding in C98 with this bullshit - Willbird
#define FIREACT_BURNS(x,c,b) x/fire_act(){if(prob(c)){var/turf/T = get_turf(src);T?.feed_lingering_fire(b);new /obj/effect/decal/cleanable/ash(get_turf(src));ex_act(1);}}

//////////////////////////// TRASH BURN ////////////////////////////
FIREACT_BURNS(/obj/item/trash,HIGH_CHANCE,TRASH_BURN)
FIREACT_BURNS(/obj/item/paper,HIGH_CHANCE,TRASH_BURN)
FIREACT_BURNS(/obj/item/soap,LOW_CHANCE,TRASH_BURN)
FIREACT_BURNS(/obj/item/storage/pill_bottle,MED_CHANCE,TRASH_BURN)
FIREACT_BURNS(/obj/item/assembly/mousetrap,HIGH_CHANCE,TRASH_BURN)
FIREACT_BURNS(/obj/structure/table/standard,LOW_CHANCE,TRASH_BURN)
FIREACT_BURNS(/obj/item/deck,LOW_CHANCE,TRASH_BURN)
//////////////////////////// LOW BURN ////////////////////////////
FIREACT_BURNS(/obj/item/stack/material/plastic,LOW_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/paper_bin,HIGH_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/bedsheet,HIGH_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/book,HIGH_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/folder,HIGH_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/storage/fancy/cigar,HIGH_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/structure/flora/pottedplant,LOW_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/storage/box,MED_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/juke_remote,LOW_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/mop,LOW_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/storage/pouch,LOW_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/storage/backpack,LOW_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/storage/bag/trash,LOW_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/reagent_containers/food,LOW_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/packageWrap,HIGH_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/item/tape_roll,LOW_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/structure/sign/christmas,LOW_CHANCE,LOW_BURN) // IT CRIMBO, OH NO IT CRIMBO
FIREACT_BURNS(/obj/structure/table/woodentable,MED_CHANCE,LOW_BURN)
FIREACT_BURNS(/obj/structure/table/gamblingtable,MED_CHANCE,LOW_BURN)
//////////////////////////// GOOD BURN ////////////////////////////
FIREACT_BURNS(/obj/item/stack/material/stick,MED_CHANCE,GOOD_BURN)
FIREACT_BURNS(/obj/item/stack/material/wax,MED_CHANCE,GOOD_BURN)
FIREACT_BURNS(/obj/structure/bookcase,LOW_CHANCE,GOOD_BURN)
FIREACT_BURNS(/obj/structure/simple_door/wood,LOW_CHANCE,GOOD_BURN)
FIREACT_BURNS(/obj/item/instrument,LOW_CHANCE,GOOD_BURN)
FIREACT_BURNS(/obj/item/toy/plushie,MED_CHANCE,GOOD_BURN)
FIREACT_BURNS(/obj/item/towel,HIGH_CHANCE,GOOD_BURN)
FIREACT_BURNS(/obj/structure/closet/crate/wooden,MED_CHANCE,GOOD_BURN)
FIREACT_BURNS(/obj/structure/bed,MED_CHANCE,GOOD_BURN)
//////////////////////////// HIGH BURN ////////////////////////////
FIREACT_BURNS(/obj/item/stack/material/wood,MED_CHANCE,HIGH_BURN)
FIREACT_BURNS(/obj/structure/flora/tree,LOW_CHANCE,HIGH_BURN)
//////////////////////////// MEGA BURN ////////////////////////////
FIREACT_BURNS(/obj/item/stack/material/phoron,MED_CHANCE,MEGA_BURN)

// The remaining proc is defined without the macro to give an example of what the macro used above outputs.
/obj/item/clothing/fire_act()
	if(prob(LOW_CHANCE))
		var/turf/T = get_turf(src)
		T?.feed_lingering_fire(GOOD_BURN)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
		ex_act(1)

// Suits need special handling to avoid fires destroying rigs
/obj/item/clothing/suit/fire_act()
	return

// anti-lag ash cleanup
/obj/effect/decal/cleanable/ash/fire_act()
	if(prob(2))
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
