// -- Areas -- //

/area/awaymission/snowfield
	icon_state = "blank"
	base_turf = /turf/simulated/floor/outdoors/dirt

/area/awaymission/snowfield/cavern
	icon_state = "blue"
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg', 'sound/music/LRRMenu.ogg', 'sound/music/LRRTrack3.ogg', \
	'sound/ambience/cave/AmbCaveDebriA.ogg', 'sound/ambience/cave/AmbCaveDebriB.ogg', 'sound/ambience/cave/AmbCaveDebriC.ogg', \
	'sound/ambience/cave/AmbCaveDebriD.ogg')
	always_unpowered = 1

/area/awaymission/snowfield/outside
	icon_state = "green"
	always_unpowered = 1
	dynamic_lighting = 1
	outdoors = 1

/area/awaymission/snowfield/checkpoint
	name = "Checkpoint"
	icon_state = "checkpoint1"
	requires_power = 0

/area/awaymission/snowfield/solarshack
	name = "Solarshack"
	icon_state = "panelsA"

/area/awaymission/snowfield/checkpointunpowered // Limiting powered area
	name = "Checkpoint"
	icon_state = "darkred"
	always_unpowered = 1
	power_equip = 0
	power_environ = 0
	power_light = 0

/area/awaymission/snowfield/emergency_pathway/EP_powered
	name = "Emergency Pathway"
	icon_state = "green"
	requires_power = 0

/area/awaymission/snowfield/emergency_pathway/EP_unpowered
	name = "Emergency Pathway"
	icon_state = "darkred"
	always_unpowered = 1
	power_equip = 0
	power_environ = 0
	power_light = 0

/area/awaymission/snowfield/restricted
	icon_state = "red"

// Base Area

/area/awaymission/snowfield/hallway/checkpointhallway
	name = "Gate Hallway"
	icon_state = "entry_1"
	requires_power = 0

/area/awaymission/snowfield/hallway/northhallway
	name = "Northern Hallway"
	icon_state = "north"

/area/awaymission/snowfield/hallway/centerhallway
	name = "Center Hallway"
	icon_state = "center"

/area/awaymission/snowfield/hallway/southhallway
	name = "Southern Hallway"
	icon_state = "south"

/area/awaymission/snowfield/hallway/dormhallway
	name = "Dorm Hallway"
	icon_state = "hallC"

/area/awaymission/snowfield/hallway/commandhallway
	name = "Command Hallway"
	icon_state = "hallC1"

/area/awaymission/snowfield/hallway/frontgate_substation
	name = "Front Gate Substation"
	icon_state = "substation"

/area/awaymission/snowfield/hallway/commandhallway_substation
	name = "Command Substation"
	icon_state = "substation"

// Security

/area/awaymission/snowfield/security/frontgate
	name = "Front Gate Checkpoint"
	icon_state = "checkpoint1"
	requires_power = 0
	power_equip = 1 // Powering entry

/area/awaymission/snowfield/security/seconddesk
	name = "Second Gate Checkpoint"
	icon_state = "checkpoint2"
	requires_power = 0
	power_equip = 1 // Powering entry

/area/awaymission/snowfield/security/lobby
	name = "Security Lobby"
	icon_state = "security"

/area/awaymission/snowfield/security/security_restroom
	name = "Security Restroom"
	icon_state = "security_bathroom"

/area/awaymission/snowfield/security/hallway
	name = "Security Hallway"
	icon_state = "red"

/area/awaymission/snowfield/security/detective
	name = "Detective's Office"
	icon_state = "detective"

/area/awaymission/snowfield/security/evidence_storage
	name = "Evidence Storage"
	icon_state = "evidence_storage"

/area/awaymission/snowfield/security/security_lockerroom
	name = "Security Locker Room"
	icon_state = "security_lockerroom"

/area/awaymission/snowfield/security/interrogation
	name = "Security Interrogation Room"
	icon_state = "interrogation"

/area/awaymission/snowfield/security/observatory
	name = "Security Observation Room"
	icon_state = "observatory"

/area/awaymission/snowfield/security/warden
	name = "Warden's Office"
	icon_state = "Warden"

/area/awaymission/snowfield/security/armory_entrance
	name = "Armory Entrance"
	icon_state = "armory_entrance"

/area/awaymission/snowfield/security/armory
	name = "Armory"
	icon_state = "armory"
	requires_power = 0

/area/awaymission/snowfield/security/heavy_armory
	name = "Heavy Armory"
	icon_state = "riot_control"
	requires_power = 0

/area/awaymission/snowfield/security/hallway2
	name = "Security South Hallway"
	icon_state = "red"

