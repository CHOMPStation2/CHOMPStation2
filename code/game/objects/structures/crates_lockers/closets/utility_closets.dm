/* Utility Closets
 * Contains:
 *		Emergency Closet
 *		Fire Closet
 *		Tool Closet
 *		Radiation Closet
 *		Bombsuit Closet
 *		Hydrant
 *		First Aid
 */

/*
 * Emergency Closet
 */
/obj/structure/closet/emcloset
	name = "emergency closet"
	desc = "It's a storage unit for emergency breathmasks and O2 tanks."
	closet_appearance = /decl/closet_appearance/oxygen

/obj/structure/closet/emcloset/Initialize()
	switch (pickweight(list("small" = 55, "aid" = 25, "tank" = 10, "both" = 10)))
	//CHOMPEdit Block Start - Modified List
		if ("small")
			starts_with = list(
				/obj/item/storage/toolbox/emergency, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tank/emergency/oxygen = 2, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/mask/breath = 2,
				/obj/item/clothing/suit/space/emergency = 2,
				/obj/item/clothing/head/helmet/space/emergency = 2,
				/obj/item/suit_cooling_unit/emergency = 2) // CHOMPEdit - Removal of obj/item/device
		if ("aid")
			starts_with = list(
				/obj/item/storage/toolbox/emergency, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/firstaid/o2, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tank/emergency/oxygen/engi = 2, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/mask/breath = 2,
				/obj/item/clothing/suit/space/emergency = 2,
				/obj/item/clothing/head/helmet/space/emergency = 2,
				/obj/item/suit_cooling_unit/emergency = 2) // CHOMPEdit - Removal of obj/item/device
		if ("tank")
			starts_with = list(
				/obj/item/storage/toolbox/emergency, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tank/emergency/oxygen/double = 2, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/mask/breath = 2,
				/obj/item/clothing/suit/space/emergency = 2,
				/obj/item/clothing/head/helmet/space/emergency = 2,
				/obj/item/suit_cooling_unit = 2) // CHOMPEdit - Removal of obj/item/device
		if ("both")
			starts_with = list(
				/obj/item/storage/toolbox/emergency, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/storage/firstaid/o2, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/tank/emergency/oxygen/double = 2, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/clothing/mask/breath = 2,
				/obj/item/clothing/suit/space/emergency = 2,
				/obj/item/clothing/head/helmet/space/emergency = 2,
				/obj/item/suit_cooling_unit = 2) // CHOMPEdit - Removal of obj/item/device
	//CHOMPEdit Block End

	return ..()

/obj/structure/closet/emcloset/legacy
	starts_with = list(
		/obj/item/tank/oxygen, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/mask/gas)

/*
 * Fire Closet
 */
/obj/structure/closet/firecloset
	name = "fire-safety closet"
	desc = "It's a storage unit for fire-fighting supplies."
	closet_appearance = /decl/closet_appearance/oxygen/fire

	starts_with = list(
		/obj/item/clothing/suit/fire,
		/obj/item/clothing/mask/gas,
		/obj/item/tank/oxygen/red, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/extinguisher, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/hardhat/red)

/obj/structure/closet/firecloset/full
	starts_with = list(
		/obj/item/clothing/suit/fire,
		/obj/item/clothing/mask/gas,
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank/oxygen/red, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/extinguisher, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/hardhat/red)

/obj/structure/closet/firecloset/full/double
	starts_with = list(
		/obj/item/clothing/suit/fire = 2,
		/obj/item/clothing/mask/gas = 2,
		/obj/item/flashlight = 2, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank/oxygen/red = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/extinguisher = 2, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/hardhat/red = 2)

/obj/structure/closet/firecloset/full/atmos
	name = "atmos fire-safety closet"
	desc = "It's a storage unit for atmospheric fire-fighting supplies."
	closet_appearance = /decl/closet_appearance/oxygen/fire/atmos

	starts_with = list(
		/obj/item/clothing/suit/fire/heavy,
		/obj/item/tank/oxygen/red, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/extinguisher/atmo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/head/hardhat/firefighter/atmos)

/*
 * Tool Closet
 */
/obj/structure/closet/toolcloset
	name = "tool closet"
	desc = "It's a storage unit for tools."
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/tools

