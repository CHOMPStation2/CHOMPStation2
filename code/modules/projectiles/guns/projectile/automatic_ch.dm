//
///
/// This is where reworked automatic weapons will be moved to. The P90 is an example of how these weapons should be laid out for readability (without all the comments).
/// Please make sure to categorize the weapons properly!
///
//

/*
 * SUBMACHINE GUNS
*/

/obj/item/weapon/gun/projectile/automatic/p90
	name = "\improper P90K PDW"
	desc = "The P90K Personal Defense Weapon is a MarsTech-assembled modernized variation of the ancient FN P90, a compact, high-capacity submachine gun of human origin. Its fierce reputation owes to its minimal recoil and ergonomic design. Chambered in 5.7x28mm caseless rounds."
	description_fluff = "The leading civilian-sector high-quality small arms subsidiary of Hephaestus Industries, MarsTech has been the provider of choice for law enforcement and security forces for over 300 years."

	icon = 'icons/obj/gun_ch.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_guns_ch.dmi',
		)
	icon_state = "p90smgnew" // Defines the name for the icon (inventory) state.
	item_state = "p90new" // Defines the name for the item (visibly held) state.
	wielded_item_state = "p90new-wielded" // Defines the name for the wielded (two-handed) state.
	slot_flags = SLOT_BELT|SLOT_BACK // The inventory slots this weapon can occupy. Most weapons can go on the suit slot by default, so long as you're wearing a vest.

	w_class = ITEMSIZE_LARGE // Takes up more space in inventories than a pistol.
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2) // The tech levels you get from deconstructing this item.

	recoil = 0 // No screenshake on firing.
	one_handed_penalty = 15 // Slight accuracy penalty when firing one-handed.
	auto_eject = 1 // Auto-ejects magazine when it's empty.
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

	caliber = "5.7x28mm" // The type of caliber the gun accepts. Will not accept magazines loaded with the wrong caliber, even if they're listed in allowed_magazines.
	ammo_type = /obj/item/ammo_casing/a57 // Should always be an ammo casing that uses the same caliber as the gun's listed for.
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a57p90 // The magazine type it spawns with.
	allowed_magazines = list(/obj/item/ammo_magazine/a57p90) // What kind of magazine(s) it can load.

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=0),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-15,-15), dispersion=list(0.0, 0.6, 1.0))
		)

/obj/item/weapon/gun/projectile/automatic/p90/update_icon() // Code for visually updating the item depending on current magazine capacity.
	icon_state = "p90smgnew-[ammo_magazine ? round(ammo_magazine.stored_ammo.len, 6) : "empty"]"

/*
 * RIFLES
*/

/obj/item/weapon/gun/projectile/automatic/fal
	name = "FN-FAL"
	desc = "A 20th century Assault Rifle originally designed by Fabrique National. Famous for its use by mercs in grinding proxy wars in backwater nations. This reproduction was probably made for similar purposes."
	icon = 'icons/obj/gun_ch.dmi'
	icon_state = "fal"
	item_state = "fal"
	w_class = ITEMSIZE_LARGE
	force = 10
	caliber = "7.62mm"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m762/ext
	allowed_magazines = list(/obj/item/ammo_magazine/m762, /obj/item/ammo_magazine/m762/ext)
	projectile_type = /obj/item/projectile/bullet/rifle/a762

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2, fire_delay=null, move_delay=6,    burst_accuracy=list(60,35), dispersion=list(0.0, 0.6))
		)

/obj/item/weapon/gun/projectile/automatic/fal/update_icon(var/ignore_inhands)
	..()
	if(ammo_magazine)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-empty"