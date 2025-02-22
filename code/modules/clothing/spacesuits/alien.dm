//Skrell space gear. Sleek like a wetsuit.
/obj/item/clothing/head/helmet/space/skrell
	name = "Skrellian helmet"
	desc = "Smoothly contoured and polished to a shine. Still looks like a fishbowl."
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 50, bomb = 50, bio = 100, rad = 50)
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	species_restricted = list(SPECIES_SKRELL,SPECIES_HUMAN)

/obj/item/clothing/head/helmet/space/skrell/white
	icon_state = "skrell_helmet_white"

/obj/item/clothing/head/helmet/space/skrell/black
	icon_state = "skrell_helmet_black"

/obj/item/clothing/suit/space/skrell
	name = "Skrellian voidsuit"
	desc = "Seems like a wetsuit with reinforced plating seamlessly attached to it. Very chic."
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 50, bomb = 50, bio = 100, rad = 50)
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/storage/bag/ore,/obj/item/t_scanner,/obj/item/pickaxe, /obj/item/rcd)
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	species_restricted = list(SPECIES_SKRELL,SPECIES_HUMAN)

/obj/item/clothing/suit/space/skrell/white
	icon_state = "skrell_suit_white"

/obj/item/clothing/suit/space/skrell/black
	icon_state = "skrell_suit_black"

// Vox space gear (vaccuum suit, low pressure armour)
// Can't be equipped by any other species due to bone structure and vox cybernetics.
/obj/item/clothing/suit/space/vox
	w_class = ITEMSIZE_NORMAL
	flags = PHORONGUARD
	item_flags = THICKMATERIAL
	allowed = list(/obj/item/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/melee/energy/sword,/obj/item/handcuffs,/obj/item/tank)
	armor = list(melee = 60, bullet = 50, laser = 40,energy = 15, bomb = 30, bio = 100, rad = 50)
	siemens_coefficient = 0.2
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	species_restricted = list(SPECIES_VOX)

/obj/item/clothing/head/helmet/space/vox
	armor = list(melee = 60, bullet = 50, laser = 40, energy = 15, bomb = 30, bio = 100, rad = 50)
	siemens_coefficient = 0.2
	flags = PHORONGUARD
	item_flags = THICKMATERIAL | AIRTIGHT
	flags_inv = 0
	species_restricted = list(SPECIES_VOX)

/obj/item/clothing/head/helmet/space/vox/pressure
	name = "alien helmet"
	icon_state = "vox-pressure"
	item_state = "vox-pressure"
	desc = "Hey, wasn't this a prop in \'The Abyss\'?"

/obj/item/clothing/suit/space/vox/pressure
	name = "alien pressure suit"
	icon_state = "vox-pressure"
	item_state = "vox-pressure"
	desc = "A huge, armoured, pressurized suit, designed for distinctly nonhuman proportions."

/obj/item/clothing/head/helmet/space/vox/carapace
	name = "alien visor"
	icon_state = "vox-carapace"
	item_state = "vox-carapace"
	desc = "A glowing visor, perhaps stolen from a depressed Cylon."
	flash_protection = FLASH_PROTECTION_MAJOR

/obj/item/clothing/suit/space/vox/carapace
	name = "alien carapace armour"
	icon_state = "vox-carapace"
	item_state = "vox-carapace"
	desc = "An armoured, segmented carapace with glowing purple lights. It looks pretty run-down."

/obj/item/clothing/head/helmet/space/vox/stealth
	name = "alien stealth helmet"
	icon_state = "vox-stealth"
	item_state = "vox-stealth"
	desc = "A smoothly contoured, matte-black alien helmet."
	flash_protection = FLASH_PROTECTION_MAJOR

/obj/item/clothing/suit/space/vox/stealth
	name = "alien stealth suit"
	icon_state = "vox-stealth"
	item_state = "vox-stealth"
	desc = "A sleek black suit. It seems to have a tail, and is very heavy."

