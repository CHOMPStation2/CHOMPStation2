// Contains the supply vouchers for taskmanager.dm
/obj/item/surplus_voucher
	icon = 'icons/obj/items.dmi'
	icon_state = "pizza_voucher"
	throwforce = 0
	throw_speed = 5
	throw_range = 4
	force = 0

/obj/item/surplus_voucher/com
	name = "Reward Surplus Voucher"
	desc = "A surplus voucher! This one is meant to reward valued employees! Activate it for your surplus delivery!"
/obj/item/surplus_voucher/com/attack_self(mob/user as mob)
	spawn_item(get_turf(src))

/obj/item/surplus_voucher/com/proc/spawn_item(var/turf/T)
	var/path = pick(prob(6);/obj/item/reagent_containers/food/drinks/bottle/whiskey, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/drinks/bottle/specialwhiskey, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/drinks/bottle/vodka, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/drinks/bottle/tequilla, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/drinks/bottle/rum, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/drinks/bottle/goldschlager, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/drinks/bottle/vermouth, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/drinks/bottle/cognac, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/drinks/bottle/wine, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/spacecash/c50, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/spacecash/c100, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/snacks/bigbiteburger, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/snacks/cheeseburger, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/snacks/fries, // CHOMPEdit - Removal of obj/item/weapon
					prob(2);/obj/item/pizzabox/meat,
					prob(2);/obj/item/pizzabox/vegetable,
					prob(1);/obj/item/pizzabox/pineapple,
					prob(2);/obj/item/pizzabox/margherita,
					prob(2);/obj/item/pizzabox/mushroom,
					prob(3);/obj/item/toy/bouquet,
					prob(5);/obj/item/reagent_containers/food/drinks/bottle/small/beer, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/box/snappops, // CHOMPEdit - Removal of obj/item/weapon
					prob(2);/obj/item/clothing/under/syndicate/tacticool,
					prob(3);/obj/item/clothing/head/cowboy/small,
					prob(3);/obj/item/toy/sword,
					prob(3);/obj/item/toy/cultsword,
					prob(1);/obj/structure/plushie/ian)
	playsound(T, 'sound/effects/phasein.ogg', 25, 1)
	new path(T)
	del(src)

/obj/item/surplus_voucher/eng
	name = "Engineering Surplus Voucher"
	desc = "A surplus voucher! This one is meant to resupply engineering with tools! Activate it for your surplus delivery!"
/obj/item/surplus_voucher/eng/attack_self(mob/user as mob)
	spawn_item(get_turf(src))

/obj/item/surplus_voucher/eng/proc/spawn_item(var/turf/T)
	var/path = pick(prob(2);/datum/design/item/powercell/high,
					prob(2);/obj/item/storage/briefcase/inflatable, // CHOMPEdit - Removal of obj/item/weapon
					prob(2);/obj/item/clamp,
					prob(3);/obj/item/extinguisher, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/weldingtool/largetank, // CHOMPEdit - Removal of obj/item/weapon
					prob(2);/obj/item/tool/wirecutters, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/tool/wrench, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/tool/screwdriver, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/analyzer, // CHOMPEdit - Removal of obj/item/device
					prob(3);/obj/item/t_scanner, // CHOMPEdit - Removal of obj/item/device
					prob(2);/obj/item/grenade/chem_grenade/metalfoam, // CHOMPEdit - Removal of obj/item/weapon
					prob(1);/obj/item/toy/figure/engineer)
	playsound(T, 'sound/effects/phasein.ogg', 25, 1)
	new path(T)
	del(src)



/obj/item/surplus_voucher/med
	name = "Medical Surplus Voucher"
	desc = "A surplus voucher! This one is meant to resupply medical with chemicals and kits! Activate it for your surplus delivery!"
/obj/item/surplus_voucher/med/attack_self(mob/user as mob)
	spawn_item(get_turf(src))

/obj/item/surplus_voucher/med/proc/spawn_item(var/turf/T)
	var/path = pick(prob(6);/obj/item/storage/firstaid/regular, // CHOMPEdit - Removal of obj/item/weapon
					prob(6);/obj/item/storage/firstaid/fire, // CHOMPEdit - Removal of obj/item/weapon
					prob(6);/obj/item/storage/firstaid/toxin, // CHOMPEdit - Removal of obj/item/weapon
					prob(6);/obj/item/storage/firstaid/o2, // CHOMPEdit - Removal of obj/item/weapon
					prob(6);/obj/item/storage/firstaid/adv, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/pill_bottle/antitox, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/pill_bottle/bicaridine, // CHOMPEdit - Removal of obj/item/weapon
					prob(2);/obj/item/storage/pill_bottle/dexalin_plus, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/pill_bottle/dylovene, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/pill_bottle/inaprovaline, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/pill_bottle/kelotane, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/pill_bottle/dermaline, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/pill_bottle/spaceacillin, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/pill_bottle/tramadol, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/pill_bottle/carbon, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/pill_bottle/iron, // CHOMPEdit - Removal of obj/item/weapon
					prob(4);/obj/item/storage/pill_bottle/assorted, // CHOMPEdit - Removal of obj/item/weapon
					prob(4);/obj/item/backup_implanter, // CHOMPEdit - Removal of obj/item/weapon
					prob(2);/obj/item/toy/plushie/borgplushie/medihound)
	playsound(T, 'sound/effects/phasein.ogg', 25, 1)
	new path(T)
	del(src)

