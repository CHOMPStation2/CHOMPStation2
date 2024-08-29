// ToDo: Alphabetize by ckey.
// Also these things might be mildly obsolete considering the update to inventory.

// BEGIN - DO NOT EDIT PROTOTYPE
/obj/item/storage/box/fluff // CHOMPEdit - Removal of obj/item/weapon
	name = "Undefined Fluff Box"
	desc = "This should have a description. Tell an admin."
	storage_slots = 7
	var/list/has_items = list()

/obj/item/storage/box/fluff/New() // CHOMPEdit - Removal of obj/item/weapon
	storage_slots = has_items.len
	allowed = list()
	for(var/P in has_items)
		allowed += P
		new P(src)
	..()
	return
// END - DO NOT EDIT PROTOTYPE


/* TEMPLATE
// ckey:Character Name
/obj/item/storage/box/fluff/charactername // CHOMPEdit - Removal of obj/item/weapon
	name = ""
	desc = ""
	has_items = list(
		/obj/item/clothing/head/thing1,
		/obj/item/clothing/shoes/thing2,
		/obj/item/clothing/suit/thing3,
		/obj/item/clothing/under/thing4)
*/

// BeyondMyLife:Cassandra Selones Spawn Kit
/obj/item/storage/box/fluff/cassandra // CHOMPEdit - Removal of obj/item/weapon
	name = "Cassandra Selone's Spawn Kit"
	desc = "A spawn Kit, holding Cassandra Selone's Item's"
	has_items = list(
		/obj/item/clothing/gloves/fluff/kilano/purple,
		/obj/item/clothing/under/fluff/kilanosuit/purple,
		/obj/item/clothing/shoes/boots/fluff/kilano/purple)

//BeyondMyLife: Ne'tra Ky'ram //Made a box because they have so many items that it'd spam the debug log.
/obj/item/storage/box/fluff/kilano // CHOMPEdit - Removal of obj/item/weapon
	name = "Ne'tra Ky'ram's Kit"
	desc = "A kit containing Ne'tra Ky'ram's clothing."
	has_items = list(
		/obj/item/clothing/suit/storage/hooded/wintercoat/kilanocoat,
		/obj/item/clothing/under/fluff/kilanosuit,
		/obj/item/storage/backpack/messenger/sec/fluff/kilano, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/belt/security/fluff/kilano, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/gloves/fluff/kilano/netra,
		/obj/item/clothing/shoes/boots/fluff/kilano,
		/obj/item/clothing/accessory/storage/black_vest/fluff/kilano
		)

// bwoincognito:Tasald Corlethian
/obj/item/storage/box/fluff/tasald // CHOMPEdit - Removal of obj/item/weapon
	name = "Tasald's Kit"
	desc = "A kit containing Tasald's equipment."
	has_items = list(
		/obj/item/clothing/suit/storage/det_suit/fluff/tasald,
		/obj/item/clothing/under/det/fluff/tasald)

//bwoincognito:Octavious Ward
/obj/item/storage/box/fluff/octavious // CHOMPEdit - Removal of obj/item/weapon
	name = "Octavious's Kit"
	desc = "A kit containing Octavious's work clothes."
	has_items = list(
		/obj/item/clothing/suit/storage/trench/fluff/octaviouscoat,
		/obj/item/clothing/under/det/fluff/octavious,
		/obj/item/clothing/mask/gas/plaguedoctor/fluff/octaviousmask,
		/obj/item/clothing/head/fedora/fluff/bowler,
		/obj/item/clothing/shoes/black/cuffs/octavious,
		/obj/item/cane/fluff/tasald, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/glasses/hud/health/octaviousmonicle
		)

//drakefrostpaw:Drake Frostpaw
/obj/item/storage/box/fluff/drake // CHOMPEdit - Removal of obj/item/weapon
	name = "United Federation Uniform Kit"
	desc = "A box containing all the parts of a United Federation Uniform"
	has_items = list(
		/obj/item/clothing/under/rank/internalaffairs/fluff/joan,
		/obj/item/clothing/suit/storage/fluff/modernfedcoat/modernfedsec,
		/obj/item/clothing/head/caphat/formal/fedcover/fedcoversec,
		/obj/item/clothing/gloves/white,
		)

