/decl/hierarchy/outfit/tournament_gear
	hierarchy_type = /decl/hierarchy/outfit/tournament_gear
	head = /obj/item/clothing/head/helmet/thunderdome
	suit = /obj/item/clothing/suit/armor/vest
	l_hand = /obj/item/material/knife // CHOMPEdit - Removal of obj/item/weapon
	r_hand = /obj/item/gun/energy/pulse_rifle/destroyer // CHOMPEdit - Removal of obj/item/weapon
	r_pocket = /obj/item/grenade/smokebomb // CHOMPEdit - Removal of obj/item/weapon
	shoes = /obj/item/clothing/shoes/black

/decl/hierarchy/outfit/tournament_gear/red
	name = "Tournament - Red"
	uniform = /obj/item/clothing/under/color/red

/decl/hierarchy/outfit/tournament_gear/green
	name = "Tournament gear - Green"
	uniform = /obj/item/clothing/under/color/green

/decl/hierarchy/outfit/tournament_gear/gangster
	name = "Tournament gear - Gangster"
	head = /obj/item/clothing/head/det
	uniform = /obj/item/clothing/under/det
	suit_store = /obj/item/clothing/suit/storage/det_trench
	glasses = /obj/item/clothing/glasses/thermal/plain/monocle
	r_hand = /obj/item/gun/projectile/revolver // CHOMPEdit - Removal of obj/item/weapon
	l_pocket = /obj/item/ammo_magazine/s357

/decl/hierarchy/outfit/tournament_gear/chef
	name = "Tournament gear - Chef"
	head = /obj/item/clothing/head/chefhat
	uniform = /obj/item/clothing/under/rank/chef
	suit = /obj/item/clothing/suit/chef
	r_hand = /obj/item/material/kitchen/rollingpin // CHOMPEdit - Removal of obj/item/weapon
	l_pocket = /obj/item/material/knife/tacknife // CHOMPEdit - Removal of obj/item/weapon
	r_pocket = /obj/item/material/knife/tacknife // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/tournament_gear/janitor
	name = "Tournament gear - Janitor"
	uniform = /obj/item/clothing/under/rank/janitor
	back = /obj/item/storage/backpack // CHOMPEdit - Removal of obj/item/weapon
	r_hand = /obj/item/mop // CHOMPEdit - Removal of obj/item/weapon
	l_hand = /obj/item/reagent_containers/glass/bucket // CHOMPEdit - Removal of obj/item/weapon
	l_pocket = /obj/item/grenade/chem_grenade/cleaner // CHOMPEdit - Removal of obj/item/weapon
	r_pocket = /obj/item/grenade/chem_grenade/cleaner // CHOMPEdit - Removal of obj/item/weapon
	backpack_contents = list(/obj/item/stack/tile/floor = 6)

/decl/hierarchy/outfit/tournament_gear/janitor/post_equip(var/mob/living/carbon/human/H)
	var/obj/item/reagent_containers/glass/bucket/bucket = locate(/obj/item/reagent_containers/glass/bucket) in H // CHOMPEdit - Removal of obj/item/weapon
	if(bucket)
		bucket.reagents.add_reagent(/datum/reagent/water, 70)
