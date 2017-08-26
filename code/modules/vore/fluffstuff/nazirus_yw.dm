//head

/obj/item/clothing/head/nazicap
	name = "Feldmütze"
	desc = "Despite being designed for use in an armoured vehicle, this cap sports a remarkable lack of armor of any sort. Mind your Kopf."
	icon = 'icons/vore/nazirus_yw.dmi'
	icon_state = "panzercap"
	icon_override = 'icons/vore/nazirus_yw.dmi'
	item_state = "panzercap_mob"

/obj/item/clothing/head/nazicap/officer
	name = "Einheitsfeldmütze"
	desc = "A great leader has many things. Honor, conviction, determination, a nerve of steel. And above all, a hat of the utmost quality."
	icon = 'icons/vore/nazirus_yw.dmi'
	icon_state = "officercap"
	icon_override = 'icons/vore/nazirus_yw.dmi'
	item_state = "officercap_mob"

/obj/item/clothing/head/helmet/nazi
	name = "Stalhelm"
	desc = "The archetypical symbol for miltary tyranny; this humble-looking steel pot protects against everything from bullets and shrapnel to the occasional loosed Bierglas. Unterseiten oben!"
	icon = 'icons/vore/nazirus_yw.dmi'
	icon_state = "stalhelm"
	icon_override = 'icons/vore/nazirus_yw.dmi'
	item_state = "stalhelm_mob"
	armor = list(melee = 10, bullet = 50, laser = 0, energy = 0, bomb = 20, bio = 0, rad = 10)

//under

/obj/item/clothing/under/nazi
	name = "Feldanzug"
	desc = "When participating in die Blitzkrieg it is important for your uniform to be professional and functional, as well as devilishly dapper."
	icon = 'icons/vore/nazirus_yw.dmi'
	icon_state = "soldieruniform"
	icon_override = 'icons/vore/nazirus_yw.dmi'
	item_state = "soldieruniform_mob"

/obj/item/clothing/under/nazi/officer
	name = "Officer's Feldanzug"
	desc = "When participating in die Blitzkrieg it is important for your uniform to be professional and functional, as well as devilishly dapper."
	icon = 'icons/vore/nazirus_yw.dmi'
	icon_state = "officeruniform"
	icon_override = 'icons/vore/nazirus_yw.dmi'
	item_state = "officeruniform_mob"

//suits

/obj/item/clothing/suit/storage/labcoat/fluff/zeke_vincir_3/nazi
	name = "Waffenrock"
	desc = "This coat might not stop the bite of Soviet bullets, nor the sting of Siberian winds, but God be damned, if it isn't stylish!"
	icon = 'icons/vore/nazirus_yw.dmi'
	icon_state = "soldiersuit"
	icon_override = 'icons/vore/nazirus_yw.dmi'
	item_state = "soldiersuit_mob"
	blood_overlay_type = "coat"
	allowed = list(/obj/item/weapon/gun/energy,
					/obj/item/weapon/reagent_containers/spray/pepper,
					/obj/item/weapon/gun/projectile,
					/obj/item/ammo_magazine,
					/obj/item/ammo_casing,
					/obj/item/weapon/melee/baton,
					/obj/item/weapon/handcuffs)

/obj/item/clothing/suit/storage/labcoat/fluff/zeke_vincir_3/nazi/officer
	name = "Officer's Waffenrock"
	desc = "This coat might not stop the bite of Soviet bullets, nor the sting of Siberian winds, but God be damned, if it isn't stylish!"
	icon = 'icons/vore/nazirus_yw.dmi'
	icon_state = "officersuit"
	icon_override = 'icons/vore/nazirus_yw.dmi'
	item_state = "officersuit_mob"


//place holders (WIP)

/obj/item/clothing/head/helmet/space/void/merc/nazi

/obj/item/clothing/suit/space/void/merc/nazi


/obj/item/clothing/head/helmet/space/void/merc/nazi/nazirigh
	name = "Weltraumsoldat helm"
	desc = "A obscure helmet that comes with the markings 'Weltraumsoldaten' on it."
	icon = 'icons/vore/nazirus_yw.dmi'
	icon_state = "rig0-nazih"
	icon_override = 'icons/vore/nazirus_yw.dmi'
	item_state = "rig0-nazih"

/obj/item/clothing/suit/space/void/merc/nazi/nazirig
	name = "Weltraumsoldat hardsuit"
	desc = "A obscure hardsuit that comes with the markings 'Weltraumsoldaten' on it."
	icon = 'icons/vore/nazirus_yw.dmi'
	icon_state = "rig-nazi"
	icon_override = 'icons/vore/nazirus_yw.dmi'
	item_state = "rig-nazi"

/obj/item/clothing/head/helmet/space/void/nazi/merc/sovrigh
	name = "Soviet helm"
	desc = "A obscure helmet that comes with the markings 'CMC-300 Powered Combat Suit' on it."
	icon = 'icons/vore/nazirus_yw.dmi'
	icon_state = "rig0-sovieth"
	icon_override = 'icons/vore/nazirus_yw.dmi'
	item_state = "rig0-sovieth"

/obj/item/clothing/suit/space/void/merc/nazi/sovrig
	name = "Soviet hardsuit"
	desc = "A obscure hardsuit that comes with the markings 'CMC-300 Powered Combat Suit' on it."
	icon = 'icons/vore/nazirus_yw.dmi'
	icon_state = "rig-soviet"
	icon_override = 'icons/vore/nazirus_yw.dmi'
	item_state = "rig-soviet"