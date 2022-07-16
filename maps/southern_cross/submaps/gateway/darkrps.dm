// -- Areas -- //

/area/awaymission/darkrp
	icon_state = "blank"
	base_turf = /turf/simulated/floor/outdoors/newdirt


/area/awaymission/darkrp/outside
	icon_state = "green"
	always_unpowered = 1
	dynamic_lighting = 1
	outdoors = 1

/area/awaymission/darkrp/checkpoint
	name = "Checkpoint"
	icon_state = "checkpoint1"
	requires_power = 0

/area/awaymission/darkrp/solarshack
	name = "Solarshack"
	icon_state = "panelsA"

/area/awaymission/darkrp/checkpointunpowered // Limiting powered area
	name = "Checkpoint"
	icon_state = "darkred"
	always_unpowered = 1
	power_equip = 0
	power_environ = 0
	power_light = 0

/area/awaymission/darkrp/emergency_pathway/EP_powered
	name = "Emergency Pathway"
	icon_state = "green"
	requires_power = 0

/area/awaymission/darkrp/emergency_pathway/EP_unpowered
	name = "Emergency Pathway"
	icon_state = "darkred"
	always_unpowered = 1
	power_equip = 0
	power_environ = 0
	power_light = 0

/area/awaymission/darkrp/restricted
	icon_state = "red"

// Base Area

/area/awaymission/darkrp/hallway/checkpointhallway
	name = "Gate Hallway"
	icon_state = "entry_1"
	requires_power = 0

/area/awaymission/darkrp/hallway/northhallway
	name = "Northern Hallway"
	icon_state = "north"

/area/awaymission/darkrp/hallway/centerhallway
	name = "Center Hallway"
	icon_state = "center"

/area/awaymission/darkrp/hallway/southhallway
	name = "Southern Hallway"
	icon_state = "south"

/area/awaymission/darkrp/hallway/dormhallway
	name = "Dorm Hallway"
	icon_state = "hallC"

/area/awaymission/darkrp/hallway/commandhallway
	name = "Command Hallway"
	icon_state = "hallC1"

/area/awaymission/darkrp/hallway/frontgate_substation
	name = "Front Gate Substation"
	icon_state = "substation"

/area/awaymission/darkrp/hallway/commandhallway_substation
	name = "Command Substation"
	icon_state = "substation"

// Security

/area/awaymission/darkrp/security/frontgate
	name = "Front Gate Checkpoint"
	icon_state = "checkpoint1"
	requires_power = 0
	power_equip = 1 // Powering entry

/area/awaymission/darkrp/security/seconddesk
	name = "Second Gate Checkpoint"
	icon_state = "checkpoint2"
	requires_power = 0
	power_equip = 1 // Powering entry

/area/awaymission/darkrp/security/lobby
	name = "Security Lobby"
	icon_state = "security"

/area/awaymission/darkrp/security/security_restroom
	name = "Security Restroom"
	icon_state = "security_bathroom"

/area/awaymission/darkrp/security/hallway
	name = "Security Hallway"
	icon_state = "red"

/area/awaymission/darkrp/security/detective
	name = "Detective's Office"
	icon_state = "detective"

/area/awaymission/darkrp/security/evidence_storage
	name = "Evidence Storage"
	icon_state = "evidence_storage"

/area/awaymission/darkrp/security/security_lockerroom
	name = "Security Locker Room"
	icon_state = "security_lockerroom"

/area/awaymission/darkrp/security/interrogation
	name = "Security Interrogation Room"
	icon_state = "interrogation"

/area/awaymission/darkrp/security/observatory
	name = "Security Observation Room"
	icon_state = "observatory"

/area/awaymission/darkrp/security/warden
	name = "Warden's Office"
	icon_state = "Warden"

/area/awaymission/darkrp/security/armory_entrance
	name = "Armory Entrance"
	icon_state = "armory_entrance"

/area/awaymission/darkrp/security/armory
	name = "Armory"
	icon_state = "armory"
	requires_power = 0

/area/awaymission/darkrp/security/heavy_armory
	name = "Heavy Armory"
	icon_state = "riot_control"
	requires_power = 0

/area/awaymission/darkrp/security/hallway2
	name = "Security South Hallway"
	icon_state = "red"

/area/awaymission/darkrp/security/firingrange
	name = "Firing Range"
	icon_state = "firingrange"

/area/awaymission/darkrp/security/security_cell_hallway
	name = "Cell Hallway"
	icon_state = "security_cell_hallway"

/area/awaymission/darkrp/security/security_cell
	name = "Security Cell"
	icon_state = "brig"

// Medical

/area/awaymission/darkrp/medical/front_desk
	name = "Medical Front Desk"
	icon_state = "medbay"

/area/awaymission/darkrp/medical/hallway
	name = "Medical Hallway"
	icon_state = "medbay4"

/area/awaymission/darkrp/medical/patients
	name = "Medical Patients Room"
	icon_state = "patients"

/area/awaymission/darkrp/medical/medical_restroom
	name = "Medical Restroom"
	icon_state = "restrooms"

