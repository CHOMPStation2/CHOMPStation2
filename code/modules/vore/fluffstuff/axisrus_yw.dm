//head

/obj/item/clothing/head/axiscap
	name = "Feldmütze"
	desc = "Despite being designed for use in an armoured vehicle, this cap sports a remarkable lack of armor of any sort. Mind your Kopf."
	icon = 'icons/vore/axisrus_yw.dmi'
	icon_state = "panzercap"
	icon_override = 'icons/vore/axisrus_yw.dmi'
	item_state = "panzercap_mob"

/obj/item/clothing/head/axiscap/officer
	name = "Einheitsfeldmütze"
	desc = "A great leader has many things. Honor, conviction, determination, a nerve of steel. And above all, a hat of the utmost quality."
	icon = 'icons/vore/axisrus_yw.dmi'
	icon_state = "officercap"
	icon_override = 'icons/vore/axisrus_yw.dmi'
	item_state = "officercap_mob"

/obj/item/clothing/head/helmet/axis
	name = "Stalhelm"
	desc = "The archetypical symbol for miltary tyranny; this humble-looking steel pot protects against everything from bullets and shrapnel to the occasional loosed Bierglas. Unterseiten oben!"
	icon = 'icons/vore/axisrus_yw.dmi'
	icon_state = "stalhelm"
	icon_override = 'icons/vore/axisrus_yw.dmi'
	item_state = "stalhelm_mob"
	armor = list(melee = 10, bullet = 50, laser = 0, energy = 0, bomb = 20, bio = 0, rad = 10)

//under

/obj/item/clothing/under/axis
	name = "Feldanzug"
	desc = "When participating in die Blitzkrieg it is important for your uniform to be professional and functional, as well as devilishly dapper."
	icon = 'icons/vore/axisrus_yw.dmi'
	icon_state = "soldieruniform"
	icon_override = 'icons/vore/axisrus_yw.dmi'
	item_state = "soldieruniform_mob"

/obj/item/clothing/under/axis/officer
	name = "Officer's Feldanzug"
	desc = "When participating in die Blitzkrieg it is important for your uniform to be professional and functional, as well as devilishly dapper."
	icon = 'icons/vore/axisrus_yw.dmi'
	icon_state = "officeruniform"
	icon_override = 'icons/vore/axisrus_yw.dmi'
	item_state = "officeruniform_mob"

//suits

/obj/item/clothing/suit/storage/labcoat/fluff/zeke_vincir_3/axis
	name = "Waffenrock"
	desc = "This coat might not stop the bite of Soviet bullets, nor the sting of Siberian winds, but God be damned, if it isn't stylish!"
	icon = 'icons/vore/axisrus_yw.dmi'
	icon_state = "soldiersuit"
	icon_override = 'icons/vore/axisrus_yw.dmi'
	item_state = "soldiersuit_mob"
	blood_overlay_type = "coat"
	allowed = list(/obj/item/gun/energy,
					/obj/item/reagent_containers/spray/pepper,
					/obj/item/gun/projectile,
					/obj/item/ammo_magazine,
					/obj/item/ammo_casing,
					/obj/item/melee/baton,
					/obj/item/handcuffs)

/obj/item/clothing/suit/storage/labcoat/fluff/zeke_vincir_3/axis/officer
	name = "Officer's Waffenrock"
	desc = "This coat might not stop the bite of Soviet bullets, nor the sting of Siberian winds, but God be damned, if it isn't stylish!"
	icon = 'icons/vore/axisrus_yw.dmi'
	icon_state = "officersuit"
	icon_override = 'icons/vore/axisrus_yw.dmi'
	item_state = "officersuit_mob"


//place holders (WIP)

/obj/item/clothing/head/helmet/space/void/merc/axis

/obj/item/clothing/suit/space/void/merc/axis


/obj/item/clothing/head/helmet/space/void/merc/axis/axisrigh
	name = "Weltraumsoldat helm"
	desc = "A obscure helmet that only seems to fit a human and comes with the markings 'Weltraumsoldaten' on it."
	icon = 'icons/vore/axisrus_yw.dmi'
	icon_state = "rig0-axish"
	icon_override = 'icons/vore/axisrus_yw.dmi'
	item_state = "rig0-axis_mob"

/obj/item/clothing/suit/space/void/merc/axis/axisrig
	name = "Weltraumsoldat hardsuit"
	desc = "A obscure hardsuit that only seems to fit a human and comes with the markings 'Weltraumsoldaten' on it."
	icon = 'icons/vore/axisrus_yw.dmi'
	icon_state = "rig-axisr"
	icon_override = 'icons/vore/axisrus_yw.dmi'
	item_state = "rig-axis_mob"

/obj/item/clothing/head/helmet/space/void/axis/merc/sovrigh
	name = "Soviet helm"
	desc = "A obscure helmet that only seems to fit a human and comes with the markings 'CMC-300 Powered Combat Suit' on it."
	icon = 'icons/vore/axisrus_yw.dmi'
	icon_state = "rig0-sovieth"
	icon_override = 'icons/vore/axisrus_yw.dmi'
	item_state = "rig0-soviet_mob"

/obj/item/clothing/suit/space/void/merc/axis/sovrig
	name = "Soviet hardsuit"
	desc = "A obscure hardsuit that only seems to fit a human and comes with the markings 'CMC-300 Powered Combat Suit' on it."
	icon = 'icons/vore/axisrus_yw.dmi'
	icon_state = "rig-sovietr"
	icon_override = 'icons/vore/axisrus_yw.dmi'
	item_state = "rig-soviet_mob"
