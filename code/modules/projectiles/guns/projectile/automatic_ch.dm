//
///
/// This is where reworked automatic weapons will be moved to. The P90 is an example of how these weapons should be laid out for readability (without all the comments).
/// Please make sure to categorize the weapons properly!
///
//

/*
 * SUBMACHINE GUNS
*/

// P90K

/obj/item/gun/projectile/automatic/p90
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
	fire_sound = "sound/weapons/Gunshot1.ogg"

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=0, move_delay=0),
		list(mode_name="three-round burst", burst=3, fire_delay=null, burst_delay=1, move_delay=0, burst_accuracy=list(0,-15,-20), dispersion=list(0.0, 1.0, 1.5))
		)

/obj/item/gun/projectile/automatic/p90/update_icon() // Code for visually updating the item depending on current magazine capacity.
	icon_state = "p90smgnew-[ammo_magazine ? round(ammo_magazine.stored_ammo.len, 6) : "empty"]"

// C-20R

/obj/item/gun/projectile/automatic/c20r
	name = "\improper C-20R"
	desc = "The C-20R is a lightweight, heavy-hitting submachine gun with an infamous reputation for being the weapon of choice among mercenary outfits and insurgent cabals. It has 'Scarborough Arms - Per Falcis, Per Pravitas' inscribed on the stock. Chambered in 10mm caseless rounds."
	description_fluff = "The C-20R is produced by Scarborough Arms, a specialist high-end weapons manufacturer based out of Titan, Sol. Scarborough has resisted numerous efforts by Trans-Stellars to acquire the brand since its founding in 2511, and has gained a dedicated following among a certain flavor of private operative."

	icon = 'icons/obj/64x32guns_ch.dmi'
	icon_expected_width = 64
	item_icons = list(
		slot_l_hand_str = 'modular_chomp/icons/mob/items/lefthand_guns_ch.dmi',
		slot_r_hand_str = 'modular_chomp/icons/mob/items/righthand_guns_ch.dmi',
		)
	icon_state = "c20r"
	item_state = "c20rnew"
	wielded_item_state = "c20rnew-wielded"
	slot_flags = SLOT_BELT|SLOT_BACK

	w_class = ITEMSIZE_LARGE
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)

	recoil = 0
	one_handed_penalty = 30
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

	caliber = "10mm"
	ammo_type = /obj/item/ammo_casing/a10mm
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m10mm
	allowed_magazines = list(/obj/item/ammo_magazine/m10mm)
	fire_sound = "sound/weapons/Gunshot1.ogg"

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=0, move_delay=0),
		list(mode_name="two-shot rapidfire", burst=2, fire_delay=null, burst_delay=1, move_delay=0, burst_accuracy=list(-5,-10), dispersion=list(0.5, 1.0)),
		)

/obj/item/gun/projectile/automatic/c20r/update_icon()
	icon_state = "c20r-[ammo_magazine ? round(ammo_magazine.stored_ammo.len,4) : "empty"]"

/obj/item/gun/projectile/automatic/c20r/rubber
	magazine_type = /obj/item/ammo_magazine/m10mm/rubber

/obj/item/gun/projectile/automatic/c20r/empty
	magazine_type = null

/*
 * RIFLES
*/

/obj/item/gun/projectile/automatic/fal
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
	fire_sound = "sound/weapons/ballistics/a762.ogg"

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2, fire_delay=null, move_delay=6,    burst_accuracy=list(60,35), dispersion=list(0.0, 0.6))
		)

/obj/item/gun/projectile/automatic/fal/update_icon(var/ignore_inhands)
	..()
	if(ammo_magazine)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-empty"
