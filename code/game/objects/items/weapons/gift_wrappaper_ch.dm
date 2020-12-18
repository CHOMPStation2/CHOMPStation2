
// Chomp gift, randomized color and size, wider selection of items to obtain, also chance of chaos present with even wilder stuff


/obj/item/weapon/a_gift/advanced
	name = "present"
	desc = "A gift! What could be inside?!"
	icon = 'icons/obj/items_ch.dmi'
	icon_state = "gift1_g"
	item_state = "gift1_g"
	var/chaos = "I can do anything!"

/obj/item/weapon/a_gift/advanced/New()
	..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)

	/* DISABLED FOR NOW: STRONG TOYS IN REWARDS OF POOL - Jack
	chaos = rand(1, 100)
	if(chaos == 1)
		icon_state = "gift_chaos"
		chaos = TRUE
	else
		icon_state = "gift[pick("1", "2", "3")]_[pick("g", "r", "b", "y", "p")]"
		chaos = FALSE
	*/

	icon_state = "gift[pick("1", "2", "3")]_[pick("g", "r", "b", "y", "p")]"
	item_state = icon_state
	chaos = FALSE
	return

/obj/item/weapon/a_gift/advanced/attack_self(mob/M as mob) //WIP - add more items to list! - Jack
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
		/obj/item/weapon/grenade/confetti)

	var/gift_type_chaos = pick(
		/obj/item/weapon/lego/gib,
		/obj/item/weapon/grenade/spawnergrenade/casino/infinitycake,
		/obj/item/weapon/gun/energy/meteorgun,
		/obj/item/weapon/grenade/spawnergrenade/casino/universal_technomancer,
		/obj/item/weapon/spellbook,
		/obj/item/weapon/book/tome/imbued)

	if(!ispath(gift_type_advanced,/obj/item))	return

	var/obj/item/I1 = new gift_type_advanced(M)

	if(chaos == TRUE)
		var/obj/item/I2 = new gift_type_chaos(M)
		M.remove_from_mob(src)
		M.put_in_hands(I2)
		I2.add_fingerprint(M)

		qdel(src)
		return
	else
		M.remove_from_mob(src)
		M.put_in_hands(I1)
		I1.add_fingerprint(M)

		qdel(src)
		return