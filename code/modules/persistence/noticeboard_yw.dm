//ChompEDIT Start - Rework this whole thing, it was bad.
/obj/structure/noticeboard/anomaly
	name = "xenoarchaeology notice board"

/obj/structure/noticeboard/medical
	name = "medical notice board"
	icon_state = "nboard02"

/obj/structure/noticeboard/medical/Initialize()
	var/obj/item/paper/P = new()
	P.name = "Staff Notice: Patient rooms"
	P.info = "<br>No matter how many times I've said this, it doesn't seem to stick, so I'm leaving this reminder: Screwing patients in the patient rooms is a serious breach of professionality and your code of ethics. Take it to the dorms."
	P.stamped = list(/obj/item/stamp/cmo)
	P.add_overlay("paper_stamped_cmo")
	src.contents += P

	P = new()
	P.name = "Staff Notice: Breakroom \& Storage"
	P.info = "<br>Enjoy the view from the new breakroom. You've also got a storage room full of leftover supplies from the shift before yours."
	P.stamped = list(/obj/item/stamp/cmo)
	P.add_overlay("paper_stamped_cmo")
	src.contents += P
	. = ..()

/obj/structure/noticeboard/toxins
	name = "toxins lab notice board"
	icon_state = "nboard01"

/obj/structure/noticeboard/toxins/Initialize()
	var/obj/item/paper/P = new()
	P.name = "Staff Notice: Toxins Mixing"
	P.info = "<br>Toxins Mixing is currently shut down for the time being, due to damage requiring parts from off station to fix. Please do not use at this time, or risk setting the entire outpost on fire."
	P.stamped = list(/obj/item/stamp/rd)
	P.add_overlay("paper_stamped_rd")
	src.contents += P
	. = ..()

/obj/structure/noticeboard/nanite
	name = "nanite lab notice board"
	icon_state = "nboard01"

/obj/structure/noticeboard/nanite/Initialize()
	var/obj/item/paper/P = new()
	P.name = "Staff Notice: Nanite Laboratory"
	P.info = "<br>The Nanite Laboratory is nearly complete. We're simply awaiting specialized machinery and equipment from central. The lab is currently shut down. Please do not use at this time."
	P.stamped = list(/obj/item/stamp/rd)
	P.add_overlay("paper_stamped_rd")
	src.contents += P
	. = ..()

/obj/structure/noticeboard/blueshield
	name = "blueshield notice board"
	icon_state = "nboard01"

/obj/structure/noticeboard/blueshield/Initialize()
	var/obj/item/paper/P = new()
	P.name = "Staff Notice: Blueshield Special Reserve"
	P.info = "<br>This secure storage unit is intended to be used for special equipment specifically for the use of Blueshield Agents in the event of a Code Red threat to Heads of Staff. Heads of Staff found 'commandeering' this equipment can expect to be severely reprimanded.<br><br>(Underneath, there is a messy handwritten addition.)<br><i>Sorry, we haven't had time or spare funds to issue anything yet. You know how frontier budgets are! Sit tight, champ. -Z.V.</i>"
	P.stamped = list(/obj/item/stamp/centcomm)
	P.add_overlay("paper_stamped_cent")
	src.contents += P
	. = ..()

/obj/structure/noticeboard/library
	icon_state = "nboard02"

/obj/structure/noticeboard/library/Initialize()
	var/obj/item/paper/P = new()
	P.name = "Library Warning: coffee stains"
	P.info = "<br>I seem to tell you guys this daily, but please, stop bringing coffee to carpeted areas. It's hard enough to get the stains off wood,let alone carpet."
	src.contents += P

	P = new()
	P.name = "Library Warning: loud noises"
	P.info = "Ssshh!<br>People are trying to read in the library, stop bringing the jukebox over there!"
	src.contents += P
	. = ..()

/obj/structure/noticeboard/exploration
	icon_state = "nboard03"

/obj/structure/noticeboard/exploration/Initialize()
	var/obj/item/paper/P = new()
	P.name = "Memo: Prototype ship"
	P.info = "<br> With the lost of our last Research installation and the damage sustained to the old exploration shuttle,We've decided to finally approve the construction of the Prototype Star-Runner class Exploration Vessel. Keep in mind it's a prototype, so try not to scratch it's paint. We don't have a second."
	P.stamped = list(/obj/item/stamp/centcomm)
	P.add_overlay("paper_stamped_cent")
	src.contents += P

	P = new()
	P.name = "Memo RE: Expedition Requirements"
	P.info = "Jones,<br>For the last time, Expeditions regulations require atleast three crew members, including the Pathfinder and/or Research Director. The next time you activate your bluespace drive with less then that, and you're fired from the department.I won't have this conversation again. <br>- R.F"
	P.stamped = list(/obj/item/stamp/rd)
	P.add_overlay("paper_stamped_rd")
	src.contents += P

	P = new()
	P.name = "Memo RE: Pilot duties"
	P.info = "Pilots, As you're fully aware, we're on the edge of civilized space out here. <br> Leaving the shuttle area is dangerious. This is why the Prototype is equipped with a proper camera system to keep an eye on the explorers. If you get yourselves killed, and an explorer has to crash land the ship back here, the company is NOT going to be happy.<br>- R.F"
	P.stamped = list(/obj/item/stamp/rd)
	P.add_overlay("paper_stamped_rd")
	src.contents += P
	. = ..()

/obj/structure/noticeboard/airlock
	icon_state = "nboard01"

/obj/structure/noticeboard/airlock/Initialize()
	var/obj/item/paper/P = new()
	P.name = "Staff Notice: Airlock Proceedure"
	P.info = "<br>Due to the large amount of new staff unfamiliar with our proceedures we've left you some instructions. <br> To exit through an airlock, simply hit the button to open the interior, and then cycle to exterior once inside. To re-enter the station, enter the airlock, Close the exterior hatch, and look for the customized thermal regulators installed on the wall. <br>This should heat up the air in the airlock, allowing you to open the interior door with no issues."
	P.stamped = list(/obj/item/stamp/captain)
	P.add_overlay("paper_stamp-cap")
	src.contents += P
	. = ..()

//ChompEDIT End