/obj/item/clothing/head/helmet/space/vox/medic
	name = "alien goggled helmet"
	icon_state = "vox-medic"
	item_state = "vox-medic"
	desc = "An alien helmet with enormous goggled lenses."

/obj/item/clothing/suit/space/vox/medic
	name = "alien armour"
	icon_state = "vox-medic"
	item_state = "vox-medic"
	desc = "An almost organic looking nonhuman pressure suit."

/*/obj/item/clothing/under/vox
	has_sensor = 1
	species_restricted = list(SPECIES_VOX)

/obj/item/clothing/under/vox/vox_casual
	name = "alien clothing"
	desc = "This doesn't look very comfortable."
	icon_state = "vox-casual-1"
	_color = "vox-casual-1"
	item_state = "vox-casual-1"

/obj/item/clothing/under/vox/vox_robes
	name = "alien robes"
	desc = "Weird and flowing!"
	icon_state = "vox-casual-2"
	_color = "vox-casual-2"
	item_state = "vox-casual-2"

/obj/item/clothing/gloves/yellow/vox
	desc = "These bizarre gauntlets seem to be fitted for... bird claws?"
	name = "insulated gauntlets"
	icon_state = "gloves-vox"
	item_state = "gloves-vox"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	_color="gloves-vox"
	species_restricted = list(VOX_SHAPED)

/obj/item/clothing/shoes/magboots/vox

	desc = "A pair of heavy, jagged armored foot pieces. They seem suitable for a velociraptor."
	name = "vox boots"
	item_state = "boots-vox"
	icon_state = "boots-vox"
	species_restricted = list(VOX_SHAPED)

	mag_slow = MAGBOOTS_SLOWDOWN_MED

	stomp_attack_power = 30
	stomp_delay = 2 SECONDS
	stomp_boot = "clawed boot"
	stomp_hit = "gouges"

	footprint_type = /obj/effect/decal/cleanable/blood/tracks/footprints/vox //They're like those five-toed shoes except for vox and with only three toes

/obj/item/clothing/shoes/magboots/vox/toggle()
	//set name = "Toggle Floor Grip"
	if(usr.isUnconscious())
		return
	if(src.magpulse)
		src.clothing_flags &= ~NOSLIP
		src.magpulse = 0
		src.slowdown = NO_SLOWDOWN
		to_chat(usr, "You retract the razor-sharp talons of your boots.")
	else
		src.clothing_flags |= NOSLIP
		src.magpulse = 1
		src.slowdown = mag_slow
		to_chat(usr, "You extend the razor-sharp talons of your boots.")
*/

// Vox Trader -- Same stats as civ gear, but looks like raiders. ///////////////////////////////
/obj/item/clothing/suit/space/vox/civ/trader // brownsuit
	name = "alien pressure suit"
	icon_state = "vox-pressure"
	item_state = "vox-pressure"
	desc = "A huge, pressurized suit, designed for distinctly nonhuman proportions. It looks unusually cheap, even for Vox."

/obj/item/clothing/head/helmet/space/vox/civ/trader //brownhelmet
	name = "alien helmet"
	icon_state = "vox-pressure"
	item_state = "vox-pressure"
	desc = "Hey, wasn't this a prop in \'The Abyss\'?"

/obj/item/clothing/suit/space/vox/civ/trader/carapace //carapace
	name = "alien carapace armor"
	icon_state = "vox-carapace"
	item_state = "vox-carapace"
	desc = "An armored, segmented carapace with glowing purple lights. It looks like someone stripped most of the armor off."

/obj/item/clothing/head/helmet/space/vox/civ/trader/carapace //carapace helmet
	name = "alien visor"
	icon_state = "vox-carapace"
	item_state = "vox-carapace"
	desc = "A glowing visor, perhaps stolen from a depressed Cylon."
	flash_protection = FLASH_PROTECTION_MAJOR

/obj/item/clothing/suit/space/vox/civ/trader/medic // aquasuit
	name = "alien armor"
	icon_state = "vox-medic"
	item_state = "vox-medic"
	desc = "An almost organic looking nonhuman pressure suit."

