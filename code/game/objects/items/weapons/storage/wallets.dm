/obj/item/storage/wallet // CHOMPEdit - Removal of obj/item/weapon
	name = "wallet"
	desc = "It can hold a few small and personal things."
	storage_slots = 10
	icon = 'icons/obj/wallet.dmi'
	icon_state = "wallet-orange"
	w_class = ITEMSIZE_SMALL
	can_hold = list(
		/obj/item/spacecash, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/card, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/smokable/cigarette/,
		/obj/item/flashlight/pen, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tape, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cartridge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/encryptionkey, // CHOMPEdit - Removal of obj/item/device
		/obj/item/seeds,
		/obj/item/stack/medical,
		/obj/item/coin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/dice, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/disk, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implanter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flame/lighter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flame/match, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/forensics, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/glass_extra, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/haircomb, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/hand, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/key, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/lipstick, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/paper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pen, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/photo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/dropper, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/sample, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/stamp, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/permit,
		/obj/item/clothing/accessory/badge,
		/obj/item/makeover, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pizzavoucher,
		/obj/item/card_fluff // CHOMPEdit - Removal of obj/item/weapon
		)
	slot_flags = SLOT_ID

	var/obj/item/card/id/front_id = null // CHOMPEdit - Removal of obj/item/weapon

	drop_sound = 'sound/items/drop/leather.ogg'
	pickup_sound = 'sound/items/pickup/leather.ogg'

	var/original_name // Due to loadout customizations and such

/obj/item/storage/wallet/remove_from_storage(obj/item/W as obj, atom/new_location) // CHOMPEdit - Removal of obj/item/weapon
	. = ..(W, new_location)
	if(.)
		if(W == front_id)
			front_id = null
			name = original_name || initial(name)
			update_icon()

/obj/item/storage/wallet/handle_item_insertion(obj/item/W as obj, prevent_warning = 0) // CHOMPEdit - Removal of obj/item/weapon
	. = ..(W, prevent_warning)
	if(.)
		if(!front_id && istype(W, /obj/item/card/id)) // CHOMPEdit - Removal of obj/item/weapon
			front_id = W
			if(!original_name)
				original_name = name
			name = "[original_name] ([front_id])"
			update_icon()

/obj/item/storage/wallet/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	cut_overlays()
	if(front_id)
		var/tiny_state = "id-generic"
		if("id-[front_id.icon_state]" in cached_icon_states(icon))
			tiny_state = "id-"+front_id.icon_state
		var/image/tiny_image = new/image(icon, icon_state = tiny_state)
		tiny_image.appearance_flags = RESET_COLOR
		add_overlay(tiny_image)

/obj/item/storage/wallet/GetID() // CHOMPEdit - Removal of obj/item/weapon
	return front_id

/obj/item/storage/wallet/GetAccess() // CHOMPEdit - Removal of obj/item/weapon
	var/obj/item/I = GetID()
	if(I)
		return I.GetAccess()
	else
		return ..()

/obj/item/storage/wallet/random/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	var/amount = rand(50, 100) + rand(50, 100) // Triangular distribution from 100 to 200
	var/obj/item/spacecash/SC = null // CHOMPEdit - Removal of obj/item/weapon
	SC = new(src)
	for(var/i in list(100, 50, 20, 10, 5, 1))
		if(amount < i)
			continue
		while(amount >= i)
			amount -= i
			SC.adjust_worth(i, 0)
		SC.update_icon()

/obj/item/storage/wallet/poly // CHOMPEdit - Removal of obj/item/weapon
	name = "polychromic wallet"
	desc = "You can recolor it! Fancy! The future is NOW!"
	icon_state = "wallet-white"

/obj/item/storage/wallet/poly/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	verbs |= /obj/item/storage/wallet/poly/proc/change_color // CHOMPEdit - Removal of obj/item/weapon
	color = get_random_colour()
	update_icon()

/obj/item/storage/wallet/poly/proc/change_color() // CHOMPEdit - Removal of obj/item/weapon
	set name = "Change Wallet Color"
	set category = "Object"
	set desc = "Change the color of the wallet."
	set src in usr

	if(usr.stat || usr.restrained() || usr.incapacitated())
		return

	var/new_color = input(usr, "Pick a new color", "Wallet Color", color) as color|null

	if(new_color && (new_color != color))
		color = new_color

/obj/item/storage/wallet/poly/emp_act() // CHOMPEdit - Removal of obj/item/weapon
	var/original_state = icon_state
	icon_state = "wallet-emp"
	update_icon()

	spawn(200)
		if(src)
			icon_state = original_state
			update_icon()

/obj/item/storage/wallet/womens // CHOMPEdit - Removal of obj/item/weapon
	name = "women's wallet"
	desc = "A stylish wallet typically used by women."
	icon_state = "girl_wallet"
	item_state_slots = list(slot_r_hand_str = "wowallet", slot_l_hand_str = "wowallet")
