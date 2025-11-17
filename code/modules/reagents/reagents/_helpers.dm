/atom/movable/proc/can_be_injected_by(var/atom/injector)
	if(!Adjacent(get_turf(injector)))
		return FALSE
	if(!reagents)
		return FALSE
	if(!reagents.get_free_space())
		return FALSE
	return TRUE

// Helper for anything checking if it can inject a container like a syringe.
/atom/movable/proc/is_injectable_container()
	return is_open_container() || \
		istype(src, /obj/item/reagent_containers/food) || \
		istype(src, /obj/item/slime_extract) || \
		istype(src, /obj/item/clothing/mask/smokable/cigarette) || \
		istype(src, /obj/item/storage/fancy/cigarettes)

/obj/can_be_injected_by(var/atom/injector)
	if(!..())
		return FALSE
	// Then check if this is a type of container that can be injected
	return is_injectable_container()

/mob/living/can_be_injected_by(var/atom/injector)
	return ..() && (can_inject(null, 0, BP_TORSO) || can_inject(null, 0, BP_GROIN))
<<<<<<< HEAD

// Helper for anything checking if it can inject a container like a syringe.
/obj/proc/is_injectable_container()
	return is_open_container() || \
		istype(src, /obj/item/reagent_containers/food) || \
		istype(src, /obj/item/slime_extract) || \
		istype(src, /obj/item/clothing/mask/smokable/cigarette) || \
		istype(src, /obj/item/storage/fancy/cigarettes) || \
		istype(src, /obj/item/clothing/mask/chewable) // CHOMPEdit
=======
>>>>>>> 46877ee6b1 (fix some bad material handling (#18795))
