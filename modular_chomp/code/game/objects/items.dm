/obj/item
	var/item_tf_spawn_allowed = FALSE
	var/list/ckeys_allowed_itemspawn = list()

/obj/item/proc/item_tf_spawnpoint_set()
	if(!item_tf_spawn_allowed)
		item_tf_spawn_allowed = TRUE
		item_tf_spawnpoints += src

/obj/item/proc/item_tf_spawnpoint_used()
	if(item_tf_spawn_allowed)
		item_tf_spawn_allowed = FALSE
		item_tf_spawnpoints -= src

/obj/item/Destroy(force, ...)
	if(item_tf_spawn_allowed)
		item_tf_spawnpoints -= src
	return ..()
