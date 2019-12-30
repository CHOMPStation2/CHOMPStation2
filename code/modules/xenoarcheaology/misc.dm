/obj/structure/noticeboard/anomaly
	notices = 5
	icon_state = "nboard05"

/obj/structure/noticeboard/anomaly/New()
	var/obj/item/weapon/paper/P = new()
	P.name = "Memo RE: proper analysis procedure"
	P.info = "<br>We keep test dummies in pens here for a reason, so standard procedure should be to activate newfound alien artifacts and place the two in close proximity. Promising items I might even approve monkey testing on."
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Memo RE: materials gathering"
	P.info = "Corasang,<br>the hands-on approach to gathering our samples may very well be slow at times, but it's safer than allowing the blundering miners to roll willy-nilly over our dig sites in their mechs, destroying everything in the process. And don't forget the escavation tools on your way out there!<br>- R.W"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Memo RE: ethical quandaries"
	P.info = "Darion-<br><br>I don't care what his rank is, our business is that of science and knowledge - questions of moral application do not come into this. Sure, so there are those who would employ the energy-wave particles my modified device has managed to abscond for their own personal gain, but I can hardly see the practical benefits of some of these artifacts our benefactors left behind. Ward--"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "READ ME! Before you people destroy any more samples"
	P.info = "how many times do i have to tell you people, these xeno-arch samples are del-i-cate, and should be handled so! careful application of a focussed, concentrated heat or some corrosive liquids should clear away the extraneous carbon matter, while application of an energy beam will most decidedly destroy it entirely - like someone did to the chemical dispenser! W, <b>the one who signs your paychecks</b>"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Reminder regarding the anomalous material suits"
	P.info = "Do you people think the anomaly suits are cheap to come by? I'm about a hair trigger away from instituting a log book for the damn things. Only wear them if you're going out for a dig, and for god's sake don't go tramping around in them unless you're field testing something, R"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

/obj/structure/noticeboard/medical
	notices = 1
	icon_state = "nboard01"

/obj/structure/noticeboard/medical/New()
	var/obj/item/weapon/paper/P = new()
	P.name = "Staff Notice: Patient rooms"
	P.info = "<br>No matter how many times I've said this, it doesn't seem to stick, so I'm leaving this reminder: Screwing patients in the patient rooms is a serious breach of professionality and your code of ethics. Take it to the dorms."
	P.stamped = list(/obj/item/weapon/stamp/cmo)
	P.overlays = list("paper_stamped_cmo")
	src.contents += P

/obj/structure/noticeboard/toxins
	notices = 1
	icon_state = "nboard01"

/obj/structure/noticeboard/toxins/New()
	var/obj/item/weapon/paper/P = new()
	P.name = "Staff Notice: Toxins Mixing"
	P.info = "<br>Toxins Mixing is currently shut down for the time being, due to damage requiring parts from off station to fix. Please do not use at this time, or risk setting the entire outpost on fire."
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

/obj/structure/noticeboard/nanite
	notices = 1
	icon_state = "nboard01"

/obj/structure/noticeboard/nanite/New()
	var/obj/item/weapon/paper/P = new()
	P.name = "Staff Notice: Nanite Laboratory"
	P.info = "<br>The Nanite Laboratory is nearly complete. We're simply awaiting specialized machinery and equipment from central. The lab is currently shut down. Please do not use at this time."
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

/obj/structure/noticeboard/library
	notices = 2
	icon_state = "nboard02"

/obj/structure/noticeboard/library/New()
	var/obj/item/weapon/paper/P = new()
	P.name = "Library Warning: coffee stains"
	P.info = "<br>I seem to tell you guys this daily, but please, stop bringing coffee to carpeted areas. It's hard enough to get the stains off wood,let alone carpet."
	src.contents += P

	P = new()
	P.name = "Library Warning: loud noises"
	P.info = "Ssshh!<br>People are trying to read in the library, stop bringing the jukebox over there!"
	src.contents += P

/obj/structure/noticeboard/exploration
	notices = 3
	icon_state = "nboard03"

