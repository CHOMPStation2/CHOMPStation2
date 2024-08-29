// This is a defines file for card sprite stacks. If a new card set comes in, this file can just be disabled and a new one made to match the new sprites.
// Generally, if the icon file is card_xxx.dmi, this filename should be sprite_stacks_xxx.dm
// Please make sure that only the relevant sprite_stacks_xxx.file is included, if more are made.

/obj/item/card // CHOMPEdit - Removal of obj/item/weapon
	icon = 'icons/obj/card_new_vr.dmi' // These are redefined here so that changing sprites is as easy as clicking the checkbox.
	base_icon = 'icons/obj/card_new_vr.dmi'

	// New sprite stacks can be defined here. You could theoretically change icon-states as well but right now this file compiles before station_ids.dm so those wouldn't be affected.

//IDs

/obj/item/card/id // CHOMPEdit - Removal of obj/item/weapon
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n")

/obj/item/card/id/generic // CHOMPEdit - Removal of obj/item/weapon
	name = "Generic ID"
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-silhouette", "clip")

//Central

/obj/item/card/id/centcom // CHOMPEdit - Removal of obj/item/weapon
	name = "Central Command ID"
	initial_sprite_stack = list("base-stamp-gold", "top-blue", "stamp-n", "pips-white", "stripe-gold")

/obj/item/card/id/centcom/vip // CHOMPEdit - Removal of obj/item/weapon
	name = "VIP ID"
	initial_sprite_stack = list("base-stamp-gold", "top-blue", "stamp-n", "pips-gold", "stripe-gold")

//ERT

/obj/item/card/id/centcom/ERT // CHOMPEdit - Removal of obj/item/weapon
	name = "Emergency Responder ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-red", "stripe-red")

/obj/item/card/id/centcom/ERT/medic // CHOMPEdit - Removal of obj/item/weapon
	name = "Emergency Medical Responder ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-medblu", "stripe-medblu")

/obj/item/card/id/centcom/ERT/commander // CHOMPEdit - Removal of obj/item/weapon
	name = "Emergency Response Commander ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-gold", "stripe-gold")

/obj/item/card/id/centcom/ERT/engineer // CHOMPEdit - Removal of obj/item/weapon
	name = "Emergency Engineering Responder ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-orange", "stripe-orange")

/obj/item/card/id/centcom/ERT/janitor // CHOMPEdit - Removal of obj/item/weapon
	name = "Emergency Cleanup Responder ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-purple", "stripe-purple")

//Silver

/obj/item/card/id/silver // CHOMPEdit - Removal of obj/item/weapon
	name = "Silver ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n")

/obj/item/card/id/silver/secretary // CHOMPEdit - Removal of obj/item/weapon
	name = "Secretary's ID"
	initial_sprite_stack = list("base-stamp", "top-blue", "stamp-n")

/obj/item/card/id/silver/hop // CHOMPEdit - Removal of obj/item/weapon
	name = "Head of Personnel ID"
	initial_sprite_stack = list("base-stamp-silver", "top-blue", "stamp-n", "pips-gold")

//Gold

/obj/item/card/id/gold // CHOMPEdit - Removal of obj/item/weapon
	name = "Gold ID"
	initial_sprite_stack = list("base-stamp-gold", "top-blue", "stamp-n")

/obj/item/card/id/gold/captain // CHOMPEdit - Removal of obj/item/weapon
	name = "Captain's ID"
	initial_sprite_stack = list("base-stamp-gold", "top-blue", "stamp-n", "pips-gold")

/obj/item/card/id/gold/captain/spare // CHOMPEdit - Removal of obj/item/weapon
	name = "Spare ID"
	initial_sprite_stack = list("base-stamp-gold", "top-gold", "stamp-n")

//Medical

/obj/item/card/id/medical // CHOMPEdit - Removal of obj/item/weapon
	name = "Medical ID"
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n")

/obj/item/card/id/medical/chemist // CHOMPEdit - Removal of obj/item/weapon
	name = "Chemist's ID"
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n", "stripe-orange")

/obj/item/card/id/medical/geneticist // CHOMPEdit - Removal of obj/item/weapon
	name = "Geneticist's ID"
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n", "stripe-purple")

/obj/item/card/id/medical/psych // CHOMPEdit - Removal of obj/item/weapon
	name = "Psychologist's ID"
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n", "stripe-brown")

/obj/item/card/id/medical/virologist // CHOMPEdit - Removal of obj/item/weapon
	name = "Virologist's ID"
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n", "stripe-green")