/area/awaymission/snowfield/security/firingrange
	name = "Firing Range"
	icon_state = "firingrange"

/area/awaymission/snowfield/security/security_cell_hallway
	name = "Cell Hallway"
	icon_state = "security_cell_hallway"

/area/awaymission/snowfield/security/security_cell
	name = "Security Cell"
	icon_state = "brig"

// Medical

/area/awaymission/snowfield/medical/front_desk
	name = "Medical Front Desk"
	icon_state = "medbay"

/area/awaymission/snowfield/medical/hallway
	name = "Medical Hallway"
	icon_state = "medbay4"

/area/awaymission/snowfield/medical/patients
	name = "Medical Patients Room"
	icon_state = "patients"

/area/awaymission/snowfield/medical/medical_restroom
	name = "Medical Restroom"
	icon_state = "restrooms"

/area/awaymission/snowfield/medical/patient_restroom
	name = "Medical Patient Restroom"
	icon_state = "restrooms"

/area/awaymission/snowfield/medical/medical_locker
	name = "Medical Locker Room"
	icon_state = "medbay3"

/area/awaymission/snowfield/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/awaymission/snowfield/medical/surgery
	name = "Surgery"
	icon_state = "surgery"

/area/awaymission/snowfield/medical/medbay_breakroom
	name = "Medical Breakroom"
	icon_state = "medbay_breakroom"

/area/awaymission/snowfield/medical/staff_room
	name = "Medical Staffroom"
	icon_state = "medbay2"

/area/awaymission/snowfield/medical/storage_room
	name = "Medical Storage Room"
	icon_state = "medbay_primary_storage"

/area/awaymission/snowfield/medical/morgue
	name = "Morgue"
	icon_state = "morgue"

//Engineering

/area/awaymission/snowfield/engineering/hallway
	name = "Engineering Hallway"
	icon_state = "yellow"

/area/awaymission/snowfield/engineering/tech_storage
	name = "Engineering Tech Storage"
	icon_state = "storage"

/area/awaymission/snowfield/engineering/secure_tech_storage
	name = "Engineering Secure Tech Storage"
	icon_state = "auxstorage"

/area/awaymission/snowfield/engineering/primary_storage
	name = "Engineering Primary Storage"
	icon_state = "primarystorage"

/area/awaymission/snowfield/engineering/staff_room
	name = "Engineering Staffroom"
	icon_state = "engineering_break"

/area/awaymission/snowfield/engineering/locker_room
	name = "Engineering Locker Room"
	icon_state = "engineering_locker"

/area/awaymission/snowfield/engineering/restroom
	name = "Engineering Restroom"
	icon_state = "restrooms"

/area/awaymission/snowfield/engineering/monitor_room
	name = "Engine Monitor Room"
	icon_state = "engine_monitoring"

/area/awaymission/snowfield/engineering/engine_checkpoint
	name = "Engine Checkpoint"
	icon_state = "security"

/area/awaymission/snowfield/engineering/engine
	name = "Engine Room"
	icon_state = "engine"

//Public/Service area

/area/awaymission/snowfield/service/janitor
	name = "Custodial Closet"
	icon_state = "janitor"

/area/awaymission/snowfield/service/fridge
	name = "Fridge"
	icon_state = "fridge"

/area/awaymission/snowfield/service/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/awaymission/snowfield/service/hydro
	name = "Hydroponics"
	icon_state = "hydro"

/area/awaymission/snowfield/service/cafeteria
	name = "Canteen"
	icon_state = "cafeteria"

/area/awaymission/snowfield/service/publicstaff
	name = "Public Staffroom"
	icon_state = "recreation_area"

/area/awaymission/snowfield/public/charger
	name = "Tool Storage"
	icon_state = "yellow"

/area/awaymission/snowfield/public/toolstorage1
	name = "Tool Storage 2"
	icon_state = "emergencystorage"

/area/awaymission/snowfield/public/toolstroage2
	name = "Command Toolstorage"
	icon_state = "emergencystorage"

/area/awaymission/snowfield/public/publicrestroom
	name = "Public Restroom"
	icon_state = "restrooms"

/area/awaymission/snowfield/public/cafeteria_restroom
	name = "Canteen Restroom"
	icon_state = "restrooms"

//dorms

/area/awaymission/snowfield/dorms/dorm1
	name = "Room 1"

/area/awaymission/snowfield/dorms/dorm2
	name = "Room 2"

/area/awaymission/snowfield/dorms/dorm3
	name = "Room 3"

/area/awaymission/snowfield/dorms/dorm4
	name = "Room 4"

/area/awaymission/snowfield/dorms/dorm5
	name = "Room 5"