/obj/item/clothing/head/helmet/space/vox/civ/trader/medic //aquahelmet
	name = "alien goggled helmet"
	icon_state = "vox-medic"
	item_state = "vox-medic"
	desc = "An alien helmet with enormous goggled lenses."

/obj/item/clothing/suit/space/vox/civ/trader/stealth // blacksuit
	name = "alien stealth suit"
	icon_state = "vox-stealth"
	item_state = "vox-stealth"
	desc = "A sleek black suit. It seems to have a tail, and is very heavy."

/obj/item/clothing/head/helmet/space/vox/civ/trader/stealth //blackhelmet
	name = "alien stealth helmet"
	icon_state = "vox-stealth"
	item_state = "vox-stealth"
	desc = "A smoothly contoured, matte-black alien helmet.?"

// Vox Casual//////////////////////////////////////////////
// Civvie
/obj/item/clothing/suit/space/vox/civ
	name = "vox assistant pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers."
	icon = 'icons/obj/clothing/suits_yw.dmi'
	icon_state = "vox-civ-assistant"
	allowed = list(/obj/item/tank,/obj/item/pen,/obj/item/flashlight/pen)
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 100, rad = 25)
	pressure_resistance = 5 * ONE_ATMOSPHERE

/obj/item/clothing/head/helmet/space/vox/civ
	name = "vox assistant pressure helmet"
	icon = 'icons/obj/clothing/hats_yw.dmi'
	icon_state = "vox-civ-assistant"
	desc = "A very alien-looking helmet for vox crewmembers."
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 100, rad = 25)
	pressure_resistance = 5 * ONE_ATMOSPHERE
	flash_protection = FLASH_PROTECTION_NONE

/obj/item/clothing/suit/space/vox/civ/bartender
	name = "vox bartender pressure suit"
	icon_state = "vox-civ-bartender"

/obj/item/clothing/head/helmet/space/vox/civ/bartender
	name = "vox bartender pressure helmet"
	icon_state = "vox-civ-bartender"

/obj/item/clothing/suit/space/vox/civ/chef
	name = "vox chef pressure suit"
	icon_state = "vox-civ-chef"

/obj/item/clothing/head/helmet/space/vox/civ/chef
	name = "vox chef pressure helmet"
	icon_state = "vox-civ-chef"

/obj/item/clothing/suit/space/vox/civ/botanist
	name = "vox botanist pressure suit"
	icon_state = "vox-civ-botanist"

/obj/item/clothing/head/helmet/space/vox/civ/botanist
	name = "vox botanist pressure helmet"
	icon_state = "vox-civ-botanist"

/obj/item/clothing/suit/space/vox/civ/janitor
	name = "vox janitor pressure suit"
	icon_state = "vox-civ-janitor"

/obj/item/clothing/head/helmet/space/vox/civ/janitor
	name = "vox janitor pressure helmet"
	icon_state = "vox-civ-janitor"

/obj/item/clothing/suit/space/vox/civ/cargo
	name = "vox cargo pressure suit"
	icon_state = "vox-civ-cargo"

/obj/item/clothing/head/helmet/space/vox/civ/cargo
	name = "vox cargo pressure helmet"
	icon_state = "vox-civ-cargo"

/obj/item/clothing/suit/space/vox/civ/mechanic
	name = "vox mechanic pressure suit"
	icon_state = "vox-civ-mechanic"

/obj/item/clothing/head/helmet/space/vox/civ/mechanic
	name = "vox mechanic pressure helmet"
	icon_state = "vox-civ-mechanic"

/obj/item/clothing/suit/space/vox/civ/librarian
	name = "vox librarian pressure suit"
	icon_state = "vox-civ-librarian"

/obj/item/clothing/head/helmet/space/vox/civ/librarian
	name = "vox librarian pressure helmet"
	icon_state = "vox-civ-librarian"

/obj/item/clothing/suit/space/vox/civ/chaplain
	name = "vox chaplain pressure suit"
	icon_state = "vox-civ-chaplain"

