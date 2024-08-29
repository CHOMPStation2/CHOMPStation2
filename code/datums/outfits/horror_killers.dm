/decl/hierarchy/outfit/tunnel_clown
	name = "Tunnel Clown"
	uniform = /obj/item/clothing/under/rank/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	gloves = /obj/item/clothing/gloves/black
	mask = /obj/item/clothing/mask/gas/clown_hat
	head = /obj/item/clothing/head/chaplain_hood
	l_ear = /obj/item/radio/headset // CHOMPEdit - Removal of obj/item/device
	glasses = /obj/item/clothing/glasses/thermal/plain/monocle
	suit = /obj/item/clothing/suit/storage/hooded/chaplain_hoodie
	r_pocket = /obj/item/bikehorn // CHOMPEdit - Removal of obj/item/weapon
	r_hand = /obj/item/material/twohanded/fireaxe // CHOMPEdit - Removal of obj/item/weapon

	id_slot = slot_wear_id
	id_type = /obj/item/card/id/syndicate/station_access // CHOMPEdit - Removal of obj/item/weapon
	id_pda_assignment = "Tunnel Clown!"

/decl/hierarchy/outfit/masked_killer
	name = "Masked Killer"
	uniform = /obj/item/clothing/under/overalls
	shoes = /obj/item/clothing/shoes/white
	gloves = /obj/item/clothing/gloves/sterile/latex
	mask = /obj/item/clothing/mask/surgical
	head = /obj/item/clothing/head/welding
	l_ear = /obj/item/radio/headset // CHOMPEdit - Removal of obj/item/device
	glasses = /obj/item/clothing/glasses/thermal/plain/monocle
	suit = /obj/item/clothing/suit/storage/apron
	l_pocket = /obj/item/material/knife/tacknife // CHOMPEdit - Removal of obj/item/weapon
	r_pocket = /obj/item/surgical/scalpel // CHOMPEdit - Removal of obj/item/weapon
	r_hand = /obj/item/material/twohanded/fireaxe // CHOMPEdit - Removal of obj/item/weapon

/decl/hierarchy/outfit/masked_killer/post_equip(var/mob/living/carbon/human/H)
	var/victim = get_mannequin(H.ckey)
	for(var/obj/item/carried_item in H.get_equipped_items(TRUE))
		carried_item.add_blood(victim) //Oh yes, there will be blood.. just not blood from the killer because that's odd

/decl/hierarchy/outfit/professional
	name = "Professional"
	uniform = /obj/item/clothing/under/suit_jacket{ starting_accessories=list(/obj/item/clothing/accessory/wcoat) }
	shoes = /obj/item/clothing/shoes/black
	gloves = /obj/item/clothing/gloves/black
	l_ear = /obj/item/radio/headset // CHOMPEdit - Removal of obj/item/device
	glasses = /obj/item/clothing/glasses/sunglasses
	l_pocket = /obj/item/melee/energy/sword // CHOMPEdit - Removal of obj/item/weapon
	mask = /obj/item/clothing/mask/gas/clown_hat

	id_slot = slot_wear_id
	id_type = /obj/item/card/id/syndicate/station_access // CHOMPEdit - Removal of obj/item/weapon
	pda_slot = slot_belt
	pda_type = /obj/item/pda/heads // CHOMPEdit - Removal of obj/item/device

/decl/hierarchy/outfit/professional/post_equip(var/mob/living/carbon/human/H)
	var/obj/item/storage/secure/briefcase/sec_briefcase = new(H) // CHOMPEdit - Removal of obj/item/weapon
	for(var/obj/item/briefcase_item in sec_briefcase)
		qdel(briefcase_item)
	for(var/i=3, i>0, i--)
		sec_briefcase.contents += new /obj/item/spacecash/c1000 // CHOMPEdit - Removal of obj/item/weapon
	sec_briefcase.contents += new /obj/item/gun/energy/crossbow // CHOMPEdit - Removal of obj/item/weapon
	sec_briefcase.contents += new /obj/item/gun/projectile/revolver/mateba // CHOMPEdit - Removal of obj/item/weapon
	sec_briefcase.contents += new /obj/item/ammo_magazine/s357
	sec_briefcase.contents += new /obj/item/plastique // CHOMPEdit - Removal of obj/item/weapon
	H.equip_to_slot_or_del(sec_briefcase, slot_l_hand)