/area/awaymission/darkrp/medical/patient_restroom
	name = "Medical Patient Restroom"
	icon_state = "restrooms"

/area/awaymission/darkrp/medical/medical_locker
	name = "Medical Locker Room"
	icon_state = "medbay3"

/area/awaymission/darkrp/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/awaymission/darkrp/medical/surgery
	name = "Surgery"
	icon_state = "surgery"

/area/awaymission/darkrp/medical/medbay_breakroom
	name = "Medical Breakroom"
	icon_state = "medbay_breakroom"

/area/awaymission/darkrp/medical/staff_room
	name = "Medical Staffroom"
	icon_state = "medbay2"

/area/awaymission/darkrp/medical/storage_room
	name = "Medical Storage Room"
	icon_state = "medbay_primary_storage"

/area/awaymission/darkrp/medical/morgue
	name = "Morgue"
	icon_state = "morgue"

//Engineering

/area/awaymission/darkrp/engineering/hallway
	name = "Engineering Hallway"
	icon_state = "yellow"

/area/awaymission/darkrp/engineering/tech_storage
	name = "Engineering Tech Storage"
	icon_state = "storage"

/area/awaymission/darkrp/engineering/secure_tech_storage
	name = "Engineering Secure Tech Storage"
	icon_state = "auxstorage"

/area/awaymission/darkrp/engineering/primary_storage
	name = "Engineering Primary Storage"
	icon_state = "primarystorage"

/area/awaymission/darkrp/engineering/staff_room
	name = "Engineering Staffroom"
	icon_state = "engineering_break"

/area/awaymission/darkrp/engineering/locker_room
	name = "Engineering Locker Room"
	icon_state = "engineering_locker"

/area/awaymission/darkrp/engineering/restroom
	name = "Engineering Restroom"
	icon_state = "restrooms"

/area/awaymission/darkrp/engineering/monitor_room
	name = "Engine Monitor Room"
	icon_state = "engine_monitoring"

/area/awaymission/darkrp/engineering/engine_checkpoint
	name = "Engine Checkpoint"
	icon_state = "security"

/area/awaymission/darkrp/engineering/engine
	name = "Engine Room"
	icon_state = "engine"

//Public/Service area

/area/awaymission/darkrp/service/janitor
	name = "Custodial Closet"
	icon_state = "janitor"

/area/awaymission/darkrp/service/fridge
	name = "Fridge"
	icon_state = "fridge"

/area/awaymission/darkrp/service/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/awaymission/darkrp/service/hydro
	name = "Hydroponics"
	icon_state = "hydro"

/area/awaymission/darkrp/service/cafeteria
	name = "Canteen"
	icon_state = "cafeteria"

/area/awaymission/darkrp/service/publicstaff
	name = "Public Staffroom"
	icon_state = "recreation_area"

/area/awaymission/darkrp/public/charger
	name = "Tool Storage"
	icon_state = "yellow"

/area/awaymission/darkrp/public/toolstorage1
	name = "Tool Storage 2"
	icon_state = "emergencystorage"

/area/awaymission/darkrp/public/toolstroage2
	name = "Command Toolstorage"
	icon_state = "emergencystorage"

/area/awaymission/darkrp/public/publicrestroom
	name = "Public Restroom"
	icon_state = "restrooms"

/area/awaymission/darkrp/public/cafeteria_restroom
	name = "Canteen Restroom"
	icon_state = "restrooms"


/area/awaymission/darkrp/dorms/panicroom
	name = "Panic Room"
	icon_state = "purple"
	requires_power = 0

//commandroom

/area/awaymission/darkrp/command/server
	name = "Server/Blackbox Room"
	icon_state = "dark128"
	requires_power = 0

/area/awaymission/darkrp/command/bridge
	name = "Main Control/Monitoring Room"
	icon_state = "bridge"

/area/awaymission/darkrp/command/observatory_path
	name = "Observation Hallway"
	icon_state = "entry_4"

/area/awaymission/darkrp/command/observatory
	name = "Observation Room"
	icon_state = "research"
	requires_power = 0

/area/awaymission/darkrp/command/testroom
	name = "Testing Chamber"
	icon_state = "thunder"
	requires_power = 0

/area/awaymission/darkrp/command/commandarmory
	name = "Emergency Armory"
	icon_state = "armory"

/area/awaymission/darkrp/command/monitorroom
	name = "BSA Monitoring Room"
	icon_state = "entry_1"

/area/awaymission/darkrp/command/sub_chamber
	name = "BSA Sub-Chamber"
	icon_state = "entry_2"

/area/awaymission/darkrp/command/gateway
	name = "BSA-Gateway Chamber"
	icon_state = "teleporter"

/area/awaymission/darkrp/command/bsa
	name = "BSA Chamber"
	icon_state = "security_sub"
	requires_power = 0

//Limited function

/area/awaymission/darkrp/base // Limiting powered areas
	icon_state = "away"
	requires_power = 0
	power_equip = 1
	power_environ = 1
	power_light = 1

/area/awaymission/darkrp/powerless // Limiting powered areas
	icon_state = "darkred"
	always_unpowered = 1
	power_equip = 0
	power_environ = 0
	power_light = 0