/obj/item/clothing/head/helmet/space/vox/civ/chaplain
	name = "vox chaplain pressure helmet"
	icon_state = "vox-civ-chaplain"

/obj/item/clothing/suit/space/vox/civ/mining
	name = "vox mining pressure suit"
	icon_state = "vox-civ-mining"

/obj/item/clothing/head/helmet/space/vox/civ/mining
	name = "vox mining pressure helmet"
	icon_state = "vox-civ-mining"

//Engineering
/obj/item/clothing/suit/space/vox/civ/engineer
	name = "vox engineer pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. This one comes with more radiation protection."
	icon_state = "vox-civ-engineer"
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 100, rad = 50)
	allowed = list(/obj/item/flashlight, /obj/item/tank, /obj/item/t_scanner, /obj/item/rcd, /obj/item/tool)
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	pressure_resistance = 200 * ONE_ATMOSPHERE

/obj/item/clothing/head/helmet/space/vox/civ/engineer
	name = "vox engineer pressure helmet"
	icon_state = "vox-civ-engineer"
	desc = "A very alien-looking helmet for vox crewmembers. This one comes with more radiation protection."
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 100, rad = 50)
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	pressure_resistance = 200 * ONE_ATMOSPHERE
	flash_protection = FLASH_PROTECTION_MAJOR

/obj/item/clothing/suit/space/vox/civ/engineer/atmos
	name = "vox atmos pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. Has some heat protection."
	icon_state = "vox-civ-atmos"
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 100, rad = 10)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/space/vox/civ/engineer/atmos
	name = "vox atmos pressure helmet"
	icon_state = "vox-civ-atmos"
	desc = "A very alien-looking helmet for vox crewmembers. Has some heat protection."
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 100, rad = 10)
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/space/vox/civ/engineer/ce
	name = "vox chief engineer pressure suit"
	desc = "A more advanced pressure suit made for vox crewmembers. Has some radiation and heat protection."
	icon_state = "vox-civ-ce"
	armor = list(melee = 10, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 50)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/space/vox/civ/engineer/ce
	name = "vox chief engineer pressure helmet"
	icon_state = "vox-civ-ce"
	desc = "A very alien-looking helmet for vox crewmembers. Has some radiation and heat protection."
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

//Science
/obj/item/clothing/suit/space/vox/civ/science
	name = "vox science pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. This one is for SCIENCE!"
	icon_state = "vox-civ-science"
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 10, bio = 100, rad = 25)

/obj/item/clothing/head/helmet/space/vox/civ/science
	name = "vox science pressure helmet"
	icon_state = "vox-civ-science"
	desc = "A very alien-looking helmet for vox crewmembers. This one is for SCIENCE!"
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 10, bio = 100, rad = 25)

/obj/item/clothing/suit/space/vox/civ/science/rd
	name = "vox research director pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. This one is for the head of SCIENCE!"
	icon_state = "vox-civ-rd"

/obj/item/clothing/head/helmet/space/vox/civ/science/rd
	name = "vox research director pressure helmet"
	icon_state = "vox-civ-rd"
	desc = "A very alien-looking helmet for vox crewmembers. This one is for head of SCIENCE!"

/obj/item/clothing/suit/space/vox/civ/science/roboticist
	name = "vox roboticist pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. This one is for roboticists."
	icon_state = "vox-civ-roboticist"

/obj/item/clothing/head/helmet/space/vox/civ/science/roboticist
	name = "vox roboticist pressure helmet"
	icon_state = "vox-civ-roboticist"
	desc = "A very alien-looking helmet for vox crewmembers. This one is for roboticists."
	flash_protection = FLASH_PROTECTION_MAJOR


//Med/Sci
/obj/item/clothing/suit/space/vox/civ/medical
	name = "vox medical pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. This one is for medical personnel."
	icon_state = "vox-civ-medical"
	allowed = list(/obj/item/tank,/obj/item/flashlight,/obj/item/storage/firstaid,/obj/item/healthanalyzer,/obj/item/stack/medical)
	pressure_resistance = 40 * ONE_ATMOSPHERE

