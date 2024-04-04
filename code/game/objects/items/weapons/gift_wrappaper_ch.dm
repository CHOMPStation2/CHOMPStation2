
// Chomp gift, randomized color and size, wider selection of items to obtain, also chance of chaos present with even wilder stuff


/obj/item/weapon/a_gift/advanced
	name = "present"
	desc = "Its a Christmas present! It has a tag on it that says: 'Chomp staff thank you all for the year that has passed and wish you a merry Christmas and a happy new year. May the new year be good and well for you with many achievements and happy times!'"
	icon = 'icons/obj/items_ch.dmi'
	icon_state = "chomp_present"
	item_state = "chomp_present"
	plane = ABOVE_MOB_PLANE
	var/chaos

/obj/item/weapon/a_gift/advanced/New()
	..()
	icon_state += "_[pick("g","r","b","y","p")]"
	if(prob(1))
		icon_state = "chomp_present_chaos"
		chaos = TRUE
		name = "chaotic present"
		desc = "The casino dev messed up and gave you the wrong present! This one pulses with potential for good or evil!"
	return

/obj/item/weapon/a_gift/advanced/attack_self(mob/M as mob) //WIP - ALWAYS add more items to list! - Jack
	var/gift_type_advanced = pick(
		/obj/item/device/binoculars/spyglass,
		/obj/item/device/bodysnatcher,
		/obj/item/device/cataloguer/advanced,
		/obj/item/device/flashlight/slime,
		/obj/item/device/lightreplacer,
		/obj/item/weapon/book/tome,
		/obj/item/weapon/cell/device/weapon/recharge/alien/hybrid,
		/obj/item/weapon/disk/nifsoft/compliance,
		/obj/item/weapon/implanter/adrenalin,
		/obj/item/weapon/lego,
		/obj/item/weapon/moneybag,
		/obj/item/weapon/pickaxe/diamonddrill,
		/obj/item/weapon/rcd/advanced/loaded,
		/obj/item/weapon/bluespace_harpoon,
		/obj/item/weapon/storage/backpack/dufflebag/syndie,
		/obj/item/weapon/storage/belt/medical/alien,
		/obj/item/weapon/storage/toolbox/syndicate/powertools,
		/obj/item/weapon/surgical/FixOVein/alien,
		/obj/item/weapon/surgical/bone_clamp/alien,
		/obj/item/weapon/surgical/cautery/alien,
		/obj/item/weapon/surgical/circular_saw/alien,
		/obj/item/weapon/surgical/hemostat/alien,
		/obj/item/weapon/surgical/retractor/alien,
		/obj/item/weapon/surgical/scalpel/alien,
		/obj/item/weapon/surgical/surgicaldrill/alien,
		/obj/item/weapon/sword/fluff/joanaria/scisword,
		/obj/item/weapon/tool/wrench/alien,
		/obj/item/weapon/tool/wirecutters/alien,
		/obj/item/weapon/tool/screwdriver/alien,
		/obj/item/weapon/tool/crowbar/alien,
		/obj/item/weapon/weldingtool/alien,
		/obj/item/weapon/twohanded/fireaxe/fluff/mjollnir,
		/obj/item/weapon/gun/launcher/confetti_cannon/overdrive,
		/obj/item/weapon/gun/energy/sizegun,
		/obj/item/weapon/gun/energy/netgun,
		/obj/item/weapon/storage/belt/utility/alien,
		/obj/item/clothing/suit/armor/alien,
		/obj/item/clothing/glasses/monocoole,
		/obj/item/weapon/reagent_containers/spray/chemsprayer,
		/obj/item/weapon/reagent_containers/glass/beaker/bluespace,
		/obj/item/weapon/reagent_containers/glass/beaker/noreact,
		/obj/item/weapon/storage/box/casino/costume_whitebunny,
		/obj/item/weapon/storage/box/casino/costume_blackbunny,
		/obj/item/weapon/storage/box/casino/costume_sexymime,
		/obj/item/weapon/storage/box/casino/costume_sexyclown,
		/obj/item/weapon/storage/box/casino/costume_nyangirl,
		/obj/item/weapon/storage/box/casino/costume_wizard,
		/obj/item/weapon/storage/box/casino/costume_chicken,
		/obj/item/weapon/storage/box/casino/costume_gladiator,
		/obj/item/weapon/storage/box/casino/costume_pirate,
		/obj/item/weapon/storage/box/casino/costume_commie,
		/obj/item/weapon/storage/box/casino/costume_imperiummonk,
		/obj/item/weapon/storage/box/casino/costume_plaguedoctor,
		/obj/item/weapon/storage/box/casino/costume_cutewitch,
		/obj/item/weapon/grenade/spawnergrenade/casino,
		/obj/item/weapon/grenade/spawnergrenade/casino/goat,
		/obj/item/weapon/grenade/spawnergrenade/casino/armadillo,
		/obj/item/weapon/grenade/spawnergrenade/casino/cat,
		/obj/item/weapon/grenade/spawnergrenade/casino/chicken,
		/obj/item/weapon/grenade/spawnergrenade/casino/cow,
		/obj/item/weapon/grenade/spawnergrenade/casino/corgi,
		/obj/item/weapon/grenade/spawnergrenade/casino/fox,
		/obj/item/weapon/grenade/spawnergrenade/casino/lizard,
		/obj/item/weapon/grenade/spawnergrenade/casino/penguin,
		/obj/item/weapon/grenade/spawnergrenade/casino/snake,
		/obj/item/weapon/grenade/spawnergrenade/casino/yithian,
		/obj/item/weapon/grenade/spawnergrenade/casino/tindalos,
		/obj/item/weapon/grenade/spawnergrenade/casino/fennec,
		/obj/item/weapon/grenade/spawnergrenade/casino/redpanda,
		/obj/item/weapon/grenade/spawnergrenade/casino/horse,
		/obj/item/weapon/grenade/spawnergrenade/casino/otie,
		/obj/item/weapon/grenade/spawnergrenade/casino/otie/chubby,
		/obj/item/weapon/grenade/spawnergrenade/casino/zorgoia,
		/obj/item/weapon/grenade/spawnergrenade/casino/gygax,
		/obj/item/weapon/lego,
		/obj/item/weapon/dnainjector/nobreath,
		/obj/item/weapon/dnainjector/regenerate,
		/obj/item/weapon/dnainjector/remoteview,
		/obj/item/weapon/dnainjector/runfast,
		/obj/item/weapon/dnainjector/telemut,
		/obj/item/weapon/dnainjector/xraymut,
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
		/obj/item/weapon/implantcase/adrenalin,
		/obj/item/weapon/implantcase/analyzer,
		/obj/item/weapon/implantcase/armblade,
		/obj/item/weapon/implantcase/dart,
		/obj/item/weapon/implantcase/freedom,
		/obj/item/weapon/implantcase/handblade,
		/obj/item/weapon/implantcase/language/eal,
		/obj/item/weapon/implantcase/laser,
		/obj/item/weapon/implantcase/loyalty,
		/obj/item/weapon/implantcase/medkit,
		/obj/item/weapon/implantcase/restrainingbolt,
		/obj/item/weapon/implantcase/shades,
		/obj/item/weapon/implantcase/sprinter,
		/obj/item/weapon/implantcase/surge,
		/obj/item/weapon/implantcase/sword,
		/obj/item/weapon/implantcase/taser,
		/obj/item/weapon/implantcase/toolkit,
		/obj/item/weapon/implantcase/vrlanguage,
		/obj/item/weapon/implanter/sizecontrol,
		/obj/item/weapon/grenade/spawnergrenade/casino/gygax/mining,
		/obj/item/weapon/grenade/spawnergrenade/casino/gygax/firefighter,
		/obj/item/weapon/grenade/spawnergrenade/casino/gygax/serenity,
		/obj/item/weapon/grenade/spawnergrenade/casino/gygax/Odysseus,
		/obj/item/weapon/grenade/spawnergrenade/casino/gygax/scree,
		/obj/item/weapon/grenade/spawnergrenade/casino/gygax/janus,
		/obj/item/weapon/grenade/spawnergrenade/casino/gygax/scarab,
		/obj/item/weapon/grenade/spawnergrenade/casino/gygax/shuttlepod,
		/obj/item/weapon/grenade/spawnergrenade/casino/gygax/shuttlecraft,
		/obj/item/weapon/rig/bayeng,
		/obj/item/weapon/rig/baymed,
		/obj/item/weapon/rig/ce,
		/obj/item/weapon/rig/ch/pursuit,
		/obj/item/weapon/rig/combat,
		/obj/item/weapon/rig/ert/janitor,
		/obj/item/weapon/rig/industrial,
		/obj/item/weapon/rig/internalaffairs,
		/obj/item/weapon/rig/medical)

	var/gift_type_chaos = pick(
		/obj/item/weapon/grenade/spawnergrenade/casino/gygax/gorilla,
		/obj/item/weapon/dnainjector/hulkmut,
		/obj/item/weapon/grenade/spawnergrenade/casino/infinitycake,
		/obj/item/weapon/grenade/spawnergrenade/casino/universal_technomancer,
		/obj/item/weapon/spellbook,
		/obj/item/weapon/book/tome/imbued)

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