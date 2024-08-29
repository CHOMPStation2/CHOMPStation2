//This file is for VR only

/obj/random/explorer_shield
	name = "random explorer shield"
	desc = "This is a random shield for the explorer lockers."
	icon = 'icons/obj/weapons_vr.dmi'
	icon_state = "explorer_shield"

/obj/random/explorer_shield/item_to_spawn()
	return pick(/obj/item/shield/riot/explorer, // CHOMPEdit - Removal of obj/item/weapon
				/obj/item/shield/riot/explorer/purple) // CHOMPEdit - Removal of obj/item/weapon

/obj/random/awayloot
	name = "random away mission loot"
	desc = "A list of things that people can find in away missions."
	icon = 'icons/mob/randomlandmarks.dmi'
	icon_state = "awayloot"
	spawn_nothing_percentage = 50

/obj/random/awayloot/item_to_spawn()
	return pick(prob(50);/obj/item/aliencoin/basic, // CHOMPEdit - Removal of obj/item/weapon
				prob(40);/obj/item/aliencoin/silver, // CHOMPEdit - Removal of obj/item/weapon
				prob(30);/obj/item/aliencoin/gold, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/aliencoin/phoron, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/denecrotizer, // CHOMPEdit - Removal of obj/item/device
				prob(5);/obj/item/capture_crystal,
				prob(5);/obj/item/perfect_tele, // CHOMPEdit - Removal of obj/item/device
				prob(5);/obj/item/bluespace_harpoon, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/cell/infinite, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/cell/void, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/cell/device/weapon/recharge/alien, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/clothing/shoes/boots/speed,
				prob(1);/obj/item/nif, // CHOMPEdit - Removal of obj/item/device
				prob(1);/obj/item/paicard, // CHOMPEdit - Removal of obj/item/device
				prob(2);/obj/item/storage/backpack/dufflebag/syndie, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/storage/backpack/dufflebag/syndie/ammo, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/storage/backpack/dufflebag/syndie/med, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/clothing/mask/gas/voice,
				prob(2);/obj/item/radio_jammer, // CHOMPEdit - Removal of obj/item/device
				prob(1);/obj/item/toy/bosunwhistle,
				prob(1);/obj/item/bananapeel, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/fiftyspawner/platinum,
				prob(3);/obj/fiftyspawner/gold,
				prob(3);/obj/fiftyspawner/silver,
				prob(1);/obj/fiftyspawner/diamond,
				prob(5);/obj/fiftyspawner/phoron,
				prob(1);/obj/item/telecube/randomized, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/capture_crystal/random
				)

/obj/random/awayloot/nofail
	name = "garunteed random away mission loot"
	spawn_nothing_percentage = 0

/obj/random/awayloot/looseloot
/obj/random/awayloot/looseloot/item_to_spawn()
	return pick(prob(50);/obj/item/aliencoin, // CHOMPEdit - Removal of obj/item/weapon
				prob(40);/obj/item/aliencoin/silver, // CHOMPEdit - Removal of obj/item/weapon
				prob(30);/obj/item/aliencoin/gold, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/aliencoin/phoron, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/denecrotizer, // CHOMPEdit - Removal of obj/item/device
				prob(5);/obj/item/capture_crystal,
				prob(3);/obj/item/capture_crystal/great,
				prob(1);/obj/item/capture_crystal/ultra,
				prob(4);/obj/item/capture_crystal/random,
				prob(5);/obj/item/perfect_tele, // CHOMPEdit - Removal of obj/item/device
				prob(5);/obj/item/bluespace_harpoon, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/cell/infinite, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/cell/void, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/cell/device/weapon/recharge/alien, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/clothing/shoes/boots/speed,
				prob(1);/obj/item/nif, // CHOMPEdit - Removal of obj/item/device
				prob(1);/obj/item/paicard, // CHOMPEdit - Removal of obj/item/device
				prob(2);/obj/item/storage/backpack/dufflebag/syndie, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/storage/backpack/dufflebag/syndie/ammo, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/storage/backpack/dufflebag/syndie/med, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/clothing/mask/gas/voice,
				prob(2);/obj/item/radio_jammer, // CHOMPEdit - Removal of obj/item/device
				prob(1);/obj/item/toy/bosunwhistle,
				prob(1);/obj/item/bananapeel, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/fiftyspawner/platinum,
				prob(3);/obj/fiftyspawner/gold,
				prob(3);/obj/fiftyspawner/silver,
				prob(1);/obj/fiftyspawner/diamond,
				prob(5);/obj/fiftyspawner/phoron,
				prob(1);/obj/item/telecube/randomized, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/random/empty_or_lootable_crate,
				prob(10);/obj/random/medical,
				prob(5);/obj/random/firstaid,
				prob(30);/obj/random/maintenance,
				prob(10);/obj/random/mre,
				prob(15);/obj/random/snack,
				prob(10);/obj/random/tech_supply,
				prob(15);/obj/random/tech_supply/component,
				prob(10);/obj/random/tool,
				prob(5);/obj/random/tool/power,
				prob(1);/obj/random/tool/alien,
				prob(5);/obj/random/weapon,
				prob(5);/obj/random/ammo_all,
				prob(3);/obj/random/projectile/random,
				prob(5);/obj/random/multiple/voidsuit
				)

