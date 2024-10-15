/obj/structure/closet/crate/mimic/airlock
	name = "Dusty Airlock"
	desc = "It opens and closes. Though it appears it has been a while since it opened."
	icon = 'modular_chomp/icons/mob/animal_ch.dmi'
	icon_state = "amimic"
	mimic_chance = 30
	anchored = 1 //You will not be able to push back the airlock mimic
	density = 1
	opacity = 1

/obj/structure/closet/crate/mimic/airlock/open()
	if(src.opened)
		return 0
	if(!src.can_open())
		return 0

	if(mimic_active)
		mimic_active = FALSE
		if(prob(mimic_chance))
			var/mob/living/simple_mob/vore/aggressive/mimic/airlock/new_mimic = new(loc, src)
			visible_message(span_bolddanger("The [new_mimic] suddenly growls as it turns out to be a mimic!")) //Controls the vars of the mimic that spawns
			forceMove(new_mimic)
			new_mimic.real_crate = src
			new_mimic.name = name
			new_mimic.desc = desc
			new_mimic.icon_state = "amimicopen"
			new_mimic.icon_living = "amimicopen"
		else
			qdel(src.loc)
			new/obj/machinery/door/airlock/maintenance/common (src.loc) //Places the Airlock
			qdel(src)//Deletes the "mimic"
			return ..()
	else
		return ..()

/obj/structure/closet/crate/mimic/airlock/ex_act(severity) //Stores Mimic Contents for later
	for(var/obj/O in src.contents)
		qdel(O)
	qdel(src)
	return

/obj/structure/closet/crate/mimic/airlock/damage(var/damage)
	if(contents.len)
		visible_message(span_bolddanger("The [src] let's out an enraged screach!"))
		for(var/obj/O in src.contents)
			qdel(O)
	..()

/obj/structure/closet/crate/mimic/airlock/safe
	mimic_chance = 0

/obj/structure/closet/crate/mimic/airlock/guaranteed
	mimic_chance = 100

/obj/structure/closet/crate/mimic/airlock/dangerous
	mimic_chance = 70

/obj/structure/closet/crate/mimic/airlock/cointoss
	mimic_chance = 50

/mob/living/simple_mob/vore/aggressive/mimic/airlock
	name = "Maintnence Access"
	desc = "It opens and closes."
	icon_state = "amimicopen"
	icon_living = "amimicopen"

	maxHealth = 250
	health = 250
	movement_cooldown = 10

	melee_damage_lower = 15
	melee_damage_upper = 30
	attack_armor_pen = 50 //Its jaw is an airlock. Its got enough bite strength.

	armor = list(
				"melee" = 70,
				"bullet" = 30,
				"laser" = 30,
				"energy" = 30,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100) //Its an airlock.

/mob/living/simple_mob/vore/aggressive/mimic/airlock/will_show_tooltip()
	return FALSE

/mob/living/simple_mob/vore/aggressive/mimic/airlock/death()
	new/obj/machinery/door/airlock/maintenance/common (src.loc)
	real_crate = null
	qdel(src)


//Less Terrifying Closet Mimic
/obj/structure/closet/crate/mimic/closet
	name = "old closet"
	desc = "It's a basic storage unit. It seems awfully rickety."
	icon = 'modular_chomp/icons/mob/animal_ch.dmi'
	icon_state = "cmimic"
	mimic_chance = 30
	mimic_active = TRUE

/obj/structure/closet/crate/mimic/closet/update_icon()
	if(opened)
		icon_state = "copen"
	else
		icon_state = "cmimic"

/obj/structure/closet/crate/mimic/closet/open()
	if(src.opened)
		return 0
	if(!src.can_open())
		return 0

	if(mimic_active)
		mimic_active = FALSE
		if(prob(mimic_chance))
			var/mob/living/simple_mob/vore/aggressive/mimic/closet/new_mimic = new(loc, src)
			visible_message(span_bolddanger("The [new_mimic] suddenly growls as it turns out to be a mimic!")) //Controls the mimic that spawns
			forceMove(new_mimic)
			new_mimic.real_crate = src
			new_mimic.name = name
			new_mimic.desc = desc
			new_mimic.icon_state = "cmimicopen"
			new_mimic.icon_living = "cmimicopen"
		else
			return ..()
	else
		return ..()

/obj/structure/closet/crate/mimic/closet/ex_act(severity) //Stores Mimic Contents for later
	for(var/obj/O in src.contents)
		qdel(O)
	qdel(src)
	return

/obj/structure/closet/crate/mimic/closet/damage(var/damage)
	if(contents.len)
		visible_message(span_bolddanger("The [src] makes out a crunchy noise as its contents are destroyed!"))
		for(var/obj/O in src.contents)
			qdel(O)
	..()

/obj/structure/closet/crate/mimic/closet/safe
	mimic_chance = 0
	mimic_active = FALSE

/obj/structure/closet/crate/mimic/closet/guaranteed
	mimic_chance = 100

/obj/structure/closet/crate/mimic/closet/dangerous
	mimic_chance = 70

/obj/structure/closet/crate/mimic/closet/cointoss
	mimic_chance = 50