/area/awaymission/snowfield/dorms/dorm6
	name = "Room 6"

/area/awaymission/snowfield/dorms/dorm7
	name = "Room 7"

/area/awaymission/snowfield/dorms/dorm8
	name = "Room 8"

/area/awaymission/snowfield/dorms/dorm9
	name = "Room 9"

/area/awaymission/snowfield/dorms/dorm10
	name = "Room 10"

/area/awaymission/snowfield/dorms/dorm11
	name = "Room 11"

/area/awaymission/snowfield/dorms/dorm12
	name = "Room 12"

/area/awaymission/snowfield/dorms/dorm13
	name = "Room 13"

/area/awaymission/snowfield/dorms/dorm14
	name = "Room 14"

/area/awaymission/snowfield/dorms/dorm15
	name = "Room 15"

/area/awaymission/snowfield/dorms/dorm16
	name = "Room 16"

/area/awaymission/snowfield/dorms/panicroom
	name = "Panic Room"
	icon_state = "purple"
	requires_power = 0

//commandroom

/area/awaymission/snowfield/command/server
	name = "Server/Blackbox Room"
	icon_state = "dark128"
	requires_power = 0

/area/awaymission/snowfield/command/bridge
	name = "Main Control/Monitoring Room"
	icon_state = "bridge"

/area/awaymission/snowfield/command/observatory_path
	name = "Observation Hallway"
	icon_state = "entry_4"

/area/awaymission/snowfield/command/observatory
	name = "Observation Room"
	icon_state = "research"
	requires_power = 0

/area/awaymission/snowfield/command/testroom
	name = "Testing Chamber"
	icon_state = "thunder"
	requires_power = 0

/area/awaymission/snowfield/command/commandarmory
	name = "Emergency Armory"
	icon_state = "armory"

/area/awaymission/snowfield/command/monitorroom
	name = "BSA Monitoring Room"
	icon_state = "entry_1"

/area/awaymission/snowfield/command/sub_chamber
	name = "BSA Sub-Chamber"
	icon_state = "entry_2"

/area/awaymission/snowfield/command/gateway
	name = "BSA-Gateway Chamber"
	icon_state = "teleporter"

/area/awaymission/snowfield/command/bsa
	name = "BSA Chamber"
	icon_state = "security_sub"
	requires_power = 0

//Limited function

/area/awaymission/snowfield/base // Limiting powered areas
	icon_state = "away"
	requires_power = 0
	power_equip = 1
	power_environ = 1
	power_light = 1

/area/awaymission/snowfield/powerless // Limiting powered areas
	icon_state = "darkred"
	always_unpowered = 1
	power_equip = 0
	power_environ = 0
	power_light = 0

// -- Items -- //

// For fake solar power.
/obj/machinery/power/fractal_reactor/fluff/smes
	name = "power storage unit"
	desc = "A high-capacity superconducting magnetic energy storage (SMES) unit. The controls are locked."
	icon_state = "smes"

//For fake engine
/obj/machinery/power/rtg/fake_reactor
	name = "Nuclear Reactor"
	desc = "PTTO-3, an industrial all-in-one nuclear power plant by Neo-Chernobyl GmbH. The controls are locked."
	power_gen = 150000
	icon_state = "potatoon"

/obj/effect/landmark/away
	name = "awaystart"

//Gateway mission exclusive special loot

/obj/item/gun/projectile/automatic/serdy/sr25c
	name = "SR-25 Carbine"
	icon_state="m4"
	desc = "Heavily modified, this gun uses 7.62mm rather than 5.54mm and still has its automated fire mode. Equipped with suppressor, telescopic sight and the red dot sight on its side, it has a capability of handling the CQC and both in long range combat, without making much noises. Multi-dozens of accessories provides the improvement on the recoil, too. An old terran flag stamp and a spec-ops mark on the receiver approves its authentic state. Unmodified, cheep slack-off can be found just about everywhere, but this versions are very hard to come by. Chambered in 7.62x51mm."
	description_info = "This is a ballistic weapon.  To fire the weapon, ensure your intent is *not* set to 'help', have your gun mode set to 'fire', then click where you want to fire.  To reload, click the weapon in your hand to unload (if needed), then add the appropriate ammo. To use the scope, use the appropriate verb in the object tab. The description will tell you what caliber you need."
	caliber = "7.62mm"
	magazine_type = /obj/item/ammo_magazine/m762
	allowed_magazines = list(/obj/item/ammo_magazine/m762, /obj/item/ammo_magazine/m762m)
	projectile_type = /obj/item/projectile/bullet/rifle/a762
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    burst_accuracy=list(0,-5,-5), dispersion=list(0.0, 0.2, 0.4))
	)
	auto_loading_type = CLOSED_BOLT | LOCK_OPEN_EMPTY | LOCK_SLAPPABLE
	load_method = MAGAZINE
	muzzle_velocity = 880
	w_class = ITEMSIZE_HUGE
	actions_types = list(/datum/action/item_action/use_scope)
	accuracy = 10
	scoped_accuracy = 20
	one_handed_penalty = 65
	silenced = 1
	recoil = 0.5