/obj/random/mainttoyloot
	name = "random loot from maint"
	desc = "A list of things that people can find in away missions."
	icon = 'icons/mob/randomlandmarks.dmi'
	icon_state = "fanc_trejur"
	spawn_nothing_percentage = 50

/obj/random/mainttoyloot/item_to_spawn()
	return pick(prob(50);/obj/item/aliencoin/basic, // CHOMPEdit - Removal of obj/item/weapon
				prob(40);/obj/item/aliencoin/silver, // CHOMPEdit - Removal of obj/item/weapon
				prob(30);/obj/item/aliencoin/gold, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/aliencoin/phoron, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/capture_crystal,
				prob(5);/obj/random/mouseray,
				prob(5);/obj/item/perfect_tele, // CHOMPEdit - Removal of obj/item/device
				prob(5);/obj/item/bluespace_harpoon, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/paicard, // CHOMPEdit - Removal of obj/item/device
				prob(2);/obj/item/storage/backpack/dufflebag/syndie, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/storage/backpack/dufflebag/syndie/ammo, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/storage/backpack/dufflebag/syndie/med, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/clothing/mask/gas/voice,
				prob(2);/obj/item/radio_jammer, // CHOMPEdit - Removal of obj/item/device
				prob(1);/obj/item/toy/bosunwhistle,
				prob(1);/obj/item/bananapeel, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/fiftyspawner/platinum,
				prob(3);/obj/fiftyspawner/gold,
				prob(3);/obj/fiftyspawner/silver,
				prob(1);/obj/fiftyspawner/diamond,
				prob(5);/obj/fiftyspawner/phoron,
				prob(1);/obj/item/capture_crystal/random,
				prob(1);/obj/random/unidentified_medicine
				)
/obj/random/mainttoyloot/nofail
	spawn_nothing_percentage = 0


/obj/random/maintenance/misc //Clutter and loot for maintenance and away missions
	name = "random maintenance item"
	desc = "This is a random maintenance item."
	icon = 'icons/mob/randomlandmarks.dmi'
	icon_state = "trejur"
	spawn_nothing_percentage = 25


/obj/random/maintenance/misc/item_to_spawn()
	return pick(prob(500);/obj/random/maintenance,
				prob(300);/obj/random/maintenance/cargo,
				prob(300);/obj/random/maintenance/engineering,
				prob(300);/obj/random/maintenance/medical,
				prob(300);/obj/random/maintenance/research,
				prob(300);/obj/random/maintenance/security,
				prob(300);/obj/random/maintenance/security,
				prob(50);/obj/random/maintenance/morestuff,
				prob(25);/obj/random/mainttoyloot/nofail,
				prob(10);/obj/random/maintenance/foodstuff)

/obj/random/maintenance/foodstuff
	name = "random food or drink item"
	desc = "This is a random maintenance item."
	icon = 'icons/mob/randomlandmarks.dmi'
	icon_state = "foodstuffs"
	spawn_nothing_percentage = 0


/obj/random/maintenance/foodstuff/item_to_spawn()
	return pick(prob(100);/obj/random/snack,
				prob(100);/obj/random/drinksoft,
				prob(50);/obj/random/mre,
				prob(10);/obj/random/donkpocketbox,
				prob(1);/obj/random/meat)

/obj/random/maintenance/morestuff
	name = "random potentially useful things"
	desc = "This is a random maintenance item."
	icon = 'icons/mob/randomlandmarks.dmi'
	icon_state = "trejur"
	spawn_nothing_percentage = 0


/obj/random/maintenance/misc/item_to_spawn()
	return pick(prob(10);/obj/random/tool,
				prob(1);/obj/random/toolbox,
				prob(2);/obj/random/powercell,
				prob(2);/obj/random/flashlight,
				prob(1);/obj/random/pouch,
				prob(1);/obj/random/thermalponcho,
				prob(5);/obj/random/contraband,
				prob(5);/obj/random/cargopod,
				prob(1);/obj/item/flame/lighter, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/storage/wallet/random, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/random/cutout)

