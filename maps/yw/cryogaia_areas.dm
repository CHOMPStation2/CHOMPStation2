//Outpost area
/area/borealis2
	icon = 'icons/turf/areas_vr.dmi'
/area/borealis2/elevator/medbasement
	name = "Elevator shaft - Lower Medical"
/area/borealis2/elevator/medbay
	name = "Elevator shaft - Upper Medical"
/area/borealis2/elevator/dorms
	name = "Elevator shaft - Dorms"
/area/borealis2/elevator/scicargo
	name = "Elevator shaft - Sci-Cargo"
/area/borealis2/elevator/scimining
	name = "Elevator shaft - Sci-Mining"
/area/borealis2/elevator/sciminingtransit
	name = "Elevator shaft - Depth tranist"
/area/borealis2/outdoors
	name = "Outside - Surface"
	icon_state = "outside1"
	sound_env = MOUNTAINS

/area/crew_quarters/meeting
	name = "\improper Public Conference"
	icon_state = "courtroom"

/area/borealis2/outdoors/grounds
	name = "\The outpost grounds"

/area/borealis2/outdoors/exterior
	name = "The wilderness"

/area/borealis2/outdoors/exterior/lake
	name = "The Ice Lake"

/area/borealis2/outdoors/exterior/explore1
	name = "Abandoned building"

/area/borealis2/outdoors/exterior/explore2
	name = "Unexplored Area"

/area/borealis2/outdoors/exterior/explore3
	name = "Unexplored Caves"

/area/borealis2/outdoors/grounds/power
	name = "\The Exterior Powerline"

/area/borealis2/outdoors/grounds/traderpad
	name = "\improper Cryogaia Commerce Pad"
	icon = 'icons/turf/areas_yw.dmi'
	icon_state = "landingpad"

/area/borealis2/outdoors/grounds/entrance
	name = "\improper Cryogaia Compound Gate"

/area/borealis2/outdoors/grounds/solars
	name = "\The solar array"
	icon = 'icons/turf/areas.dmi'
	icon_state = "panelsA"
//crew quarters-dorms
/area/crew_quarters/showers
	name = "\improper Unisex Showers"
	icon_state = "recreation_area_restroom"

/area/crew_quarters/sleep/maintDorm1
	name = "\improper Construction Dorm 1"
	icon_state = "Sleep"
	flags = RAD_SHIELDED

/area/crew_quarters/sleep/maintDorm2
	name = "\improper Construction Dorm 2"
	icon_state = "Sleep"
	flags = RAD_SHIELDED

/area/crew_quarters/sleep/maintDorm3
	name = "\improper Construction Dorm 3"
	icon_state = "Sleep"
	flags = RAD_SHIELDED

/area/crew_quarters/sleep/maintDorm4
	name = "\improper Construction Dorm 4"
	icon_state = "Sleep"
	flags = RAD_SHIELDED

/area/crew_quarters/sleep/Dorm_1/holo
	name = "\improper Dorm 1 Holodeck"
	icon_state = "dk_yellow"
	flags = RAD_SHIELDED | BLUE_SHIELDED

/area/crew_quarters/sleep/Dorm_3/holo
	name = "\improper Dorm 3 Holodeck"
	icon_state = "dk_yellow"
	flags = RAD_SHIELDED | BLUE_SHIELDED

/area/crew_quarters/sleep/Dorm_5/holo
	name = "\improper Dorm 5 Holodeck"
	icon_state = "dk_yellow"
	flags = RAD_SHIELDED | BLUE_SHIELDED

/area/crew_quarters/sleep/Dorm_7/holo
	name = "\improper Dorm 7 Holodeck"
	icon_state = "dk_yellow"
	flags = RAD_SHIELDED | BLUE_SHIELDED

//
/area/chapel/monastery
	name = "Monastery"
	icon_state = "chapel"

/area/chapel/monastery/kitchen
	name = "Monastery Kitchen"

/area/chapel/monastery/atmos
	name = "Monastery Atmospherics"

/area/chapel/monastery/brew
	name = "Monastery Brewery"

/area/chapel/monastery/recreation
	name = "Monastery Recreation"


