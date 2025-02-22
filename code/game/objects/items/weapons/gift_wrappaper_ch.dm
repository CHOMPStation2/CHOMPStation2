
// Chomp gift, randomized color and size, wider selection of items to obtain, also chance of chaos present with even wilder stuff


/obj/item/a_gift/advanced
	name = "present"
	desc = "Its a Christmas present! It has a tag on it that says: 'Chomp staff thank you all for the year that has passed and wish you a merry Christmas and a happy new year. May the new year be good and well for you with many achievements and happy times!'"
	icon = 'icons/obj/items_ch.dmi'
	icon_state = "chomp_present"
	item_state = "chomp_present"
	plane = ABOVE_MOB_PLANE
	var/chaos

/obj/item/a_gift/advanced/New()
	..()
	icon_state += "_[pick("g","r","b","y","p")]"
	if(prob(1))
		icon_state = "chomp_present_chaos"
		chaos = TRUE
		name = "chaotic present"
		desc = "The casino dev messed up and gave you the wrong present! This one pulses with potential for good or evil!"
	return

/obj/item/a_gift/advanced/attack_self(mob/M as mob) //WIP - ALWAYS add more items to list! - Jack
	var/gift_type_advanced = pick(
		/obj/item/binoculars/spyglass,
		/obj/item/bodysnatcher,
		/obj/item/cataloguer/advanced,
		/obj/item/flashlight/slime,
		/obj/item/lightreplacer,
		/obj/item/book/tome,
		/obj/item/cell/device/weapon/recharge/alien/hybrid,
		/obj/item/disk/nifsoft/compliance,
		/obj/item/implanter/adrenalin,
		/obj/item/lego,
		/obj/item/moneybag,
		/obj/item/pickaxe/diamonddrill,
		/obj/item/rcd/advanced/loaded,
		/obj/item/bluespace_harpoon,
		/obj/item/storage/backpack/dufflebag/syndie,
		/obj/item/storage/belt/medical/alien,
		/obj/item/storage/toolbox/syndicate/powertools,
		/obj/item/surgical/FixOVein/alien,
		/obj/item/surgical/bone_clamp/alien,
		/obj/item/surgical/cautery/alien,
		/obj/item/surgical/circular_saw/alien,
		/obj/item/surgical/hemostat/alien,
		/obj/item/surgical/retractor/alien,
		/obj/item/surgical/scalpel/alien,
		/obj/item/surgical/surgicaldrill/alien,
		/obj/item/sword/fluff/joanaria/scisword,
		/obj/item/tool/wrench/alien,
		/obj/item/tool/wirecutters/alien,
		/obj/item/tool/screwdriver/alien,
		/obj/item/tool/crowbar/alien,
		/obj/item/weldingtool/alien,
		/obj/item/twohanded/fireaxe/fluff/mjollnir,
		/obj/item/gun/launcher/confetti_cannon/overdrive,
		/obj/item/gun/energy/sizegun,
		/obj/item/gun/energy/netgun,
		/obj/item/storage/belt/utility/alien,
		/obj/item/clothing/suit/armor/alien,
		/obj/item/clothing/glasses/monocoole,
		/obj/item/reagent_containers/spray/chemsprayer,
		/obj/item/reagent_containers/glass/beaker/bluespace,
		/obj/item/reagent_containers/glass/beaker/noreact,
		/obj/item/storage/box/casino/costume_whitebunny,
		/obj/item/storage/box/casino/costume_blackbunny,
		/obj/item/storage/box/casino/costume_sexymime,
		/obj/item/storage/box/casino/costume_sexyclown,
		/obj/item/storage/box/casino/costume_nyangirl,
		/obj/item/storage/box/casino/costume_wizard,
		/obj/item/storage/box/casino/costume_chicken,
		/obj/item/storage/box/casino/costume_gladiator,
		/obj/item/storage/box/casino/costume_pirate,
		/obj/item/storage/box/casino/costume_commie,
		/obj/item/storage/box/casino/costume_imperiummonk,
		/obj/item/storage/box/casino/costume_plaguedoctor,
		/obj/item/storage/box/casino/costume_cutewitch,
		/obj/item/grenade/spawnergrenade/casino,
		/obj/item/grenade/spawnergrenade/casino/goat,
		/obj/item/grenade/spawnergrenade/casino/armadillo,
		/obj/item/grenade/spawnergrenade/casino/cat,
		/obj/item/grenade/spawnergrenade/casino/chicken,
		/obj/item/grenade/spawnergrenade/casino/cow,
		/obj/item/grenade/spawnergrenade/casino/corgi,
		/obj/item/grenade/spawnergrenade/casino/fox,
		/obj/item/grenade/spawnergrenade/casino/lizard,
		/obj/item/grenade/spawnergrenade/casino/penguin,
		/obj/item/grenade/spawnergrenade/casino/snake,
		/obj/item/grenade/spawnergrenade/casino/yithian,
		/obj/item/grenade/spawnergrenade/casino/tindalos,
		/obj/item/grenade/spawnergrenade/casino/fennec,
		/obj/item/grenade/spawnergrenade/casino/redpanda,
		/obj/item/grenade/spawnergrenade/casino/horse,
		/obj/item/grenade/spawnergrenade/casino/otie,
		/obj/item/grenade/spawnergrenade/casino/otie/chubby,
		/obj/item/grenade/spawnergrenade/casino/zorgoia,
		/obj/item/grenade/spawnergrenade/casino/gygax,
		/obj/item/lego,
		/obj/item/dnainjector/set_trait/nobreathe,
		/obj/item/dnainjector/set_trait/regenerate,
		/obj/item/dnainjector/set_trait/remoteview,
		/obj/item/dnainjector/set_trait/haste,
		/obj/item/dnainjector/set_trait/tk,
		/obj/item/dnainjector/set_trait/xray,
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
		/obj/item/implantcase/adrenalin,
		/obj/item/implantcase/analyzer,
		/obj/item/implantcase/armblade,
		/obj/item/implantcase/dart,
		/obj/item/implantcase/freedom,
		/obj/item/implantcase/handblade,
		/obj/item/implantcase/language/eal,
		/obj/item/implantcase/laser,
		/obj/item/implantcase/loyalty,
		/obj/item/implantcase/medkit,
		/obj/item/implantcase/restrainingbolt,
		/obj/item/implantcase/shades,
		/obj/item/implantcase/sprinter,
		/obj/item/implantcase/surge,
		/obj/item/implantcase/sword,
		/obj/item/implantcase/taser,
		/obj/item/implantcase/toolkit,
		/obj/item/implantcase/vrlanguage,
		/obj/item/implanter/sizecontrol,
		/obj/item/grenade/spawnergrenade/casino/gygax/mining,
		/obj/item/grenade/spawnergrenade/casino/gygax/firefighter,
		/obj/item/grenade/spawnergrenade/casino/gygax/serenity,
		/obj/item/grenade/spawnergrenade/casino/gygax/Odysseus,
		/obj/item/grenade/spawnergrenade/casino/gygax/scree,
		/obj/item/grenade/spawnergrenade/casino/gygax/janus,
		/obj/item/grenade/spawnergrenade/casino/gygax/scarab,
		/obj/item/grenade/spawnergrenade/casino/gygax/shuttlepod,
		/obj/item/grenade/spawnergrenade/casino/gygax/shuttlecraft,
		/obj/item/rig/bayeng,
		/obj/item/rig/baymed,
		/obj/item/rig/ce,
		/obj/item/rig/ch/pursuit,
		/obj/item/rig/combat,
		/obj/item/rig/ert/janitor,
		/obj/item/rig/industrial,
		/obj/item/rig/internalaffairs,
		/obj/item/rig/medical)

	var/gift_type_chaos = pick(
		/obj/item/grenade/spawnergrenade/casino/gygax/gorilla,
		/obj/item/dnainjector/set_trait/hulk,
		/obj/item/grenade/spawnergrenade/casino/infinitycake,
		/obj/item/grenade/spawnergrenade/casino/universal_technomancer,
		/obj/item/spellbook,
		/obj/item/book/tome/imbued)

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