/obj/item/card/id/medical/emt // CHOMPEdit - Removal of obj/item/weapon
	name = "Emergency Medical Technician's ID"
	initial_sprite_stack = list("base-stamp", "top-medblu", "stamp-n", "stripe-blue")

/obj/item/card/id/medical/head // CHOMPEdit - Removal of obj/item/weapon
	name = "Chief Medical Officer's ID"
	initial_sprite_stack = list("base-stamp-silver", "top-medblu", "stamp-n", "pips-gold")

//Security

/obj/item/card/id/security // CHOMPEdit - Removal of obj/item/weapon
	name = "Security ID"
	initial_sprite_stack = list("base-stamp", "top-red", "stamp-n")

/obj/item/card/id/security/detective // CHOMPEdit - Removal of obj/item/weapon
	name = "Detective's ID"
	initial_sprite_stack = list("base-stamp", "top-red", "stamp-n", "stripe-brown")

/obj/item/card/id/security/warden // CHOMPEdit - Removal of obj/item/weapon
	name = "Warden's ID"
	initial_sprite_stack = list("base-stamp", "top-red", "stamp-n", "stripe-white")

/obj/item/card/id/security/head // CHOMPEdit - Removal of obj/item/weapon
	name = "Head of Security's ID"
	initial_sprite_stack = list("base-stamp-silver", "top-red", "stamp-n", "pips-gold")

//Engineering

/obj/item/card/id/engineering // CHOMPEdit - Removal of obj/item/weapon
	name = "Engineering ID"
	initial_sprite_stack = list("base-stamp", "top-orange", "stamp-n")

/obj/item/card/id/engineering/atmos // CHOMPEdit - Removal of obj/item/weapon
	name = "Atmospherics ID"
	initial_sprite_stack = list("base-stamp", "top-orange", "stripe-medblu", "stamp-n")

/obj/item/card/id/engineering/head // CHOMPEdit - Removal of obj/item/weapon
	name = "Chief Engineer's ID"
	initial_sprite_stack = list("base-stamp-silver", "top-orange", "stamp-n", "pips-gold")

//Science

/obj/item/card/id/science // CHOMPEdit - Removal of obj/item/weapon
	name = "Science ID"
	initial_sprite_stack = list("base-stamp", "top-purple", "stamp-n")

/obj/item/card/id/science/roboticist // CHOMPEdit - Removal of obj/item/weapon
	name = "Roboticist's ID"
	initial_sprite_stack = list("base-stamp", "top-purple", "stamp-n", "stripe-brown")

/obj/item/card/id/science/xenobiologist // CHOMPEdit - Removal of obj/item/weapon
	name = "Xenobiologist's ID"
	initial_sprite_stack = list("base-stamp", "top-purple", "stamp-n", "stripe-orange")

/obj/item/card/id/science/xenobotanist // CHOMPEdit - Removal of obj/item/weapon
	name = "Xenobotanist's ID"
	initial_sprite_stack = list("base-stamp", "top-purple", "stamp-n", "stripe-green")

/obj/item/card/id/science/head // CHOMPEdit - Removal of obj/item/weapon
	name = "Research Director's ID"
	initial_sprite_stack = list("base-stamp-silver", "top-purple", "stamp-n", "pips-gold")

//Cargo

/obj/item/card/id/cargo // CHOMPEdit - Removal of obj/item/weapon
	name = "Cargo ID"
	initial_sprite_stack = list("base-stamp", "top-brown", "stamp-n")

/obj/item/card/id/cargo/miner // CHOMPEdit - Removal of obj/item/weapon
	name = "Miner's ID"
	initial_sprite_stack = list("base-stamp", "top-brown", "stamp-n", "stripe-purple")

/obj/item/card/id/cargo/head // CHOMPEdit - Removal of obj/item/weapon
	name = "Quartermaster's ID"
	initial_sprite_stack = list("base-stamp-silver", "top-brown", "stamp-n", "pips-white")

//Civilian

/obj/item/card/id/civilian // CHOMPEdit - Removal of obj/item/weapon
	name = "Civilian ID"
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n")

/obj/item/card/id/civilian/chaplain // CHOMPEdit - Removal of obj/item/weapon
	name = "Chaplain's ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-cross", "stripe-white")

/obj/item/card/id/civilian/journalist // CHOMPEdit - Removal of obj/item/weapon
	name = "Journalist's ID"
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n", "stripe-red")

/obj/item/card/id/civilian/pilot // CHOMPEdit - Removal of obj/item/weapon
	name = "Pilot's ID"
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n", "stripe-olive")