/obj/structure/noticeboard/exploration/New()
	var/obj/item/weapon/paper/P = new()
	P.name = "Memo: Prototype ship"
	P.info = "<br> With the lost of our last Research installation and the damage sustained to the old exploration shuttle,We've decided to finally approve the construction of the Prototype Star-Runner class Exploration Vessel. Keep in mind it's a prototype, so try not to scratch it's paint. We don't have a second."
	P.stamped = list(/obj/item/weapon/stamp/centcomm)
	P.overlays = list("paper_stamped_cent")
	src.contents += P

	P = new()
	P.name = "Memo RE: Expedition Requirements"
	P.info = "Jones,<br>For the last time, Expeditions regulations require atleast three crew members, including the Pathfinder and/or Research Director. The next time you activate your bluespace drive with less then that, and you're fired from the department.I won't have this conversation again. <br>- R.F"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Memo RE: Pilot duties"
	P.info = "Pilots, As you're fully aware, we're on the edge of civilized space out here. <br> Leaving the shuttle area is dangerious. This is why the Prototype is equipped with a proper camera system to keep an eye on the explorers. If you get yourselves killed, and an explorer has to crash land the ship back here, the company is NOT going to be happy.<br>- R.F"
	P.stamped = list(/obj/item/weapon/stamp/rd)
	P.overlays = list("paper_stamped_rd")
	src.contents += P

/obj/structure/bookcase/manuals/xenoarchaeology
	name = "Xenoarchaeology Manuals bookcase"

/obj/structure/bookcase/manuals/xenoarchaeology/Initialize()
	. = ..()
	new /obj/item/weapon/book/manual/excavation(src)
	new /obj/item/weapon/book/manual/mass_spectrometry(src)
	new /obj/item/weapon/book/manual/materials_chemistry_analysis(src)
	new /obj/item/weapon/book/manual/anomaly_testing(src)
	new /obj/item/weapon/book/manual/anomaly_spectroscopy(src)
	new /obj/item/weapon/book/manual/stasis(src)
	update_icon()

/obj/structure/closet/secure_closet/xenoarchaeologist
	name = "Xenoarchaeologist Locker"
	icon_state = "secureres1"
	icon_closed = "secureres"
	icon_locked = "secureres1"
	icon_opened = "secureresopen"
	icon_broken = "secureresbroken"
	icon_off = "secureresoff"
	req_access = list(access_tox_storage)

	starts_with = list(
		/obj/item/clothing/under/rank/scientist,
		/obj/item/clothing/suit/storage/toggle/labcoat,
		/obj/item/clothing/shoes/white,
		/obj/item/weapon/melee/umbrella, // vorestation addition,
		/obj/item/clothing/glasses/science,
		/obj/item/device/radio/headset/headset_sci,
		/obj/item/weapon/storage/belt/archaeology,
		/obj/item/weapon/storage/excavation)

/obj/structure/closet/excavation
	name = "Excavation tools"
	icon_state = "toolcloset"
	icon_closed = "toolcloset"
	icon_opened = "toolclosetopen"

	starts_with = list(
		/obj/item/weapon/storage/belt/archaeology,
		/obj/item/weapon/storage/excavation,
		/obj/item/device/flashlight/lantern,
		/obj/item/device/ano_scanner,
		/obj/item/device/depth_scanner,
		/obj/item/device/core_sampler,
		/obj/item/device/gps,
		/obj/item/device/beacon_locator,
		/obj/item/device/radio/beacon,
		/obj/item/clothing/glasses/meson,
		/obj/item/weapon/pickaxe,
		/obj/item/device/measuring_tape,
		/obj/item/weapon/pickaxe/hand,
		/obj/item/weapon/storage/bag/fossils,
		/obj/item/weapon/hand_labeler)

/obj/machinery/alarm/isolation
	req_one_access = list(access_research, access_atmospherics, access_engine_equip)

/obj/machinery/alarm/monitor/isolation
	req_one_access = list(access_research, access_atmospherics, access_engine_equip)

/obj/structure/noticeboard/airlock
	notices = 1
	icon_state = "nboard01"

/obj/structure/noticeboard/airlock/New()
	var/obj/item/weapon/paper/P = new()
	P.name = "Staff Notice: Airlock Proceedure"
	P.info = "<br>Due to the large amount of new staff unfamiliar with our proceedures we've left you some instructions. <br> To exit through an airlock, simply hit the button to open the interior, and then cycle to exterior once inside. To re-enter the station, enter the airlock, Close the exterior hatch, and look for the customized thermal regulators installed on the wall. <br>This should heat up the air in the airlock, allowing you to open the interior door with no issues."
	P.stamped = list(/obj/item/weapon/stamp/captain)
	P.overlays = list("paper_stamp-cap")
	src.contents += P