/obj/structure/closet/toolcloset/Initialize()
	starts_with = list()
	if(prob(40))
		starts_with += /obj/item/clothing/suit/storage/hazardvest
	if(prob(70))
		starts_with += /obj/item/flashlight // CHOMPEdit - Removal of obj/item/device
	if(prob(70))
		starts_with += /obj/item/tool/screwdriver // CHOMPEdit - Removal of obj/item/weapon
	if(prob(70))
		starts_with += /obj/item/tool/wrench // CHOMPEdit - Removal of obj/item/weapon
	if(prob(70))
		starts_with += /obj/item/weldingtool // CHOMPEdit - Removal of obj/item/weapon
	if(prob(70))
		starts_with += /obj/item/tool/crowbar // CHOMPEdit - Removal of obj/item/weapon
	if(prob(70))
		starts_with += /obj/item/tool/wirecutters // CHOMPEdit - Removal of obj/item/weapon
	if(prob(70))
		starts_with += /obj/item/t_scanner // CHOMPEdit - Removal of obj/item/device
	if(prob(20))
		starts_with += /obj/item/storage/belt/utility // CHOMPEdit - Removal of obj/item/weapon
	if(prob(30))
		starts_with += /obj/item/stack/cable_coil/random
	if(prob(30))
		starts_with += /obj/item/stack/cable_coil/random
	if(prob(30))
		starts_with += /obj/item/stack/cable_coil/random
	if(prob(20))
		starts_with += /obj/item/multitool // CHOMPEdit - Removal of obj/item/device
	if(prob(5))
		starts_with += /obj/item/clothing/gloves/yellow
	if(prob(40))
		starts_with += /obj/item/clothing/head/hardhat
	if(prob(30))
		starts_with += /obj/item/reagent_containers/spray/windowsealant //VOREStation Add // CHOMPEdit - Removal of obj/item/weapon
	return ..()

/*
 * Radiation Closet
 */
/obj/structure/closet/radiation
	name = "radiation suit closet"
	desc = "It's a storage unit for rad-protective suits."
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/tools/radiation

	starts_with = list(
		/obj/item/clothing/suit/radiation = 2,
		/obj/item/clothing/head/radiation = 2,
		/obj/item/geiger = 2) // CHOMPEdit - Removal of obj/item/device

/*
 * Bombsuit closet
 */
/obj/structure/closet/bombcloset
	name = "\improper EOD closet"
	desc = "It's a storage unit for explosion-protective suits."
	closet_appearance = /decl/closet_appearance/bomb

	starts_with = list(
		/obj/item/clothing/suit/bomb_suit,
		/obj/item/clothing/under/color/black,
		/obj/item/clothing/shoes/black,
		/obj/item/clothing/head/bomb_hood)

/obj/structure/closet/bombcloset/double
	starts_with = list(
		/obj/item/clothing/suit/bomb_suit = 2,
		/obj/item/clothing/under/color/black = 2,
		/obj/item/clothing/shoes/black = 2,
		/obj/item/clothing/head/bomb_hood = 2)

/obj/structure/closet/bombclosetsecurity
	name = "\improper EOD closet"
	desc = "It's a storage unit for explosion-protective suits."
	closet_appearance = /decl/closet_appearance/bomb/security

	starts_with = list(
		/obj/item/clothing/suit/bomb_suit/security,
		/obj/item/clothing/under/rank/security,
		/obj/item/clothing/shoes/brown,
		/obj/item/clothing/head/bomb_hood/security)

/*
 * Hydrant
 */
/obj/structure/closet/hydrant //wall mounted fire closet
	name = "fire-safety closet"
	desc = "It's a storage unit for fire-fighting supplies."
	icon = 'icons/obj/closets/bases/wall.dmi'
	closet_appearance = /decl/closet_appearance/wall/hydrant
	plane = TURF_PLANE
	layer = ABOVE_TURF_LAYER
	anchored = TRUE
	density = FALSE
	wall_mounted = 1
	store_mobs = 0

	starts_with = list(
		/obj/item/clothing/suit/fire/firefighter,
		/obj/item/clothing/mask/gas,
		/obj/item/flashlight, // CHOMPEdit - Removal of obj/item/device
		/obj/item/tank/oxygen/red, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/extinguisher, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/hardhat/red)

/*
 * First Aid
 */
/obj/structure/closet/medical_wall //wall mounted medical closet
	name = "first-aid closet"
	desc = "It's wall-mounted storage unit for first aid supplies."
	icon = 'icons/obj/closets/bases/wall.dmi'
	closet_appearance = /decl/closet_appearance/wall/medical
	plane = TURF_PLANE
	layer = ABOVE_TURF_LAYER
	anchored = TRUE
	density = FALSE
	wall_mounted = 1
	store_mobs = 0