/obj/random/instrument
	name = "random instrument"
	desc = "This is a random instrument."
	icon = 'icons/obj/musician.dmi'
	icon_state = "violin"
	spawn_nothing_percentage = 0

/obj/random/instrument/item_to_spawn()
	return pick(prob(5);/obj/item/instrument/violin,
				prob(5);/obj/item/instrument/banjo,
				prob(5);/obj/item/instrument/guitar,
				prob(5);/obj/item/instrument/eguitar,
				prob(5);/obj/item/instrument/accordion,
				prob(5);/obj/item/instrument/trumpet,
				prob(5);/obj/item/instrument/saxophone,
				prob(5);/obj/item/instrument/trombone,
				prob(5);/obj/item/instrument/recorder,
				prob(5);/obj/item/instrument/harmonica,
				prob(1);/obj/item/instrument/bikehorn,
				prob(5);/obj/item/instrument/piano_synth,
				prob(5);/obj/item/instrument/glockenspiel,
				prob(1);/obj/item/instrument/musicalmoth
				)

/obj/random/internal_organ
	name = "random organ"
	desc = "A random internal organ. Juicy fresh! Or... maybe not."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "heart"
	spawn_nothing_percentage = 10

/obj/random/internal_organ/item_to_spawn()
	return pick(prob(5);/obj/item/organ/internal/appendix,
				prob(5);/obj/item/organ/internal/eyes,
				prob(5);/obj/item/organ/internal/heart,
				prob(5);/obj/item/organ/internal/kidneys,
				prob(5);/obj/item/organ/internal/liver,
				prob(5);/obj/item/organ/internal/spleen,
				prob(5);/obj/item/organ/internal/lungs,
				prob(5);/obj/item/organ/internal/stomach,
				prob(5);/obj/item/organ/internal/voicebox,
				)

/obj/random/potion
	name = "random potion"
	desc = "A random potion."
	icon_state = "potion"
	spawn_nothing_percentage = 0

/obj/random/potion/item_to_spawn()
	return pick(prob(20);/obj/item/reagent_containers/glass/bottle/potion/healing, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/reagent_containers/glass/bottle/potion/greater_healing, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/reagent_containers/glass/bottle/potion/fire_resist, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/reagent_containers/glass/bottle/potion/antidote, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/reagent_containers/glass/bottle/potion/water, // CHOMPEdit - Removal of obj/item/weapon
				prob(8);/obj/item/reagent_containers/glass/bottle/potion/regeneration, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/reagent_containers/glass/bottle/potion/panacea, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/reagent_containers/glass/bottle/potion/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/reagent_containers/glass/bottle/potion/lightness, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/reagent_containers/glass/bottle/potion/SOP, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/reagent_containers/glass/bottle/potion/shrink, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/reagent_containers/glass/bottle/potion/growth, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/reagent_containers/glass/bottle/potion/pain, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/reagent_containers/glass/bottle/potion/faerie, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/reagent_containers/glass/bottle/potion/relaxation, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/reagent_containers/glass/bottle/potion/speed, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/reagent_containers/glass/bottle/potion/attractiveness, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/reagent_containers/glass/bottle/potion/girljuice, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/reagent_containers/glass/bottle/potion/boyjuice, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/reagent_containers/glass/bottle/potion/badpolymorph, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/reagent_containers/glass/bottle/potion/bonerepair, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/reagent_containers/glass/bottle/potion/truepolymorph // CHOMPEdit - Removal of obj/item/weapon
				)

/obj/random/potion_ingredient
	name = "random potion ingredient"
	desc = "A random potion."
	icon_state = "ingredient"
	spawn_nothing_percentage = 0

/obj/random/potion_ingredient/item_to_spawn()
	return pick(prob(10);/obj/item/potion_material/blood_ruby, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/potion_material/ruby_eye, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/potion_material/golden_scale, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/potion_material/frozen_dew, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/potion_material/living_coral, // CHOMPEdit - Removal of obj/item/weapon
				prob(4);/obj/item/potion_material/rare_horn, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/potion_material/moldy_bread, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/potion_material/glowing_gem, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/potion_material/giant_toe, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/potion_material/flesh_of_the_stars, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/potion_material/spinning_poppy, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/potion_material/salt_mage, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/potion_material/golden_grapes, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/potion_material/fairy_house, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/potion_material/thorny_bulb, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/potion_material/ancient_egg, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/potion_material/crown_stem, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/potion_material/red_ingot, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/potion_material/soft_diamond, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/potion_material/solid_mist, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/potion_material/spider_leg, // CHOMPEdit - Removal of obj/item/weapon
				prob(1);/obj/item/potion_material/folded_dark // CHOMPEdit - Removal of obj/item/weapon
				)