/obj/item/card/id/civilian/entertainer // CHOMPEdit - Removal of obj/item/weapon
	name = "Entertainer's ID"
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n", "stripe-brown")

/obj/item/card/id/civilian/entrepreneur // CHOMPEdit - Removal of obj/item/weapon
	name = "Entrepreneur's ID"
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-n", "stripe-gold")

/obj/item/card/id/civilian/clown // CHOMPEdit - Removal of obj/item/weapon
	name = "Clown's ID"
	initial_sprite_stack = list("base-stamp", "top-rainbow", "stamp-n")

/obj/item/card/id/civilian/mime // CHOMPEdit - Removal of obj/item/weapon
	name = "Mime's ID"
	initial_sprite_stack = list("base-stamp", "top-white", "stamp-n", "stripe-black")

/obj/item/card/id/civilian/internal_affairs // CHOMPEdit - Removal of obj/item/weapon
	name = "Internal Affairs ID"
	initial_sprite_stack = list("base-stamp", "top-blue", "stamp-n", "stripe-black")

//Service

/obj/item/card/id/civilian/service // CHOMPEdit - Removal of obj/item/weapon
	name = "Service ID"
	initial_sprite_stack = list("base-stamp", "top-green", "stamp-n")

/obj/item/card/id/civilian/service/botanist // CHOMPEdit - Removal of obj/item/weapon
	name = "Botanist's ID"
	initial_sprite_stack = list("base-stamp", "top-green", "stamp-n", "stripe-darkgreen")

/obj/item/card/id/civilian/service/bartender // CHOMPEdit - Removal of obj/item/weapon
	name = "Bartender's ID"
	initial_sprite_stack = list("base-stamp", "top-green", "stamp-n", "stripe-black")

/obj/item/card/id/civilian/service/chef // CHOMPEdit - Removal of obj/item/weapon
	name = "Chef's ID"
	initial_sprite_stack = list("base-stamp", "top-green", "stamp-n", "stripe-white")

/obj/item/card/id/civilian/service/janitor // CHOMPEdit - Removal of obj/item/weapon
	name = "Janitor's ID"
	initial_sprite_stack = list("base-stamp", "top-green", "stamp-n", "stripe-purple")

//Exploration

/obj/item/card/id/exploration // CHOMPEdit - Removal of obj/item/weapon
	name = "Exploration ID"
	initial_sprite_stack = list("base-stamp", "top-olive", "stamp-n")

/obj/item/card/id/exploration/fm // CHOMPEdit - Removal of obj/item/weapon
	name = "Field Medic's ID"
	initial_sprite_stack = list("base-stamp", "top-olive", "stamp-n", "stripe-medblu")

/obj/item/card/id/exploration/head // CHOMPEdit - Removal of obj/item/weapon
	name = "Pathfinder's ID"
	initial_sprite_stack = list("base-stamp-silver", "top-olive", "stamp-n", "pips-white")

//Talon

/obj/item/card/id/talon // CHOMPEdit - Removal of obj/item/weapon
	name = "Talon ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette")

/obj/item/card/id/talon/doctor // CHOMPEdit - Removal of obj/item/weapon
	name = "Talon Medical ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-medblu", "stripe-medblu")

/obj/item/card/id/talon/engineer // CHOMPEdit - Removal of obj/item/weapon
	name = "Talon Engineering ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-orange", "stripe-orange")

/obj/item/card/id/talon/officer // CHOMPEdit - Removal of obj/item/weapon
	name = "Talon Security ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-red", "stripe-red")

/obj/item/card/id/talon/pilot // CHOMPEdit - Removal of obj/item/weapon
	name = "Talon Pilot ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-purple", "stripe-purple")

/obj/item/card/id/talon/miner // CHOMPEdit - Removal of obj/item/weapon
	name = "Talon Mining ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-brown", "stripe-brown")

/obj/item/card/id/talon/captain // CHOMPEdit - Removal of obj/item/weapon
	name = "Talon Captain ID"
	initial_sprite_stack = list("base-stamp-dark", "top-dark", "stamp-silhouette", "pips-gold", "stripe-gold")

//Antags

/obj/item/card/id/syndicate // CHOMPEdit - Removal of obj/item/weapon
	name = "Syndicate ID"
	initial_sprite_stack = list("base-stamp-dark", "top-syndicate", "stamp-s")

/obj/item/card/id/syndicate/officer // CHOMPEdit - Removal of obj/item/weapon
	name = "Syndicate Officer ID"
	initial_sprite_stack = list("base-stamp-dark", "top-syndicate", "stamp-s", "pips-gold", "stripe-gold")
