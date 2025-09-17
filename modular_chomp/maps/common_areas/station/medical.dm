/area/medical
	icon_state = "medbay"
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL
	ambience = AMBIENCE_GENERIC
	sound_env = STANDARD_STATION

/area/medical/For_Medical_Post
	name = "\improper For Medical Post"
	icon_state = "medbay"

/area/medical/Aft_Medical_Post
	name = "\improper Aft Medical Post"
	icon_state = "medbay"

/area/medical/Port_Medical_Post
	name = "\improper Port Medical Post"
	icon_state = "medbay"

/area/medical/EMT_Bay
	name = "\improper EMT Bay"
	icon_state = "medbay"

/area/medical/Reception
	name = "\improper Reception"
	icon_state = "medbay"

/area/medical/FirstAid_Storage
	name = "\improper FirstAid Storage"
	icon_state = "medbay"

/area/medical/Chemistry
	name = "\improper Chemistry"
	icon_state = "medbay"

/area/medical/Distillery
	name = "\improper Distillery"
	icon_state = "chem"

/area/medical/Treatment_Hall
	name = "\improper Treatment Hall"
	icon_state = "medbay"

/area/medical/Surgery_Viewing
	name = "\improper Surgery Viewing"
	icon_state = "medbay"

/area/medical/Surgery_Room_1
	name = "\improper Surgery Room 1"
	icon_state = "medbay"
	flags = RAD_SHIELDED

/area/medical/Surgery_Room_2
	name = "\improper Surgery Room 2"
	icon_state = "medbay"
	flags = RAD_SHIELDED

/area/medical/Deck2_Evac_Corridor
	name = "\improper 2 Deck Evac Corridor"
	icon_state = "medbay"

/area/medical/Deck2_Corridor
	name = "\improper 2 Deck Corridor"
	icon_state = "medbay"

/area/medical/Patient_Ward
	name = "\improper Patient Ward"
	icon_state = "medbay"

/area/medical/Dressing_Room
	name = "\improper Dressing Room"
	icon_state = "medbay"

/area/medical/Locker_Room
	name = "\improper Locker Room"
	icon_state = "medbay"

/area/medical/CMO_Office
	name = "\improper CMO Office"
	icon_state = "medbay"

/area/medical/Stairwell
	name = "\improper Stairwell"
	icon_state = "medbay"

/area/medical/Morgue
	name = "\improper Morgue"
	icon_state = "medbay"
	ambience = AMBIENCE_GHOSTLY

/area/medical/Resleeving
	name = "\improper Resleeving"
	icon_state = "medbay"

/area/medical/Lounge
	name = "\improper Lounge"
	icon_state = "medbay"

/area/medical/Patient_1
	name = "\improper Patient 1"
	icon_state = "medbay"
	flags = RAD_SHIELDED

/area/medical/Patient_2
	name = "\improper Patient 2"
	icon_state = "medbay"
	flags = RAD_SHIELDED

/area/medical/Patient_3
	name = "\improper Patient 3"
	icon_state = "medbay"
	flags = RAD_SHIELDED

/area/medical/Patient_4
	name = "\improper Patient 4"
	icon_state = "medbay"
	flags = RAD_SHIELDED

/area/medical/Psych_Room_1
	name = "\improper Psych Room 1"
	icon_state = "medbay"
	flags = RAD_SHIELDED

/area/medical/Psych_Room_2
	name = "\improper Psych Room 2"
	icon_state = "medbay"
	flags = RAD_SHIELDED

/area/medical/Virology
	name = "\improper Virology"
	icon_state = "medbay"

/area/medical/Genetics_Lab
	name = "\improper Genetics Lab"
	icon_state = "medbay"

/area/medical/Surgery_Storage
	name = "\improper Surgery Storage"
	icon_state = "medbay"

/area/medical/Deck3_Corridor
	name = "\improper 3 Deck Corridor"
	icon_state = "medbay"

/area/medical/Autoresleeving
	name = "\improper Autoresleeving"
	icon_state = "medbay"
	ambience = AMBIENCE_GHOSTLY

/area/medical/Restrooms
	name = "\improper Restrooms"
	icon_state = "medbay"
	lightswitch = 1

/area/medical/first_aid_station
	name = "\improper First-Aid Station"
	icon_state = "medbay2"

/area/medical/first_aid_station/firstdeck
	name = "\improper First Deck First-Aid Station"

/area/medical/foyer
	name = "\improper Medbay Foyer"
	icon_state = "medbay2"
	music = 'sound/ambience/signal.ogg'

/area/medical/medsci
	name = "\improper Medical Science Hallway"
	icon_state = "medbay2"

/area/medical/first_aid_station/seconddeck/
	name = "\improper First-Aid Station"

/area/medical/first_aid_station/seconddeck/port
	name = "\improper Port First-Aid Station"

/area/medical/first_aid_station/seconddeck/fore
	name = "\improper Fore First-Aid Station"

/area/medical/first_aid_station/seconddeck/aft
	name = "\improper Aft First-Aid Station"

/area/medical/medical_lockerroom
	name = "\improper Medbay Locker Room"
	icon_state = "locker"

/area/medical/medical_restroom
	name = "\improper Medbay Restroom"
	icon_state = "medbay_restroom"
	sound_env = SMALL_ENCLOSED

/area/medical/first_aid_station/thirddeck
	name = "\improper Center Thirddeck First-Aid Station"
	icon_state = "medbay2"

/area/medical/sc_patient_a
	name ="\improper Patient A"
	icon_state = "medbay_patient_room_a"
	flags = RAD_SHIELDED

/area/medical/sc_patient_b
	name ="\improper Patient B"
	icon_state = "medbay_patient_room_b"
	flags = RAD_SHIELDED

/area/medical/cetus/atriumd1
	name = "\improper Medical Atrium Deck One"
	base_turf = /turf/simulated/floor/outdoors/rocks/cetus

/area/medical/cetus/atriumd2
	name = "\improper Medical Atrium Deck Two"

/area/medical/cetus/hall
	name = "\improper Medical Port Hallway"

/area/medical/cetus/jrfirstaid
	name = "\improper Joint Research Medical Station"

/area/medical/cetus/dormfirstaid
	name = "\improper Recreation Medical Station"
	base_turf = /turf/simulated/floor/outdoors/rocks/cetus
	flags = RAD_SHIELDED | AREA_FORBID_EVENTS | AREA_FORBID_SINGULO

/area/medical/cetus/sleevelobby
	name = "\improper EMT Lobby"
	icon_state = "medbay_emt_bay"

/area/medical/morgue/cetus
	base_turf = /turf/simulated/floor/outdoors/rocks/cetus
	ambience = AMBIENCE_GHOSTLY
	lightswitch = FALSE
