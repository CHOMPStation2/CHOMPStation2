
// Chomp gift, randomized color and size, wider selection of items to obtain, also chance of chaos present with even wilder stuff


/obj/item/a_gift/advanced // CHOMPEdit - Removal of obj/item/weapon
	name = "present"
	desc = "Its a Christmas present! It has a tag on it that says: 'Chomp staff thank you all for the year that has passed and wish you a merry Christmas and a happy new year. May the new year be good and well for you with many achievements and happy times!'"
	icon = 'icons/obj/items_ch.dmi'
	icon_state = "chomp_present"
	item_state = "chomp_present"
	plane = ABOVE_MOB_PLANE
	var/chaos

/obj/item/a_gift/advanced/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	icon_state += "_[pick("g","r","b","y","p")]"
	if(prob(1))
		icon_state = "chomp_present_chaos"
		chaos = TRUE
		name = "chaotic present"
		desc = "The casino dev messed up and gave you the wrong present! This one pulses with potential for good or evil!"
	return

/obj/item/a_gift/advanced/attack_self(mob/M as mob) //WIP - ALWAYS add more items to list! - Jack // CHOMPEdit - Removal of obj/item/weapon
	var/gift_type_advanced = pick(
		/obj/item/binoculars/spyglass, // CHOMPEdit - Removal of obj/item/device
		/obj/item/bodysnatcher, // CHOMPEdit - Removal of obj/item/device
		/obj/item/cataloguer/advanced, // CHOMPEdit - Removal of obj/item/device
		/obj/item/flashlight/slime, // CHOMPEdit - Removal of obj/item/device
		/obj/item/lightreplacer, // CHOMPEdit - Removal of obj/item/device
		/obj/item/book/tome, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/cell/device/weapon/recharge/alien/hybrid, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/disk/nifsoft/compliance, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implanter/adrenalin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/lego, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/moneybag, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/pickaxe/diamonddrill, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rcd/advanced/loaded, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/bluespace_harpoon, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/backpack/dufflebag/syndie, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/medical/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/toolbox/syndicate/powertools, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/FixOVein/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/bone_clamp/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/cautery/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/circular_saw/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/hemostat/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/retractor/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/scalpel/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/surgical/surgicaldrill/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/sword/fluff/joanaria/scisword, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wrench/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/wirecutters/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/screwdriver/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/tool/crowbar/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/weldingtool/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/twohanded/fireaxe/fluff/mjollnir, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/launcher/confetti_cannon/overdrive, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/sizegun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/gun/energy/netgun, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/utility/alien, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/suit/armor/alien,
		/obj/item/clothing/glasses/monocoole,
		/obj/item/reagent_containers/spray/chemsprayer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/beaker/bluespace, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/reagent_containers/glass/beaker/noreact, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_whitebunny, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_blackbunny, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_sexymime, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_sexyclown, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_nyangirl, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_wizard, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_chicken, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_gladiator, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_pirate, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_commie, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_imperiummonk, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_plaguedoctor, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/box/casino/costume_cutewitch, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/goat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/armadillo, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/cat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/chicken, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/cow, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/corgi, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/fox, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/lizard, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/penguin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/snake, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/yithian, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/tindalos, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/fennec, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/redpanda, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/horse, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/otie, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/otie/chubby, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/zorgoia, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/gygax, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/lego, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/dnainjector/nobreath, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/dnainjector/regenerate, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/dnainjector/remoteview, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/dnainjector/runfast, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/dnainjector/telemut, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/dnainjector/xraymut, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/instrument/accordion,
		/obj/item/instrument/banjo,
		/obj/item/instrument/bikehorn,
		/obj/item/instrument/eguitar,
		/obj/item/instrument/glockenspiel,
		/obj/item/instrument/guitar,
		/obj/item/instrument/harmonica,
		/obj/item/instrument/keytar,
		/obj/item/instrument/musicalmoth,
		/obj/item/instrument/piano_synth,
		/obj/item/instrument/recorder,
		/obj/item/instrument/saxophone,
		/obj/item/instrument/saxophone/spectral,
		/obj/item/instrument/trombone,
		/obj/item/instrument/trombone/spectral,
		/obj/item/instrument/trumpet,
		/obj/item/instrument/trumpet/spectral,
		/obj/item/instrument/violin,
		/obj/item/instrument/violin/golden,
		/obj/item/instrument/xylophone,
		/obj/item/implantcase/adrenalin, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/analyzer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/armblade, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/dart, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/freedom, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/handblade, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/language/eal, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/laser, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/loyalty, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/medkit, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/restrainingbolt, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/shades, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/sprinter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/surge, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/sword, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/taser, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/toolkit, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implantcase/vrlanguage, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/implanter/sizecontrol, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/gygax/mining, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/gygax/firefighter, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/gygax/serenity, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/gygax/Odysseus, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/gygax/scree, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/gygax/janus, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/gygax/scarab, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/gygax/shuttlepod, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/gygax/shuttlecraft, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rig/bayeng, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rig/baymed, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rig/ce, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rig/ch/pursuit, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rig/combat, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rig/ert/janitor, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rig/industrial, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rig/internalaffairs, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/rig/medical) // CHOMPEdit - Removal of obj/item/weapon

	var/gift_type_chaos = pick(
		/obj/item/grenade/spawnergrenade/casino/gygax/gorilla, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/dnainjector/hulkmut, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/infinitycake, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/grenade/spawnergrenade/casino/universal_technomancer, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/spellbook, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/book/tome/imbued) // CHOMPEdit - Removal of obj/item/weapon

	var/obj/item/I = null


	if(chaos)
		if(!ispath(gift_type_chaos,/obj/item))	return
		I = new gift_type_chaos(M)

	else
		if(!ispath(gift_type_advanced,/obj/item))	return
		I = new gift_type_advanced(M)

	M.remove_from_mob(src)
	M.put_in_hands(I)
	I.add_fingerprint(M)

	qdel(src)
	return