/obj/item/surplus_voucher/sci
	name = "Science Surplus Voucher"
	desc = "A surplus voucher! This one is meant to supply science with a variety of miscellaneous items! Activate it for your surplus delivery!"
/obj/item/surplus_voucher/sci/attack_self(mob/user as mob)
	spawn_item(get_turf(src))

/obj/item/surplus_voucher/sci/proc/spawn_item(var/turf/T)
	var/path = pick(prob(1);/obj/item/kit/paint/ripley, // CHOMPEdit - Removal of obj/item/device
					prob(1);/obj/item/kit/paint/ripley/death, // CHOMPEdit - Removal of obj/item/device
					prob(1);/obj/item/kit/paint/ripley/flames_red, // CHOMPEdit - Removal of obj/item/device
					prob(1);/obj/item/kit/paint/ripley/flames_blue, // CHOMPEdit - Removal of obj/item/device
					prob(1);/obj/item/kit/paint/durand, // CHOMPEdit - Removal of obj/item/device
					prob(1);/obj/item/kit/paint/gygax/darkgygax, // CHOMPEdit - Removal of obj/item/device
					prob(3);/obj/item/reagent_containers/food/snacks/monkeycube, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/snacks/monkeycube/sobakacube, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/snacks/monkeycube/sarucube, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/snacks/monkeycube/sparracube, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/snacks/monkeycube/wolpincube, // CHOMPEdit - Removal of obj/item/weapon
					prob(2);/obj/item/storage/part_replacer, // CHOMPEdit - Removal of obj/item/weapon
					prob(2);/obj/item/integrated_circuit_printer, // CHOMPEdit - Removal of obj/item/device
					prob(1);/obj/item/disk/integrated_circuit/upgrade/advanced, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/stack/nanopaste,
					prob(3);/obj/item/melee/baton/slime, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/gun/energy/taser/xeno, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/storage/box/monkeycubes, // CHOMPEdit - Removal of obj/item/weapon
					prob(1);/obj/item/toy/figure/borg)
	playsound(T, 'sound/effects/phasein.ogg', 25, 1)
	new path(T)
	del(src)

/obj/item/surplus_voucher/sec
	name = "Security Surplus Voucher"
	desc = "A surplus voucher! This one is meant to resupply security with gear... and donuts! Activate it for your surplus delivery!"
/obj/item/surplus_voucher/sec/attack_self(mob/user as mob)
	spawn_item(get_turf(src))

/obj/item/surplus_voucher/sec/proc/spawn_item(var/turf/T)
	var/path = pick(prob(2);/obj/item/storage/box/flashbangs, // CHOMPEdit - Removal of obj/item/weapon
					prob(4);/obj/item/storage/box/flare, // CHOMPEdit - Removal of obj/item/weapon
					prob(5);/obj/item/storage/box/donut, // CHOMPEdit - Removal of obj/item/weapon
					prob(4);/obj/item/storage/box/handcuffs, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/spray/pepper, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/melee/baton/loaded, // CHOMPEdit - Removal of obj/item/weapon
					prob(2);/obj/item/ammo_magazine/ammo_box/b12g/beanbag,
					prob(2);/obj/item/ammo_magazine/ammo_box/b12g/stunshell,
					prob(2);/obj/item/ammo_magazine/m45/rubber,
					prob(2);/obj/item/ammo_magazine/m9mmt/rubber,
                    prob(2);/obj/item/cell/device/weapon, // CHOMPEdit - Removal of obj/item/weapon
					prob(1);/obj/item/toy/plushie/borgplushie)
	playsound(T, 'sound/effects/phasein.ogg', 25, 1)
	new path(T)
	del(src)

/obj/item/surplus_voucher/ser
	name = "Service Surplus Voucher"
	desc = "A surplus voucher! This one is meant to generally resupply service employees! Activate it for your surplus delivery!"
/obj/item/surplus_voucher/ser/attack_self(mob/user as mob)
	spawn_item(get_turf(src))

/obj/item/surplus_voucher/ser/proc/spawn_item(var/turf/T)
	var/path = pick(prob(4);/obj/item/reagent_containers/food/drinks/milk, // CHOMPEdit - Removal of obj/item/weapon
					prob(4);/obj/item/reagent_containers/food/condiment/carton/flour, // CHOMPEdit - Removal of obj/item/weapon
					prob(4);/obj/item/reagent_containers/food/drinks/soymilk, // CHOMPEdit - Removal of obj/item/weapon
					prob(4);/obj/item/storage/fancy/egg_box, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/food/snacks/meat, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/spray/cleaner, // CHOMPEdit - Removal of obj/item/weapon
					prob(2);/obj/item/grenade/chem_grenade/cleaner, // CHOMPEdit - Removal of obj/item/weapon
					prob(1);/obj/item/storage/box/monkeycubes, // CHOMPEdit - Removal of obj/item/weapon
					prob(3);/obj/item/reagent_containers/spray/plantbgone, // CHOMPEdit - Removal of obj/item/weapon
					prob(2);/obj/item/seeds/sunflowerseed,
					prob(2);/obj/item/seeds/cornseed,
					prob(2);/obj/item/seeds/berryseed,
					prob(2);/obj/item/seeds/wheatseed,
					prob(2);/obj/item/seeds/orangeseed,
					prob(1);/obj/item/toy/figure/bartender)
	playsound(T, 'sound/effects/phasein.ogg', 25, 1)
	new path(T)
	del(src)
