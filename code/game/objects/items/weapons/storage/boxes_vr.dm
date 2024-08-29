/obj/item/storage/box/explorerkeys // CHOMPEdit - Removal of obj/item/weapon
	name = "box of volunteer headsets"
	desc = "A box full of volunteer headsets, for issuing out to exploration volunteers."
	starts_with = list(/obj/item/radio/headset/volunteer = 7) //CHOMP explo keep // CHOMPEdit - Removal of obj/item/device

/obj/item/storage/box/commandkeys // CHOMPEdit - Removal of obj/item/weapon
	name = "box of command keys"
	desc = "A box full of command keys, for command to give out as necessary."
	starts_with = list(/obj/item/encryptionkey/headset_com = 7) // CHOMPEdit - Removal of obj/item/device

/obj/item/storage/box/servicekeys // CHOMPEdit - Removal of obj/item/weapon
	name = "box of service keys"
	desc = "A box full of service keys, for the HoP to give out as necessary."
	starts_with = list(/obj/item/encryptionkey/headset_service = 7) // CHOMPEdit - Removal of obj/item/device

/obj/item/storage/box/survival/space // CHOMPEdit - Removal of obj/item/weapon
	name = "boxed emergency suit and helmet"
	icon_state = "survival_comp3"
	starts_with = list(
		/obj/item/clothing/suit/space/emergency,
		/obj/item/clothing/head/helmet/space/emergency,
		/obj/item/clothing/mask/breath,
		/obj/item/tank/emergency/oxygen/double // CHOMPEdit - Removal of obj/item/weapon
	)

/obj/item/storage/secure/briefcase/trashmoney // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(/obj/item/spacecash/c200 = 10) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/brainzsnax // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper BrainzSnax box"
	icon_state = "brainzsnax_box"
	desc = "A box designed to hold canned food. This one has BrainzSnax branding printed on it."
	can_hold = list(/obj/item/reagent_containers/food/snacks/canned) // CHOMPEdit - Removal of obj/item/weapon
	max_storage_space = ITEMSIZE_COST_NORMAL * 6
	starts_with = list(/obj/item/reagent_containers/food/snacks/canned/brainzsnax = 6) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/brainzsnax/red // CHOMPEdit - Removal of obj/item/weapon
	starts_with = list(/obj/item/reagent_containers/food/snacks/canned/brainzsnax/red = 6) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/freezer // CHOMPEdit - Removal of obj/item/weapon
	can_hold = list(/obj/item/organ, /obj/item/reagent_containers/blood, /obj/item/reagent_containers/glass, /obj/item/reagent_containers/food) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/altevian_ammo // CHOMPEdit - Removal of obj/item/weapon
	name = "SAM .48 ammo box"
	desc = "A box of ratty ammo."
	icon_state = "secbox"
	starts_with = list(/obj/item/ammo_magazine/sam48 = 3)
	max_storage_space = ITEMSIZE_COST_NORMAL * 3
	drop_sound = 'sound/items/drop/ammobox.ogg'
	pickup_sound = 'sound/items/pickup/ammobox.ogg'

/obj/item/storage/box/weapon_cells // CHOMPEdit - Removal of obj/item/weapon
	name = "box of weapon cells"
	desc = "A box full of weapon power cells. For all your portable energy storage needs."
	icon_state = "secbox"
	starts_with = list(/obj/item/cell/device/weapon = 7) // CHOMPEdit - Removal of obj/item/weapon