/obj/item/gun/projectile/automatic/serdy/sr25c/ui_action_click()
	scope()

/obj/item/gun/projectile/automatic/serdy/sr25c/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)

/obj/item/gun/launcher/scopedrocket
	name = "scoped rocket launcher"
	desc = "Upon looking into the scope, you see the word on its center: MAGGOT."
	icon_state = "rocket"
	item_state = "rocket"
	w_class = ITEMSIZE_HUGE //CHOMP Edit.
	actions_types = list(/datum/action/item_action/use_scope)
	scoped_accuracy = 20
	one_handed_penalty = 150 //Good luck shooting one handed.
	throw_speed = 2
	throw_range = 10
	force = 5.0
	slot_flags = 0
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	fire_sound = 'sound/weapons/rpg.ogg'

	release_force = 15
	throw_distance = 30
	var/max_rockets = 1
	var/list/rockets = new/list()

/obj/item/gun/launcher/scopedrocket/examine(mob/user)
	. = ..()
	if(get_dist(user, src) <= 2)
		. += "<font color='blue'>[rockets.len] / [max_rockets] rockets.</font>"

/obj/item/gun/launcher/scopedrocket/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rocket))
		if(rockets.len < max_rockets)
			user.drop_item()
			I.loc = src
			rockets += I
			to_chat(user, span_blue("You put the rocket in [src]."))
			to_chat(user, span_blue("[rockets.len] / [max_rockets] rockets."))
		else
			to_chat(usr, span_red("[src] cannot hold more rockets."))

/obj/item/gun/launcher/scopedrocket/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rocket/I = rockets[1]
		rockets -= I
		return new I.projectile_type(src)
	return null

/obj/item/gun/launcher/scopedrocket/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired a rocket from a rocket launcher ([src.name]) at [target].")
	log_game("[key_name_admin(user)] used a rocket launcher ([src.name]) at [target].")
	..()

/obj/item/gun/launcher/scopedrocket/ui_action_click()
	scope()

/obj/item/gun/launcher/scopedrocket/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)

//Lore Notes

/obj/item/paper/awaygate/snowfield/evacuation_order
	name = "Order Directives"
	info = "<center><B><font size=\"6\">HIGH PRIORITY ORDERS</font></B><BR><BR><BR>ORDERS \
	TO <B>ALL CLASS 1, 2, 3 PERSONNEL</B><BR>Date of Order : <B>April 10, 1979</B>.</center> <BR><BR><BR>\
	Directives : <B>Evacuation preparation from Facility. <BR>All related personnel, EXCLUDING 3M personnel \
	must head to Chelyabinsk until 2100, April 10 and await for further directives.<BR>Base MUST \
	maintain necessary items only. </B><BR><BR>Further directives and details shall be guided by <B>Class 4 \
	or above personnel.</B>"

/obj/item/paper/awaygate/snowfield/evacuation_order2
	name = "Mid Command Order Directives"
	info = "<center><B><font size=\"6\">HIGH PRIORITY ORDERS</font></B><BR><BR><BR>ORDERS \
	TO <B>ALL CLASS 4 PERSONNEL</B><BR>Date of Order : <B>April 10, 1979</B>.</center> <BR><BR><BR>\
	Directives : <B>Evacuation preparation from Facility. <BR>All class 1,2,3 personnel must head to \
	Chelyabinsk and empty the facility, EXCLUDING Medical team. (3M)<BR>Base MUST maintain necessary items only \
	to operate 'Tunguska' and supplies for the crews who remains. 'Tunguska' Activation time at 0300, April 11, \
	1979.</B><BR><BR>Further directives and details shall be guided by <B>Class 6 or above personnel.</B>"

/obj/item/paper/awaygate/snowfield/evacuation_order3
	name = "High Command Order Directives"
	info = "<center><B><font size=\"6\">HIGH PRIORITY ORDERS</font></B><BR><BR><BR>ORDERS \
	TO <B>ALL CLASS 5, 6 PERSONNEL</B><BR>Date of Order : <B>April 10, 1979</B>.</center> <BR><BR><BR>\
	Directives : <B>Evacuation preparation from Facility. <BR>All Class 1, 2, 3 personnel must head to \
	Chelyabinsk and empty the facility, excluding Class 3M, guided by Class 4 personnel. <BR>All Class 5, 6 must \
	check the stabiity of 'Tunguska' before the operation. Activation time at 0300, April 11, 1979.</B>"