// Draycu: Schae Yonra
/obj/item/storage/box/fluff/yonra // CHOMPEdit - Removal of obj/item/weapon
	name = "Yonra's Starting Kit"
	desc = "A small box containing Yonra's personal effects"
	has_items = list(
		/obj/item/melee/fluff/holochain/mass, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/accessory/medal/silver/unity)

//ivymoomoo:Ivy Baladeva
/obj/item/storage/backpack/messenger/sec/fluff/ivymoomoo // CHOMPEdit - Removal of obj/item/weapon
	name = "Ivy's Courier"
	desc = "A bag resembling something used by college students. Contains items for ''MooMoo''."

/obj/item/storage/backpack/messenger/sec/fluff/ivymoomoo/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	new /obj/item/clothing/head/beretg(src)
	new /obj/item/fluff/id_kit_ivy(src) // CHOMPEdit - Removal of obj/item/device
	new /obj/item/storage/fancy/cigarettes/dromedaryco(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/storage/box/matches(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/reagent_containers/food/snacks/sliceable/plaincake(src) // CHOMPEdit - Removal of obj/item/weapon

// jemli:Cirra Mayhem
/obj/item/storage/box/fluff/cirra // CHOMPEdit - Removal of obj/item/weapon
	name = "Instant Pirate Kit"
	desc = "Just add Akula!"
	has_items = list(
		/obj/item/clothing/head/pirate,
		/obj/item/clothing/glasses/eyepatch,
		/obj/item/clothing/suit/pirate,
		/obj/item/clothing/under/pirate)

// joey4298:Emoticon
/obj/item/storage/box/fluff/emoticon // CHOMPEdit - Removal of obj/item/weapon
	name = "Emoticon's Mime Kit"
	desc = "Specially packaged for the hungry catgirl mime with a taste for clown."
	has_items = list(
		/obj/item/fluff/id_kit_mime, // CHOMPEdit - Removal of obj/item/device
		/obj/item/clothing/gloves/white,
		/obj/item/clothing/head/beret,
		/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/shoes/black,
		/*/obj/item/toy/crayon/mime*/) //Need to track down the code for crayons before adding this back in

//joanrisu:Joan Risu
/obj/item/storage/backpack/dufflebag/sec/fluff/joanrisu // CHOMPEdit - Removal of obj/item/weapon
	name = "Joan's Workbag"
	desc = "A bag Joan uses to carry her work equipment. It has the 82nd Battle Group Insignia on it."
	icon_state = "joanbag"
	icon = 'icons/vore/custom_items_vr.dmi'
	item_state = "duffle_med"
	slowdown = 0
	can_tilt = 0

/obj/item/storage/backpack/dufflebag/sec/fluff/joanrisu/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	new /obj/item/clothing/accessory/holster/hip(src)
	new /obj/item/clothing/suit/storage/fluff/modernfedcoat(src)
	new /obj/item/clothing/head/caphat/formal/fedcover(src)
	new /obj/item/clothing/suit/armor/det_suit(src)
	new /obj/item/flame/lighter/zippo/fluff/joan(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/clothing/under/rank/internalaffairs/fluff/joan(src)
	new /obj/item/clothing/head/helmet/space/fluff/joan(src)
	new /obj/item/clothing/suit/space/fluff/joan(src)

//joanrisu:Katarina Eine
/obj/item/storage/backpack/dufflebag/sec/fluff/katarina // CHOMPEdit - Removal of obj/item/weapon
	name = "Katarina's Workbag"
	desc = "A duffle bag Katarina uses to carry her tools."
	slowdown = 0

/obj/item/storage/backpack/dufflebag/sec/fluff/katarina/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	new /obj/item/clothing/accessory/holster/hip(src)
	new /obj/item/clothing/suit/storage/fluff/fedcoat(src)
	new /obj/item/clothing/suit/armor/det_suit(src)
	new /obj/item/clothing/accessory/storage/black_vest(src)
	new /obj/item/material/knife/tacknife/combatknife/fluff/katarina(src) // CHOMPEdit - Removal of obj/item/weapon
	new /obj/item/clothing/under/rank/internalaffairs/fluff/joan(src)

//Razerwing:Archer Maximus
/obj/item/storage/box/fluff/archermaximus // CHOMPEdit - Removal of obj/item/weapon
	desc = "Personal Effects"
	has_items = list()

//Xsdew:Penelope Allen
/obj/item/storage/box/fluff/penelope // CHOMPEdit - Removal of obj/item/weapon
	name = "Penelope's capsule"
	desc = "A little capsule where a designer's swimsuit is stored."
	icon = 'icons/vore/custom_items_vr.dmi'
	icon_state = "capsule"
	storage_slots = 1
	foldable = null
	w_class = ITEMSIZE_SMALL
	max_w_class = ITEMSIZE_NORMAL
	can_hold = list(/obj/item/clothing/under/swimsuit/)
	has_items = list(/obj/item/clothing/under/swimsuit/fluff/penelope)

// JackNoir413: Mor Xaina
/obj/item/storage/box/fluff/morxaina // CHOMPEdit - Removal of obj/item/weapon
	name = "Fashionable clothes set"
	desc = "Set of custom-made, expensive attire elements."
	has_items = list(
		/obj/item/clothing/shoes/fluff/morthighs,
		/obj/item/clothing/gloves/fluff/morsleeves,
		/obj/item/clothing/under/fluff/morunder)

// Mewchild: Phi Vietsi
/obj/item/storage/box/fluff/phi // CHOMPEdit - Removal of obj/item/weapon
	name = "Phi's Personal Items"
	has_items = list(
		/obj/item/clothing/accessory/medal/bronze_heart,
		/obj/item/clothing/gloves/ring/seal/signet/fluff/phi)

// Tabiranth: Ascian
/obj/item/grenade/spawnergrenade/spirit // CHOMPEdit - Removal of obj/item/weapon
	name = "spirit's pet carrier"
	desc = "Contains kitten."
	spawner_type = /mob/living/simple_mob/animal/passive/cat/tabiranth
	deliveryamt = 1

// Jwguy: Koyo Akimomi
/obj/item/storage/box/fluff/koyoakimomi // CHOMPEdit - Removal of obj/item/weapon
	name = "Koyo's Cosplay Box"
	desc = "One of many traditional wolfgirl clothing sets that Koyo owns. Awoo!"
	has_items = list(
		/obj/item/clothing/head/fluff/wolfgirl,
		/obj/item/clothing/shoes/fluff/wolfgirl,
		/obj/item/clothing/under/fluff/wolfgirl,
		/obj/item/melee/fluffstuff/wolfgirlsword, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/shield/fluff/wolfgirlshield) // CHOMPEdit - Removal of obj/item/weapon

// Ryumi: Nikki Yumeno
/obj/item/storage/box/fluff // CHOMPEdit - Removal of obj/item/weapon
	name = "Nikki's Outfit Box"
	desc = "Warning: Contains dangerous amounts of dork."
	has_items = list(
		/obj/item/rig/nikki, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/clothing/head/fluff/nikki,
		/obj/item/clothing/under/skirt/outfit/fluff/nikki,
		/obj/item/clothing/shoes/fluff/nikki)

// DefiintelyNotARock:Aku Zoles
/obj/item/storage/secure/briefcase/dealer // CHOMPEdit - Removal of obj/item/weapon
	name = "Aku's Dealer briefcase"
	desc = "A slick black briefcase with a digital lock."
	starts_with = list(
		/obj/item/spacecasinocash/c1000 = 3, // CHOMPEdit - Removal of obj/item/weapon
		/obj/item/storage/dicecup/loaded = 3) // CHOMPEdit - Removal of obj/item/weapon

/*
Swimsuits, for general use, to avoid arriving to work with your swimsuit.
*/
/obj/item/storage/box/fluff/swimsuit // CHOMPEdit - Removal of obj/item/weapon
	name = "Black Swimsuit capsule"
	desc = "A little capsule where a swimsuit is usually stored."
	storage_slots = 1
	icon = 'icons/vore/custom_items_vr.dmi'
	icon_state = "capsule"
	foldable = null
	w_class = ITEMSIZE_SMALL
	max_w_class = ITEMSIZE_NORMAL
	can_hold = list(/obj/item/clothing/under/swimsuit/)
	has_items = list(/obj/item/clothing/under/swimsuit/black)

/obj/item/storage/box/fluff/swimsuit/blue // CHOMPEdit - Removal of obj/item/weapon
	name = "Blue Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/blue)

/obj/item/storage/box/fluff/swimsuit/purple // CHOMPEdit - Removal of obj/item/weapon
	name = "Purple Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/purple)

/obj/item/storage/box/fluff/swimsuit/green // CHOMPEdit - Removal of obj/item/weapon
	name = "Green Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/green)

/obj/item/storage/box/fluff/swimsuit/red // CHOMPEdit - Removal of obj/item/weapon
	name = "Red Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/red)

/obj/item/storage/box/fluff/swimsuit/white // CHOMPEdit - Removal of obj/item/weapon
	name = "White Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/white)

/obj/item/storage/box/fluff/swimsuit/blue // CHOMPEdit - Removal of obj/item/weapon
	name = "Striped Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/striped)

/obj/item/storage/box/fluff/swimsuit/earth // CHOMPEdit - Removal of obj/item/weapon
	name = "Earthen Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/earth)

/obj/item/storage/box/fluff/swimsuit/engineering // CHOMPEdit - Removal of obj/item/weapon
	name = "Engineering Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/fluff/engineering)

/obj/item/storage/box/fluff/swimsuit/science // CHOMPEdit - Removal of obj/item/weapon
	name = "Science Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/fluff/science)

/obj/item/storage/box/fluff/swimsuit/security // CHOMPEdit - Removal of obj/item/weapon
	name = "Security Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/fluff/security)

/obj/item/storage/box/fluff/swimsuit/medical // CHOMPEdit - Removal of obj/item/weapon
	name = "Medical Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/fluff/medical)

/obj/item/storage/box/fluff/swimsuit/cowbikini // CHOMPEdit - Removal of obj/item/weapon
	name = "Cow Bikini Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/cowbikini)

/obj/item/storage/box/fluff/swimsuit/stripperpink // CHOMPEdit - Removal of obj/item/weapon
	name = "Skimpy Pink Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/stripper/stripper_pink)

/obj/item/storage/box/fluff/swimsuit/strippergreen // CHOMPEdit - Removal of obj/item/weapon
	name = "Skimpy Green Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/stripper/stripper_green)

/obj/item/storage/box/fluff/swimsuit/mankini // CHOMPEdit - Removal of obj/item/weapon
	name = "Pink Mankini capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/stripper/mankini)

/obj/item/storage/box/fluff/swimsuit/highclass // CHOMPEdit - Removal of obj/item/weapon
	name = "High Class Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/highclass)

/obj/item/storage/box/fluff/swimsuit/risque // CHOMPEdit - Removal of obj/item/weapon
	name = "Risque Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/risque)

/obj/item/storage/box/fluff/swimsuit/streamlined // CHOMPEdit - Removal of obj/item/weapon
	name = "Streamlined Swimsuit capsule"
	has_items = list(/obj/item/clothing/under/swimsuit/streamlined)

//Monkey boxes for the new primals we have
/obj/item/storage/box/monkeycubes/sobakacubes // CHOMPEdit - Removal of obj/item/weapon
	name = "sobaka cube box"
	desc = "Drymate brand sobaka cubes. Just add water!"
	starts_with = list(/obj/item/reagent_containers/food/snacks/monkeycube/wrapped/sobakacube = 4) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/monkeycubes/sarucubes // CHOMPEdit - Removal of obj/item/weapon
	name = "saru cube box"
	desc = "Drymate brand saru cubes. Just add water!"
	starts_with = list(/obj/item/reagent_containers/food/snacks/monkeycube/wrapped/sarucube = 4) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/monkeycubes/sparracubes // CHOMPEdit - Removal of obj/item/weapon
	name = "sparra cube box"
	desc = "Drymate brand sparra cubes. Just add water!"
	starts_with = list(/obj/item/reagent_containers/food/snacks/monkeycube/wrapped/sparracube = 4) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/storage/box/monkeycubes/wolpincubes // CHOMPEdit - Removal of obj/item/weapon
	name = "wolpin cube box"
	desc = "Drymate brand wolpin cubes. Just add water!"
	starts_with = list(/obj/item/reagent_containers/food/snacks/monkeycube/wrapped/wolpincube = 4) // CHOMPEdit - Removal of obj/item/weapon
