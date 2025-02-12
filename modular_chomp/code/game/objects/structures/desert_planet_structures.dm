// Props
/obj/structure/prop/desert_rock
	icon = 'modular_chomp/icons/obj/desert_planet/desert_rocks.dmi'
	desc = "Sandy and smooth from erosion."
	density = TRUE
	anchored = TRUE
	icon_state = "desert_rock0"

/obj/structure/prop/desert_rock/rock
	name = "desert rock"

/obj/structure/prop/desert_rock/rock/attack_hand(mob/living/user)
	if(user.is_incorporeal())
		return
	to_chat(user, "You push on the [src].")
	var/movedir = user.dir
	if(do_after(user, 3 SECONDS, src))
		step(src, movedir)

/obj/structure/prop/desert_rock/rock/Initialize(mapload)
	. = ..()
	icon_state = "desert_rock[rand(0,6)]"

/obj/structure/prop/desert_rock/pebble
	name = "sandy pebble"
	density = FALSE

/obj/structure/prop/desert_rock/pebble/Crossed(atom/movable/AM as mob|obj)
	if(AM.is_incorporeal())
		return
	if(istype(AM, /mob/living))
		var/mob/living/M = AM
		if(M.m_intent == I_RUN && prob(5))
			M.Weaken(2)
			to_chat(M, "You trip over the [src]!")

/obj/structure/prop/desert_rock/pebble/Initialize(mapload)
	. = ..()
	icon_state = "desert_pebble[rand(0,6)]"

/obj/structure/prop/desert_rock/anthill
	name = "ant hill"
	desc = "See how many ants you can spot."
	icon = 'modular_chomp/icons/obj/desert_planet/desert_plants.dmi'
	icon_state = "anthill0"

/obj/structure/prop/desert_rock/anthill/Initialize(mapload)
	. = ..()
	icon_state = "anthill[rand(0,2)]"

/obj/structure/prop/desert_planet64x64
	name = "large rock"
	desc = "Sandy and smooth from erosion."
	icon = 'modular_chomp/icons/obj/desert_planet/desert_props_64x64.dmi'
	density = TRUE
	anchored = TRUE
	can_buckle = FALSE

/obj/structure/prop/desert_planet64x64/lrock
	icon_state = "lrock"

/obj/structure/prop/desert_planet64x64/lrock1
	icon_state = "lrock1"

/obj/structure/prop/desert_planet64x64/lrock2
	icon_state = "lrock2"

/obj/structure/prop/desert_planet64x64/lrock3
	icon_state = "lrock3"

/obj/structure/prop/desert_planet64x64/lrock4
	icon_state = "lrock4"

/obj/structure/prop/desert_planet64x64/lribs
	name = "ribs"
	desc = "Bleached white by baking sunlight."
	icon_state = "lribs"

/obj/structure/prop/desert_planet64x64/lribs1
	name = "ribs"
	desc = "Bleached white by baking sunlight."
	icon_state = "lribs1"

/obj/structure/prop/desert_planet64x64/lskull
	name = "skull"
	desc = "Bleached white by baking sunlight."
	icon_state = "lskull"

/obj/structure/prop/desert_planet64x64/lbone
	name = "bone"
	desc = "Bleached white by baking sunlight."
	icon_state = "lbone"

/obj/structure/prop/desert_planet64x64/palmuria
	name = "palm"
	desc = "Stout and bushy."
	icon_state = "palmuria"
	density = 0 //theyre smol

/obj/structure/prop/desert_planet64x64/palmuria1
	name = "palm"
	desc = "Stout and bushy."
	icon_state = "palmuria1"
	density = 0 //theyre smol

/obj/structure/prop/desert_planet160x160
	name = "desert large boulder"
	desc = "Sandy and smooth from erosion."
	icon = 'modular_chomp/icons/obj/desert_planet/desert_planet_160x160.dmi'
	density = TRUE
	anchored = TRUE
	can_buckle = FALSE

/obj/structure/prop/desert_planet160x160/largeboulder
	icon_state = "large_boulder"

/obj/structure/prop/desert_planet160x160/tallboulder
	icon_state = "tall_boulder"

/obj/structure/prop/desert_planet160x160/boulder
	icon_state = "boulder"

/obj/structure/prop/desert_planet160x160/lcactus
	name = "cactus"
	desc = "Large and prickly."
	icon_state = "lcactus"

/obj/structure/prop/desert_planet160x160/lcactus1
	name = "cactus"
	desc = "Large and prickly."
	icon_state = "lcactus1"

/obj/structure/prop/desert_planet160x160/lcactus2
	name = "cactus"
	desc = "Large and prickly."
	icon_state = "lcactus2"

/obj/structure/prop/desert_planet160x160/lcactus3
	name = "cactus"
	desc = "Large and prickly."
	icon_state = "lcactus3"

// Flora
/obj/structure/flora/desert_planet
	name = "desert plant"
	desc = "Probably a succulent."
	icon = 'modular_chomp/icons/obj/desert_planet/desert_plants.dmi'