/obj/random/potion_base
	name = "random potion base"
	desc = "A random potion base."
	icon_state = "base"
	spawn_nothing_percentage = 0

/obj/random/potion_base/item_to_spawn()
	return pick(prob(10);/obj/item/potion_base/aqua_regia, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/potion_base/ichor, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/potion_base/alkahest // CHOMPEdit - Removal of obj/item/weapon
				)

/obj/random/fantasy_item
	name = "random fantasy item"
	desc = "A random fantasy item."
	icon_state = "fantasy"
	spawn_nothing_percentage = 0

/obj/random/fantasy_item/item_to_spawn()
	return pick(prob(3);/obj/item/healthanalyzer/scroll, // CHOMPEdit - Removal of obj/item/device
				prob(10);/obj/item/gun/energy/taser/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/bluespace_harpoon/wand, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/slow_sizegun/magic, // CHOMPEdit - Removal of obj/item/device
				prob(10);/obj/item/clothing/gloves/bluespace/magic,
				prob(30);/obj/item/coin/gold, // CHOMPEdit - Removal of obj/item/weapon
				prob(30);/obj/item/coin/silver, // CHOMPEdit - Removal of obj/item/weapon
				prob(30);/obj/item/coin/platinum, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/material/sword/rapier, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/material/sword/longsword, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/clothing/head/helmet/bucket/wood,
				prob(3);/obj/item/tool/wirecutters/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/tool/crowbar/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/tool/screwdriver/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/weldingtool/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/tool/wrench/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/surgical/bone_clamp/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/stack/material/gold,
				prob(10);/obj/item/stack/material/silver,
				prob(3);/obj/item/bone/skull, // CHOMPEdit - Removal of obj/item/weapon
				prob(20);/obj/item/material/twohanded/staff, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/gun/energy/hooklauncher/ring, // CHOMPEdit - Removal of obj/item/weapon
				prob(3);/obj/item/toy/eight_ball,
				prob(3);/obj/item/perfect_tele/magic // CHOMPEdit - Removal of obj/item/device
				)

/obj/random/fantasy_item/better
	name = "better random fantasy item"
	desc = "A random fantasy item."
	icon_state = "fantasy2"
	spawn_nothing_percentage = 0

/obj/random/fantasy_item/better/item_to_spawn()
	return pick(prob(10);/obj/item/healthanalyzer/scroll, // CHOMPEdit - Removal of obj/item/device
				prob(10);/obj/item/gun/energy/taser/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/bluespace_harpoon/wand, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/slow_sizegun/magic, // CHOMPEdit - Removal of obj/item/device
				prob(10);/obj/item/clothing/gloves/bluespace/magic,
				prob(10);/obj/item/tool/wirecutters/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/tool/crowbar/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/tool/screwdriver/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/weldingtool/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/tool/wrench/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/surgical/bone_clamp/alien/magic, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/material/twohanded/staff, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/gun/energy/hooklauncher/ring, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/perfect_tele/magic, // CHOMPEdit - Removal of obj/item/device
				prob(10);/obj/item/reagent_containers/glass/bottle/potion/truepolymorph // CHOMPEdit - Removal of obj/item/weapon
				)

/obj/random/mega_nukies
	name = "random mega nukie"
	desc = "A random mega nukie."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "nukie_mega_high"
	spawn_nothing_percentage = 0

/obj/random/mega_nukies/item_to_spawn()
	return pick(prob(5);/obj/item/reagent_containers/food/drinks/cans/nukie_mega_sight, // CHOMPEdit - Removal of obj/item/weapon
				prob(2);/obj/item/reagent_containers/food/drinks/cans/nukie_mega_heart, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/reagent_containers/food/drinks/cans/nukie_mega_sleep, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/reagent_containers/food/drinks/cans/nukie_mega_shock, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/reagent_containers/food/drinks/cans/nukie_mega_fast, // CHOMPEdit - Removal of obj/item/weapon
				prob(5);/obj/item/reagent_containers/food/drinks/cans/nukie_mega_high, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/reagent_containers/food/drinks/cans/nukie_mega_shrink, // CHOMPEdit - Removal of obj/item/weapon
				prob(10);/obj/item/reagent_containers/food/drinks/cans/nukie_mega_grow // CHOMPEdit - Removal of obj/item/weapon
				)