//holodorms
/area/holodeck/holodorm/source_basic
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
/area/holodeck/holodorm/source_desert
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
/area/holodeck/holodorm/source_seating
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
/area/holodeck/holodorm/source_beach
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
/area/holodeck/holodorm/source_garden
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
/area/holodeck/holodorm/source_boxing
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
/area/holodeck/holodorm/source_snow
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
/area/holodeck/holodorm/source_space
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED
/area/holodeck/holodorm/source_off
	name = "\improper Holodeck Source"
	flags = RAD_SHIELDED | BLUE_SHIELDED

// Mining Underdark
/area/maintenance/maintroom1
	name = "Forgotten Maintenance"
	icon_state = "amaint"
/area/maintenance/maintroom2
	name = "Forgotten Maintenance"
	icon_state = "amaint"
/area/maintenance/maintroom3
	name = "Forgotten Maintenance"
	icon_state = "amaint"
/area/maintenance/maintroom4
	name = "Forgotten Maintenance"
	icon_state = "amaint"
/area/maintenance/maintroom5
	name = "Forgotten Maintenance"
	icon_state = "amaint"
/area/maintenance/maintroom6
	name = "Forgotten Maintenance"
	icon_state = "amaint"
/area/maintenance/maintroom7
	name = "Forgotten Maintenance"
	icon_state = "amaint"
/area/maintenance/holo
	name = "Holodeck Maintenance"
	icon_state = "pmaint"

/area/maintenance/dorm
	name = "Dormitory Maintenance"
	icon_state = "amaint"

/area/maintenance/fish
	name = "Civilian Maintenance"
	icon_state = "pmaint"

/area/crew_quarters/kitchen/lower
	name = "Lower Kitchen"

/area/crew_quarters/kitchen/fish_farm
	name = "\improper Fish Farm"
	icon_state = "red"
/area/mine/explored/underdark
	name = "\improper Mining Underdark"
	base_turf = /turf/simulated/mineral/floor

/area/cryogaia/tram //hold over from tether, used in tram station shocking rails code.
	name = "\improper Tram Station"
	icon_state = "dk_yellow"


// Exploration Shuttle stuff //
/area/cryogaia/station/excursion_dock
	name = "\improper Exploration Vessel Dock"

/area/cryogaia/station/explorer_prep
	name = "\improper Explorer Prep Room"

/area/cryogaia/station/explorer_meeting
	name = "\improper Explorer Meeting Room"

/area/cryogaia/station/pathfinder_office
	name = "\improper Pathfinder's Office"

/area/shuttle/excursion
	name = "\improper Exploration Vessel"
	icon_state = "shuttle2"
	requires_power = 1
	base_turf = /turf/space

// Bad guys!!
/area/shuttle/mercenary
	name = "\improper Mercenary Vessel"

/area/shuttle/skipjack
	name = "\improper Vox Vessel"

//Exploration area locations.

// Exploration area - Plains
/area/cryogaia/outpost/exploration_plains
	name = "\improper Plains Exploration Zone"
	icon_state = "green"
/area/cryogaia/outpost/exploration_shed
	name = "\improper Plains Entrance Shed"
/area/cryogaia_away/cave/unexplored/normal

//antag stuff
/area/antag/antag_base
	name = "\improper Syndicate Outpost"
	requires_power = 0
	dynamic_lighting = 0

// Security stuff

/area/security/hallway
	name = "\improper Security Hallway"
	icon_state = "security"
/area/security/hallwayaux
	name = "\improper Security Armory Hallway"
	icon_state = "security"
/area/security/forensics
	name = "\improper Forensics Lab"
	icon_state = "security"
/area/security/breakroom
	name = "\improper Security Breakroom"
	icon_state = "security"
/area/security/brig/visitation
	name = "\improper Visitation"
	icon_state = "security"
/area/security/brig/bathroom
	name = "\improper Brig Bathroom"
	icon_state = "security"
/area/security/armory/blue
	name = "\improper Armory - Blue"
	icon_state = "armory"
/area/security/armory/red
	name = "\improper Armory - Red"
	icon_state = "red2"
/area/security/observation
	name = "\improper Brig Observation"
	icon_state = "riot_control"
/area/security/eva
	name = "\improper Security EVA"
	icon_state = "security_equip_storage"
/area/security/recstorage
	name = "\improper Brig Recreation Storage"
	icon_state = "brig"
/area/security/auxiliarrystation
	name = "\improper Security Auxiliary Station"
	icon_state = "security"

/area/security/sorting
	name = "\improper Security disposals processing"
	icon_state = "security"

/area/maintenance/security
	name = "Security Maintenance"
	icon_state = "maint_security_starboard"