/obj/structure/flora/desert_planet/potted_plant
	name = "potted plant"
	desc = "Colloquially known as a pot plant."
	icon_state = "potplant0"

/obj/structure/flora/desert_planet/potted_plant/Initialize(mapload)
	. = ..()
	icon_state = "potplant[rand(0,2)]"

/obj/structure/flora/desert_planet/thicket
	name = "thicket"
	desc = "Weedy growths."
	icon_state = "thicket0"

/obj/structure/flora/desert_planet/thicket/Initialize(mapload)
	. = ..()
	icon_state = "thicket[rand(0,6)]"

/obj/structure/flora/desert_planet/shrub
	name = "shrub"
	desc = "Dense and weedy."
	icon_state = "shrub0"

/obj/structure/flora/desert_planet/shrub/Initialize(mapload)
	. = ..()
	icon_state = "shrub[rand(0,5)]"

/obj/structure/flora/desert_planet/bush
	name = "bush"
	desc = "Denser and weedier."
	icon_state = "bush0"

/obj/structure/flora/desert_planet/bush/Initialize(mapload)
	. = ..()
	icon_state = "bush[rand(0,5)]"

/obj/structure/flora/desert_planet/barrelcacti
	name = "barrel cacti"
	desc = "Small, adorable, and begging for a hug."
	icon_state = "barrelcacti0"

/obj/structure/flora/desert_planet/barrelcacti/Initialize(mapload)
	. = ..()
	icon_state = "barrelcacti[rand(0,3)]"

/obj/structure/flora/desert_planet/palmy
	name = "yucca bush"
	desc = "Probably not actually a yucca."
	icon_state = "palmy0"

/obj/structure/flora/desert_planet/palmy/Initialize(mapload)
	. = ..()
	icon_state = "palmy[rand(0,2)]"

/obj/structure/flora/desert_planet/shrubber
	name = "thorny bush"
	desc = "Makes for great fur accessories."
	icon_state = "shrubber0"

/obj/structure/flora/desert_planet/shrubber/Initialize(mapload)
	. = ..()
	icon_state = "shrubber[rand(0,2)]"

/obj/structure/flora/desert_planet/lbarrelcacti
	name = "barrel cactus"
	desc = "Absolutely begging for pets."
	icon_state = "lbarrelcacti0"

/obj/structure/flora/desert_planet/lbarrelcacti/Initialize(mapload)
	. = ..()
	icon_state = "lbarrelcacti[rand(0,2)]"

// Trees
/obj/structure/flora/tree/desert_planet
	name = "palm tree"
	desc = "Tall palm tree, makes for a good shade."
	icon = 'modular_chomp/icons/obj/desert_planet/desert_planet_160x160.dmi'
	density = FALSE
	anchored = TRUE
	can_buckle = FALSE
	product = /obj/item/stack/material/log
	product_amount = 50
	health = 2000
	max_health = 2000
	//var/fruit

/obj/structure/flora/tree/desert_planet/palmtreeb
	icon_state = "palmtreeb"
	base_state = "palmr" // Necessary for stumps to work.

/obj/structure/flora/tree/desert_planet/palmtreeb1
	icon_state = "palmtreeb1"
	base_state = "palml"

/obj/structure/flora/tree/desert_planet/palmtree
	icon_state = "palmtree"
	base_state = "palmr"

/obj/structure/flora/tree/desert_planet/palmtree1
	icon_state = "palmtree1"
	base_state = "palml"

/obj/structure/flora/tree/desert_planet/mpalmtreeb
	icon_state = "mpalmtreeb"
	base_state = "palmr"

/obj/structure/flora/tree/desert_planet/mpalmtreeb1
	icon_state = "mpalmtreeb1"
	base_state = "palml"

/obj/structure/flora/tree/desert_planet/mpalmtree
	icon_state = "mpalmtree"
	base_state = "palml"

/obj/structure/flora/tree/desert_planet/mpalmtree1
	icon_state = "mpalmtree1"
	base_state = "palmr"

/obj/structure/flora/tree/desert_planet/spalmtree
	icon_state = "spalmtree"
	base_state = "palmls"

/obj/structure/flora/tree/desert_planet/spalmtree1
	icon_state = "spalmtree1"
	base_state = "palmrs"

/obj/structure/flora/tree/desert_planet/spalmtree3
	icon_state = "spalmtree3"
	base_state = "palmls"

/obj/structure/flora/tree/desert_planet/spalmtree4
	icon_state = "spalmtree4"
	base_state = "palmrs"

/obj/structure/flora/tree/desert_planet/desert_tree
	name = "barren tree"
	desc = "Completely barren."
	icon_state = "desert_tree"
	base_state = "desert"

/obj/structure/flora/tree/desert_planet/desert_tree1
	name = "gnarled tree"
	desc = "Twisted but living."
	icon_state = "desert_tree1"
	base_state = "desert"

/obj/structure/flora/tree/desert_planet/desert_tree3
	name = "hardy tree"
	desc = "Thriving despite the conditions."
	icon_state = "desert_tree3"
	base_state = "desert"
	product_amount = 100
	health = 4000
	max_health = 4000