/obj/item/paper/awaygate/snowfield/activation_order
	name = "High Command Order Directives"
	info = "<center><B><font size=\"6\">HIGH PRIORITY ORDERS</font></B><BR><BR><BR>ORDERS \
	TO <B>ALL CLASS 5, 6 PERSONNEL</B><BR>Date of Order : <B>April 11, 1979</B>.</center> <BR><BR><BR>\
	Directives : <B>Activation of 'Tunguska.' <BR>All class 5, 6 personnel must have a full search by \
	Class 4 before entering the operation room. <BR>Any personnel who is not on the operations area shall \
	be terminated on the spot. Notify to nearest Class 4 and 6 personnel if necessary.</B><BR><BR>Further directives \
	and details shall be guided by <B>Class 6 Personnel.</B>"

/obj/item/paper/awaygate/snowfield/interrogation
	name = "Interrogation note"
	info = "(Recording Start)<BR>(00:00) This is Yemelyan Fedoro, the Warden of Sector 108.<BR>(00:09) Time of the \
	record... <BR>(00:14) Twenty one-Fourty.<BR>(00:17) Three months of interrogation is finally coming up with \
	a progress.<BR>(00:20) The lizard finally speaks, telling us the key points of the blueprint.<BR>(00:25) \
	There are missing important componant followed by the blueprint,<BR>(00:32) however, we may manage to get enough \
	from the asteroid back from 1908.<BR>(00:39) Exactly what the research team needs, whatever they say. Something \
	they won't be able to get in their lifetime, what they say. (00:52) Vlad is just using the lizard as their \
	Punching bag, now. (00:59) Gosh, their screams are worser than my grandma. Who would know an overgrown lizard \
	would sound like that..<BR>(01:07) Best to finish up, now. We can get more informations from'em. Yemelyan Fedoro, out."

/obj/item/paper/awaygate/snowfield/note // Little easter egg for appreciation.
	desc = "A gift card with a heart on the cover. Hey, there's a scribble on its back..."
	name = "letter"
	icon_state = "greetingcard_heart"
	info = "<center><B><font size=\"6\">Congradulations!</font></B></center><BR><BR>You have just found a paper that \
	was sitting at out of nowhere.<BR>Let there be a celebration to you, finding this tiny paper. But leaving this empty \
	will be awkward, so, some few honorable mentions shall be here.<BR><BR><B>Maker of the Map:</B> H.K <BR><BR><B>Huge \
	Emotional Support (And my life changer):</B> BlackMajor, Salty S<BR><BR><B>Supporters in the most troubled times</B>: \
	BlackMajor, Ender, Jack, Lone/Einarr, Mango, Nickner, Salty S, Serdy, Skitz, Verkister<BR><BR><B>Helpers on the map work:</B> \
	BlackMajor, Blitzkrieg, Dan 'Clanker' Neposh, Kassc, Mango, Rykka Stormheart, Salty S, Serdy, Verkister<BR><BR>\
	<B>Map recovery helper (Curse you github, almost deleting the project):</B> BlackMajor, Helmian, Jennard.L, Kashtan <BR>\
	<B>Also, not to forget - Huge thank you to</B>:You, who is reading this note. <BR><BR><BR>Let this be my 25c to remember."

/obj/item/paper/awaygate/snowfield/diary
	desc = "A part of a ripped paper, likely from the book."
	name = "diary, 18 of January, 1971"
	info = "Dear diary.<BR><BR> This will be the last diary I write in this little outpost.<BR><BR> Militsiya \
	has came today, to this middle-out-of-nowhere outpost,<BR> telling us to leave at once.<BR> Thankfully, \
	cave is almost dry of coal, and Dmitry wasn't drunk for once just by the time militsiya came. \
	Thank goodness. <BR> What the militsiya says it is from the government's orders. We had to leave \
	sometime soon and find another coal vein, anyways. <BR><BR> Anatoly, two days ago, said he saw the army \
	truck passing by few times around the mountains, so I think this is one of it. <BR><BR> Best to \
	take our stuffs tomorrow. And some vodka bottles I have hidden.<BR><BR><BR><BR><B>BLAST, \
	IT'S EMPTY! DIMITRY, THAT SCUMBAG - HOW DID HE EVEN KNEW THE BOTTLE'S THERE?!</B>"
