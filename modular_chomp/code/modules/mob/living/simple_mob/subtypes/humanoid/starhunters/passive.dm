/mob/living/simple_mob/humanoid/starhunter/trader/weaponsmith
	name = "Starhunter Weapon Smith"
	icon_state = "sunetrader"
	icon_living = "sunetrader"
	products	= list(/obj/item/gun/energy/sickshot = 5,
		/obj/item/material/twohanded/fireaxe/scythe = 3,
		/obj/item/material/twohanded/spear/lance = 3,
		/obj/item/beartrap = 12,
		/obj/item/material/barbedwire = 12,
		/obj/item/material/sword/battleaxe = 3

		) // For each, use the following pattern:

	premium 	= list(/obj/item/gun/energy/maghowitzer) //This may be a mistake

	prices     = list(/obj/item/gun/energy/maghowitzer = 8000,
		/obj/item/gun/energy/sickshot = 800,
		/obj/item/material/twohanded/fireaxe/scythe = 400,
		/obj/item/material/twohanded/spear/lance = 400,
		/obj/item/beartrap = 80,
		/obj/item/material/barbedwire = 80,
		/obj/item/material/sword/battleaxe = 400
		)

/mob/living/simple_mob/humanoid/starhunter/trader/reliccollecter
	name = "Starhunter Relic Collector"
	icon_state = "snektrader"
	icon_living = "snektrader"
	products	= list(/obj/item/clothing/head/helmet/combat/crusader = 3,
		/obj/item/clothing/suit/armor/combat/crusader = 3,
		/obj/item/clothing/head/culthood = 3,
		/obj/item/clothing/suit/cultrobes = 3,
		/obj/item/clothing/head/helmet/space/cult = 3,
		/obj/item/clothing/suit/space/cult = 3,
		/obj/item/soulstone = 8,
		/obj/item/clothing/glasses/monocoole = 3,
		/obj/item/storage/belt/holding = 1,
		/obj/item/clothing/gloves/regen = 1
		) // For each, use the following pattern:

	premium 	= list(/obj/item/clothing/glasses/omni) //I am unsure why but this feels right

	prices     = list(/obj/item/clothing/head/helmet/combat/crusader = 600,
		/obj/item/clothing/suit/armor/combat/crusader = 600,
		/obj/item/clothing/head/culthood = 600,
		/obj/item/clothing/suit/cultrobes = 600,
		/obj/item/clothing/head/helmet/space/cult = 600,
		/obj/item/clothing/suit/space/cult = 600,
		/obj/item/soulstone = 80,
		/obj/item/clothing/glasses/monocoole = 1200,
		/obj/item/storage/belt/holding = 1800,
		/obj/item/clothing/gloves/regen = 1800,
		/obj/item/clothing/glasses/omni = 2600
		)

/mob/living/simple_mob/humanoid/starhunter/trader/miner
	name = "Starhunter Miner"
	icon_state = "snektrader"
	icon_living = "snektrader"
	products	= list(/obj/item/kinetic_crusher/glaive = 5,
		/obj/item/kinetic_crusher = 3,
		/obj/item/gun/energy/mininglaser = 3,
		/obj/item/melee/shock_maul = 3,
		/obj/item/stack/material/phoron = 50,
		/obj/item/stack/material/uranium = 50,
		/obj/item/stack/material/tritium = 50,
		/obj/item/stack/material/deuterium = 50,
		/obj/item/stack/material/bronze = 50,
		/obj/item/circuitboard/paradoxrift = 3
		) // For each, use the following pattern:

	premium 	= list(/obj/item/circuitboard/defenseonelisk) // No specified amount = only one in stock

	prices     = list(/obj/item/kinetic_crusher/glaive = 600,
		/obj/item/kinetic_crusher = 600,
		/obj/item/gun/energy/mininglaser = 800,
		/obj/item/melee/shock_maul = 600,
		/obj/item/stack/material/phoron = 12,
		/obj/item/stack/material/uranium = 12,
		/obj/item/stack/material/tritium = 12,
		/obj/item/stack/material/deuterium = 12,
		/obj/item/stack/material/bronze = 12,
		/obj/item/circuitboard/paradoxrift = 2400,
		/obj/item/circuitboard/defenseonelisk = 5000
		)

/mob/living/simple_mob/humanoid/starhunter/trader/farmer
	name = "Starhunter Farmer"
	icon_state = "sunetrader"
	icon_living = "sunetrader"
	products	= list(/obj/item/slime_extract/sepia =3,
		/obj/item/slime_extract/ruby = 3,
		/obj/item/slime_extract/bluespace = 3,
		/obj/item/slime_extract/oil = 3,
		/obj/item/slime_extract/sapphire = 3,
		/obj/item/slime_extract/emerald = 3,
		/obj/item/seeds/shrinkshroom = 12,
		/obj/item/seeds/megashroom = 12,
		/obj/item/seeds/pitcherseed = 6,
		/obj/item/seeds/deathberryseed = 6,
		/obj/item/seeds/ambrosiainfernusseed = 6,
		/obj/item/seeds/thaadra = 6,
		/obj/item/seeds/icepepperseed = 6,
		/obj/item/seeds/jurlmah = 6,
		/obj/item/seeds/amauri = 6,
		/obj/item/seeds/gelthi = 6,
		/obj/item/seeds/vale = 6
		) // For each, use the following pattern:

	premium 	= list() // No specified amount = only one in stock

	prices     = list(/obj/item/slime_extract/sepia = 2500,
		/obj/item/slime_extract/ruby = 2250,
		/obj/item/slime_extract/bluespace = 2250,
		/obj/item/slime_extract/oil = 2250,
		/obj/item/slime_extract/sapphire = 2250,
		/obj/item/slime_extract/emerald = 2250,
		/obj/item/seeds/shrinkshroom = 50,
		/obj/item/seeds/megashroom = 50,
		/obj/item/seeds/pitcherseed = 125,
		/obj/item/seeds/deathberryseed = 125,
		/obj/item/seeds/ambrosiainfernusseed = 125,
		/obj/item/seeds/thaadra = 125,
		/obj/item/seeds/icepepperseed = 125,
		/obj/item/seeds/jurlmah = 125,
		/obj/item/seeds/amauri = 125,
		/obj/item/seeds/gelthi = 125,
		/obj/item/seeds/vale = 125)