/obj/item/clothing/head/helmet/space/vox/civ/medical
	name = "vox medical pressure helmet"
	icon_state = "vox-civ-medical"
	desc = "A very alien-looking helmet for Nanotrasen-hired Vox. This one is for medical personnel."
	pressure_resistance = 40 * ONE_ATMOSPHERE

/obj/item/clothing/suit/space/vox/civ/medical/virologist
	name = "vox virologist pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. This one is for virologists."
	icon_state = "vox-civ-virologist"

/obj/item/clothing/head/helmet/space/vox/civ/medical/virologist
	name = "vox virologist pressure helmet"
	icon_state = "vox-civ-virologist"
	desc = "A very alien-looking helmet for Nanotrasen-hired Vox. This one is for virologists."

/obj/item/clothing/suit/space/vox/civ/medical/chemist
	name = "vox chemist pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. This one is for chemists."
	icon_state = "vox-civ-chemist"

/obj/item/clothing/head/helmet/space/vox/civ/medical/chemist
	name = "vox chemist pressure helmet"
	icon_state = "vox-civ-chemist"
	desc = "A very alien-looking helmet for Nanotrasen-hired Vox. This one is for chemists."

/obj/item/clothing/suit/space/vox/civ/medical/geneticist
	name = "vox geneticist pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. This one is for geneticists."
	icon_state = "vox-civ-geneticist"

/obj/item/clothing/head/helmet/space/vox/civ/medical/geneticist
	name = "vox geneticist pressure helmet"
	icon_state = "vox-civ-geneticist"
	desc = "A very alien-looking helmet for Nanotrasen-hired Vox. This one is for geneticists."

/obj/item/clothing/suit/space/vox/civ/medical/paramedic
	name = "vox paramedic pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. This one is for paramedics."
	icon_state = "vox-civ-paramedic"
	allowed = list(/obj/item/tank,/obj/item/flashlight,/obj/item/storage/firstaid,/obj/item/healthanalyzer,/obj/item/stack/medical,/obj/item/roller)

/obj/item/clothing/head/helmet/space/vox/civ/medical/paramedic
	name = "vox paramedic pressure helmet"
	icon_state = "vox-civ-paramedic"
	desc = "A very alien-looking helmet for Nanotrasen-hired Vox. This one is for paramedics."

/obj/item/clothing/suit/space/vox/civ/medical/cmo
	name = "vox cmo pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. This one is for the CMO."
	icon_state = "vox-civ-cmo"
	allowed = list(/obj/item/tank,/obj/item/flashlight,/obj/item/storage/firstaid,/obj/item/healthanalyzer,/obj/item/stack/medical,/obj/item/roller)

/obj/item/clothing/head/helmet/space/vox/civ/medical/cmo
	name = "vox cmo pressure helmet"
	icon_state = "vox-civ-cmo"
	desc = "A very alien-looking helmet for Nanotrasen-hired Vox. This one is for the CMO."

//Security
/obj/item/clothing/suit/space/vox/civ/security
	name = "vox security pressure suit"
	desc = "A cheap and oddly-shaped pressure suit made for vox crewmembers. This one is for security aligned vox."
	icon_state = "vox-civ-security"
	armor = list(melee = 60, bullet = 10, laser = 30, energy = 5, bomb = 45, bio = 100, rad = 10)
	allowed = list(/obj/item/tank,/obj/item/gun,/obj/item/flashlight,/obj/item/tank,/obj/item/melee/baton)
	pressure_resistance = 40 * ONE_ATMOSPHERE

/obj/item/clothing/head/helmet/space/vox/civ/security
	name = "vox security pressure helmet"
	icon_state = "vox-civ-security"
	desc = "A very alien-looking helmet for Nanotrasen-hired Vox. This one is for security aligned vox."
	pressure_resistance = 40 * ONE_ATMOSPHERE
	flash_protection = FLASH_PROTECTION_MAJOR
