/*
//Objects related to the Metroids.
*/

//Projectile for the Metroids.
/obj/item/projectile/energy/metroidacid
	name = "metroid acid"
	icon_state = "neurotoxin"
	damage = 10
	damage_type = TOX
	agony = 10
	check_armour = "bio"
	armor_penetration = 50

//EGG! Metroid egg and its mechanics. Ripped from spiders.
/obj/effect/metroid/egg
	name = "egg cluster"
	desc = "It seems to pulse slightly with an inner life"
	icon = 'icons/mob/metroid/small.dmi'
	icon_state = "egg"
	var/amount_grown = 0
	var/metroid_type = /mob/living/simple_mob/metroid/juvenile/baby

/obj/effect/metroid/egg/Initialize(mapload, var/atom/parent)
	get_light_and_color(parent)
	. = ..()
	pixel_x = rand(3,-3)
	pixel_y = rand(3,-3)
	START_PROCESSING(SSobj, src)

/obj/effect/metroid/egg/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/effect/metroid/egg/process()
	amount_grown += rand(0,2)
	if(amount_grown >= 100)
		new metroid_type(src.loc, src)
		qdel(src)