/mob/living/simple_mob/vore/aggressive/mimic/closet
	name = "old closet"
	desc = "It's a basic storage unit. It seems awfully rickety."
	icon_state = "cmimicopen"
	icon_living = "cmimicopen"

	maxHealth = 150
	health = 150
	movement_cooldown = 7

	melee_damage_lower = 10
	melee_damage_upper = 20
	attack_armor_pen =  25 // NOM NOM

	armor = list(
				"melee" = 10,
				"bullet" = 20,
				"laser" = 20,
				"energy" = 20,
				"bomb" = 20,
				"bio" = 100,
				"rad" = 100)

/mob/living/simple_mob/vore/aggressive/mimic/closet/will_show_tooltip()
	return FALSE

/mob/living/simple_mob/vore/aggressive/mimic/closet/death()
	..()
	if(real_crate)
		real_crate.forceMove(loc)
	real_crate = null
	qdel(src)

//Floor Mimics... Because mimics you have to interact with to activate was not enough...

/obj/effect/floormimic //As Floor Mimics are triggered by bumps rather than click interaction... They are effects rather than structures
	name = "loose wooden floor"
	desc = "The boards here look rather loose."
	density = 0
	anchored = 1
	icon = 'modular_chomp/icons/mob/animal_ch.dmi'
	icon_state = "wmimic"
	var/mimic_chance = 30
	var/mimic_active = TRUE
	var/mimic_type = /mob/living/simple_mob/vore/aggressive/mimic/floor

/obj/effect/floormimic/Crossed(atom/movable/AM)
	. = ..()
	tryTrigger(AM)

/obj/effect/floormimic/Bumped(atom/movable/AM)
	. = ..()
	tryTrigger(AM)

/obj/effect/floormimic/proc/tryTrigger(atom/movable/victim)
	if(!isliving(victim))
		return
	var/mob/living/L = victim
	if(L.hovering)
		return
	awaken(L)

/obj/effect/floormimic/proc/awaken(mob/living/L)
	if(!mimic_active)
		qdel(src)
		return
	mimic_active = FALSE
	if(!prob(mimic_chance))
		qdel(src)
		return
	var/mob/living/simple_mob/vore/aggressive/mimic/floor/new_mimic = new mimic_type(drop_location())
	visible_message(span_boldwarning("The [new_mimic] suddenly growls beneath you as it turns out to be a mimic!"))
	qdel(src)

/obj/effect/floormimic/attackby(obj/item/I, mob/living/L)
	if(mimic_active)
		awaken(L)
	else
		return ..()

/obj/effect/floormimic/ex_act(severity)
	qdel(src)

/obj/effect/floormimic/safe
	mimic_chance = 0

/obj/effect/floormimic/guaranteed
	mimic_chance = 100

/obj/effect/floormimic/dangerous
	mimic_chance = 70

/obj/effect/floormimic/cointoss
	mimic_chance = 50

/mob/living/simple_mob/vore/aggressive/mimic/floor
	name = "loose wooden floor"
	desc = "The boards here look rather loose."
	icon_state = "wmimicopen"
	icon_living = "wmimicopen"

	faction = "mimic"

	maxHealth = 100
	health = 100
	movement_cooldown = 5

	response_help = "touches"
	response_disarm = "pushes"
	response_harm = "hits"

	melee_damage_lower = 5
	melee_damage_upper = 5
	base_attack_cooldown = 5

/mob/living/simple_mob/vore/aggressive/mimic/floor/death()
	qdel(src)

/obj/effect/floormimic/tile
	name = "loose floor tiles"
	desc = "The tiles here look rather loose."
	density = FALSE
	anchored = TRUE
	icon_state = "tmimic"
	mimic_type = /mob/living/simple_mob/vore/aggressive/mimic/floor/tile

/obj/effect/floormimic/tile/safe
	mimic_chance = 0

/obj/effect/floormimic/tile/guaranteed
	mimic_chance = 100

/obj/effect/floormimic/tile/dangerous
	mimic_chance = 70

/obj/effect/floormimic/tile/cointoss
	mimic_chance = 50

/mob/living/simple_mob/vore/aggressive/mimic/floor/tile
	name = "loose floor tiles"
	desc = "The tiles here look rather loose."
	icon_state = "tmimicopen"
	icon_living = "tmimicopen"

	faction = "mimic"

	maxHealth = 125
	health = 125
	movement_cooldown = 7

	response_help = "touches"
	response_disarm = "pushes"
	response_harm = "hits"

	melee_damage_lower = 15
	melee_damage_upper = 15
	base_attack_cooldown = 10

/obj/effect/floormimic/plating
	name = "loose plating"
	desc = "The plating here looks rather loose."
	density = FALSE
	anchored = TRUE
	icon_state = "pmimic"
	mimic_type = /mob/living/simple_mob/vore/aggressive/mimic/floor/plating

/obj/effect/floormimic/plating/safe
	mimic_chance = 0

/obj/effect/floormimic/plating/guaranteed
	mimic_chance = 100

/obj/effect/floormimic/plating/dangerous
	mimic_chance = 70

/obj/effect/floormimic/plating/cointoss
	mimic_chance = 50

/mob/living/simple_mob/vore/aggressive/mimic/floor/plating
	name = "loose plating"
	desc = "The plating here look rather loose."
	icon_state = "pmimicopen"
	icon_living = "pmimicopen"

	faction = "mimic"

	maxHealth = 150
	health = 150
	movement_cooldown = 7

	response_help = "touches"
	response_disarm = "pushes"
	response_harm = "hits"

	melee_damage_lower = 15
	melee_damage_upper = 15
	base_attack_cooldown = 10
	attack_armor_pen = 50