/area/maintenance/security_lower
	name = "Underground Security Maintenance"
	icon_state = "maint_security_starboard"

/area/maintenance/medical_lower
	name = "Underground Medical Maintenance"
	icon_state = "maint_medbay_fore"

/area/mine/unexplored/underdark
	name = "Underground rock"
	icon_state = "explored"

/area/mine/explored/lower_rock
	name = "Underground rock"
	icon_state = "explored"

/area/mine/unexplored/lower_rock
	name = "Unexplored Underground rock"
	icon_state = "explored"

//Medical stuff
/area/medical/medbaylower
	name = "\improper Medbay Annex"
	icon_state = "medbay4"
	music = 'sound/ambience/signal.ogg'
/area/medical/biostorage2
	name = "\improper Auxiliary Storage"
	icon_state = "medbay2"
	music = 'sound/ambience/signal.ogg'
/area/medical/biostorage3
	name = "\improper Secondary Auxiliary Storage"
	icon_state = "medbay2"
	music = 'sound/ambience/signal.ogg'
/area/medical/toilet
	name = "\improper Medical bathroom"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED
/area/medical/pyschwarde
	name = "\improper Psychiatric lockup"
	icon_state = "medbay2"
/area/medical/triage
	name = "\improper Medbay Triage"
	icon_state = "medbay4"
/area/medical/scanning
	name = "Medical Diagnostics Center"
	icon_state = "medbay"


//Science outpost
/area/rnd/xenobiology/xenoflora/lab_atmos
	name = "\improper Xenoflora Atmospherics Lab"
/area/rnd/lockers
	name = "\improper Research Locker Room"
	icon_state = "research"
/area/rnd/hallway
	name = "\improper Research Lower Hallway"
	icon_state = "research"
/area/rnd/nanite
	name = "\improper Nanite Research"
	icon_state = "toxmisc"
/area/rnd/storage
	name = "\improper Research Storage"
	icon_state = "toxmisc"

// Substations & engineering
/area/maintenance/substation/mining
	name = "\improper Mining Substation"

/area/maintenance/starboardsolar
	name = "Solar Maintenance - Aft Starboard"
	icon_state = "SolarcontrolS"
	sound_env = SMALL_ENCLOSED

/area/maintenance/bridge
	name = "Bridge Maintenance"
	icon_state = "maintcentral"

/area/engineering/hallway
	name = "\improper Engineering Hallway"
	icon_state = "engineering_aft_hallway"


/area/engineering/hallway_lower
	name = "\improper Lower Engineering Hallway"
	icon_state = "engineering_aft_hallway"


/area/tcomstorage
	name = "\improper Telecommunications Storage"
	icon_state = "tcomsateast"
	ambience = AMBIENCE_ENGINEERING

// vacant
/area/vacant/vacant_site/east
	name = "\improper East Base Vacant Site"
	flags = null
/area/vacant/vacant_site/locker
	name = "\improper Extra locker room"
/area/vacant/vacant_site/private
	name = "\improper Vacant PI Office"

/area/solar/primary
	name = "primary Solar Array"
	icon_state = "panelsA"

/area/storage/emergency_storage/engineering
	name = "Engineering Emergency Storage"
	icon_state = "emergencystorage"

/area/maintenance/substation/atmospheric // Atmos substation
	name = "Atmospherics Substation"
/area/maintenance/substation/civilian_lower // Atmos substation
	name = "Lower Civilian Substation"

// Exclude some more areas from the atmos leak event so people don't get trapped when spawning.
//Need to adjust areas in cryogaia for this below.
/datum/event/atmos_leak/setup()
/*	excluded |= /area/tether/surfacebase/tram
	excluded |= /area/tether/surfacebase/atrium_one
	excluded |= /area/tether/surfacebase/atrium_two
	excluded |= /area/tether/surfacebase/atrium_three
	excluded |= /area/teleporter/departing
	excluded |= /area/hallway/station/upper (*/
	..()


/area/bridge/blueshield
	name = "\improper Blueshield Office"
	icon_state = "bridge"
	music = null
	sound_env = MEDIUM_SOFTFLOOR

/area/ai_foyer
	name = "\improper AI Chamber foyer"
	icon_state = "ai_chamber"
	ambience = AMBIENCE_AI


/area/hallway/secondary/exit_link
	name = "\improper Docking Area link"
	icon_state = "escape"