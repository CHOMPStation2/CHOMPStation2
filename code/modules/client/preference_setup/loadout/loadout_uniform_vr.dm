/datum/gear/uniform/suit/permit
	display_name = "nudity permit"
	path = /obj/item/clothing/under/permit

/datum/gear/uniform/suit/natureist_talisman
	display_name = "naturist talisman"
	path = /obj/item/clothing/under/permit/natureist_talisman

//Polaris overrides
/datum/gear/uniform/solgov/pt/sifguard
	display_name = "pt uniform, planetside sec"
	path = /obj/item/clothing/under/solgov/pt/sifguard

/datum/gear/uniform/job_skirt/sci
	allowed_roles = list("Research Director","Scientist", "Xenobiologist", "Xenobotanist")

/datum/gear/uniform/job_turtle/science
	allowed_roles = list("Research Director", "Scientist", "Roboticist", "Xenobiologist", "Xenobotanist")

/datum/gear/uniform/job_turtle/medical
	display_name = "turtleneck, medical"
	path = /obj/item/clothing/under/rank/medical/turtleneck
	allowed_roles = list("Chief Medical Officer", "Paramedic", "Medical Doctor", "Psychiatrist", "Field Medic", "Chemist") //CHOMP keep explo

//KHI Uniforms
/datum/gear/uniform/job_khi/cmd
	display_name = "ge uniform, cmd" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/cmd
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_khi/sec
	display_name = "geuniform, sec" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/sec
	allowed_roles = list("Head of Security", "Warden", "Detective", "Security Officer","Blueshield Guard","Security Pilot") //YW ADDITIONS

/datum/gear/uniform/job_khi/med
	display_name = "ge uniform, med" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/med
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Field Medic","Psychiatrist") //CHOMP keep explo

/datum/gear/uniform/job_khi/eng
	display_name = "ge uniform, eng" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/eng
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Engineer")

/datum/gear/uniform/job_khi/sci
	display_name = "ge uniform, sci" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/sci
	allowed_roles = list("Research Director", "Scientist", "Roboticist", "Xenobiologist", "Xenobotanist")

/datum/gear/uniform/job_khi/crg
	display_name = "ge uniform, cargo" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/crg
	allowed_roles = list("Quartermaster", "Cargo Technician", "Shaft Miner")

/datum/gear/uniform/job_khi/civ
	display_name = "ge uniform, civ" //CHOMPedit: changed to GE suit
	path = /obj/item/clothing/under/rank/khi/civ

//Federation jackets
/datum/gear/suit/job_fed/sec
	display_name = "fed uniform, sec"
	path = /obj/item/clothing/suit/storage/fluff/fedcoat
	allowed_roles = list("Head of Security", "Warden", "Detective", "Security Officer","Blueshield Guard","Security Pilot") //YW ADDITIONS

/datum/gear/suit/job_fed/medsci
	display_name = "fed uniform, med/sci"
	path = /obj/item/clothing/suit/storage/fluff/fedcoat/fedblue
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist","Xenobotanist", "Field Medic") //CHOMP keep explo

/datum/gear/suit/job_fed/eng
	display_name = "fed uniform, eng"
	path = /obj/item/clothing/suit/storage/fluff/fedcoat/fedeng
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Engineer")

// Trekie things
//TOS
/datum/gear/uniform/job_trek/cmd/tos
	display_name = "TOS uniform, cmd"
	path = /obj/item/clothing/under/rank/trek/command
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_trek/medsci/tos
	display_name = "TOS uniform, med/sci"
	path = /obj/item/clothing/under/rank/trek/medsci
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist", "Xenobotanist", "Field Medic") //CHOMP keep explo

/datum/gear/uniform/job_trek/eng/tos
	display_name = "TOS uniform, eng" //CHOMPEdit: Removed sec from the name. Gonna separate sec into its own so that I can apply armor value.
	path = /obj/item/clothing/under/rank/trek/eng //CHOMPEdit: Engineering only
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Engineer") //CHOMPEdit: Removed sec from the allowed list. Gonna separate sec into its own so that I can apply armor value.

//CHOMPEdit: See loadout_uniform_vr_ch.dm for a security-specific variant that has standard armor values.

//TNG
/datum/gear/uniform/job_trek/cmd/tng
	display_name = "TNG uniform, cmd"
	path = /obj/item/clothing/under/rank/trek/command/next
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_trek/medsci/tng
	display_name = "TNG uniform, med/sci"
	path = /obj/item/clothing/under/rank/trek/medsci/next
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist", "Xenobotanist", "Field Medic") //CHOMP keep explo

/datum/gear/uniform/job_trek/eng/tng
	display_name = "TNG uniform, eng" //CHOMPEdit: Removed sec from the name. Gonna separate sec into its own so that I can apply armor value.
	path = /obj/item/clothing/under/rank/trek/eng/next //CHOMPEdit: Engineering only
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Engineer") //CHOMPEdit: Removed sec from the allowed list. Gonna separate sec into its own so that I can apply armor value.

//CHOMPEdit: See loadout_uniform_vr_ch.dm for a security-specific variant that has standard armor values.

//VOY
/datum/gear/uniform/job_trek/cmd/voy
	display_name = "VOY uniform, cmd"
	path = /obj/item/clothing/under/rank/trek/command/voy
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_trek/medsci/voy
	display_name = "VOY uniform, med/sci"
	path = /obj/item/clothing/under/rank/trek/medsci/voy
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist", "Xenobotanist", "Field Medic") //CHOMP keep explo

/datum/gear/uniform/job_trek/eng/voy
	display_name = "VOY uniform, eng" //CHOMPEdit: Removed sec from the name. Gonna separate sec into its own so that I can apply armor value.
	path = /obj/item/clothing/under/rank/trek/eng/voy //CHOMPEdit: Engineering only
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Engineer") //CHOMPEdit: Removed sec from the allowed list. Gonna separate sec into its own so that I can apply armor value.

//CHOMPEdit: See loadout_uniform_vr_ch.dm for a security-specific variant that has standard armor values.

//DS9

/datum/gear/suit/job_trek/ds9_coat
	display_name = "DS9 Overcoat (use uniform)"
	path = /obj/item/clothing/suit/storage/trek/ds9
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director",
						"Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist",
						"Scientist","Roboticist","Xenobiologist","Xenobotanist","Atmospheric Technician",
						"Engineer","Warden","Detective","Security Officer", "Pathfinder", "Explorer", "Field Medic", "Blueshield Guard","Security Pilot") //YW ADDITIONS  //CHOMP keep explo


/datum/gear/uniform/job_trek/cmd/ds9
	display_name = "DS9 uniform, cmd"
	path = /obj/item/clothing/under/rank/trek/command/ds9
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_trek/medsci/ds9
	display_name = "DS9 uniform, med/sci"
	path = /obj/item/clothing/under/rank/trek/medsci/ds9
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist", "Xenobotanist", "Field Medic") //CHOMP keep explo

/datum/gear/uniform/job_trek/eng/ds9
	display_name = "DS9 uniform, eng" //CHOMPEdit: Removed sec from the name. Gonna separate sec into its own so that I can apply armor value.
	path = /obj/item/clothing/under/rank/trek/eng/ds9 //CHOMPEdit: Engineering only
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Engineer") //CHOMPEdit: Removed sec from the allowed list. Gonna separate sec into its own so that I can apply armor value.

//CHOMPEdit: See loadout_uniform_vr_ch.dm for a security-specific variant that has standard armor values.

//ENT
/datum/gear/uniform/job_trek/cmd/ent
	display_name = "ENT uniform, cmd"
	path = /obj/item/clothing/under/rank/trek/command/ent
	allowed_roles = list("Head of Security","Site Manager","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Blueshield Guard") //YW ADDITIONS

/datum/gear/uniform/job_trek/medsci/ent
	display_name = "ENT uniform, med/sci"
	path = /obj/item/clothing/under/rank/trek/medsci/ent
	allowed_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Xenobiologist", "Xenobotanist", "Field Medic") //CHOMP keep explo

/datum/gear/uniform/job_trek/eng/ent
	display_name = "ENT uniform, eng" //CHOMPEdit: Removed sec from the name. Gonna separate sec into its own so that I can apply armor value.
	path = /obj/item/clothing/under/rank/trek/eng/ent //CHOMPEdit: Engineering only
	allowed_roles = list("Chief Engineer","Atmospheric Technician","Engineer") //CHOMPEdit: Removed sec from the allowed list. Gonna separate sec into its own so that I can apply armor value.

//CHOMPEdit: See loadout_uniform_vr_ch.dm for a security-specific variant that has standard armor values.

/*
Swimsuits
*/

/datum/gear/uniform/swimsuits
	display_name = "swimsuits selection"
	path = /obj/item/weapon/storage/box/fluff/swimsuit

/datum/gear/uniform/swimsuits/New()
	..()
	var/list/swimsuits = list()
	for(var/obj/item/weapon/storage/box/fluff/swimsuit/swimsuit_type as anything in typesof(/obj/item/weapon/storage/box/fluff/swimsuit))
		swimsuits[initial(swimsuit_type.name)] = swimsuit_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(swimsuits))

/datum/gear/uniform/suit/gnshorts
	display_name = "GN shorts"
	path = /obj/item/clothing/under/fluff/gnshorts

//Latex maid dress
/datum/gear/uniform/latexmaid
	display_name = "latex maid dress"
	path = /obj/item/clothing/under/fluff/latexmaid

//Tron Siren outfit
/datum/gear/uniform/siren
	display_name = "jumpsuit, Siren"
	path = /obj/item/clothing/under/fluff/siren

/datum/gear/uniform/suit/v_nanovest
	display_name = "Varmacorp nanovest"
	path = /obj/item/clothing/under/fluff/v_nanovest

/*
Qipao
*/
/datum/gear/uniform/qipao_black
	display_name = "qipao, black"
	path = /obj/item/clothing/under/qipao

/datum/gear/uniform/qipao_red
	display_name = "qipao, red"
	path = /obj/item/clothing/under/qipao/red

/datum/gear/uniform/qipao_white
	display_name = "qipao, white"
	path = /obj/item/clothing/under/qipao/white

/datum/gear/uniform/qipao_colorable_alt
	display_name = "qipao, colorable alt"
	path = /obj/item/clothing/under/qipao/white/colorable

/datum/gear/uniform/qipao_colorable_alt/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/*
Bluespace jumpsuit
*/
/datum/gear/uniform/hfjumpsuit
	display_name = "HYPER jumpsuit"
	path = /obj/item/clothing/under/hyperfiber
	cost = 2

/*
Talon jumpsuit
*/
/datum/gear/uniform/talonbasic
	display_name = "Talon Jumpsuit"
	description = "A jumpsuit that is usually issued to ITV Talon contractors, however others can purchase it to show their support towards the ship."
	path = /obj/item/clothing/under/rank/talon/basic

// Summer dresses
/datum/gear/uniform/summerdress
	display_name = "summer dress selection"
	path = /obj/item/clothing/under/summerdress

/datum/gear/uniform/summerdress/New()
	..()
	var/list/dresses = list(
		"black and white" = /obj/item/clothing/under/summerdress,
		"blue and white" = /obj/item/clothing/under/summerdress/blue,
		"red and white" = /obj/item/clothing/under/summerdress/red
	)
	gear_tweaks += new/datum/gear_tweak/path(dresses)

// undersuits
/datum/gear/uniform/undersuit
	display_name = "undersuit selection"
	path = /obj/item/clothing/under/undersuit/

/datum/gear/uniform/undersuit/New()
	..()
	var/list/suits = list()
	var/list/blacklisted_types = list(/obj/item/clothing/under/undersuit/sec,
									  /obj/item/clothing/under/undersuit/sec/hos,
									  /obj/item/clothing/under/undersuit/hazard,
									  /obj/item/clothing/under/undersuit/command,
									  /obj/item/clothing/under/undersuit/centcom)
	for(var/obj/item/clothing/under/undersuit/undersuit_type as anything in typesof(/obj/item/clothing/under/undersuit))
		if(undersuit_type in blacklisted_types)
			continue
		suits[initial(undersuit_type.name)] = undersuit_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(suits))

/datum/gear/uniform/undersuit_haz
	display_name = "undersuit, hazard (Engineering)"
	allowed_roles = list("Chief Engineer", "Atmospheric Technician", "Engineer")
	path = /obj/item/clothing/under/undersuit/hazard

/datum/gear/uniform/undersuit_sec
	display_name = "undersuit, security (Security)"
	allowed_roles = list("Head of Security", "Warden", "Detective", "Security Officer")
	path = /obj/item/clothing/under/undersuit/sec

/datum/gear/uniform/undersuit_hos
	display_name = "undersuit, security command (HoS)"
	allowed_roles = list("Head of Security")
	path = /obj/item/clothing/under/undersuit/sec/hos

/datum/gear/uniform/undersuit_com
	display_name = "undersuit, command (SM/HoP)"
	allowed_roles = list("Site Manager", "Head of Personnel")
	path = /obj/item/clothing/under/undersuit/command

//Altevian Uniforms
/datum/gear/uniform/altevian
	description = "An extremely comfortable set of clothing that's made to help people handle their day to day work around the fleets with little to no discomfort."
	display_name = "altevian uniform selection"

/datum/gear/uniform/altevian/New()
	..()
	var/list/pants = list()
	for(var/obj/item/clothing/under/pants/altevian/pants_type as anything in typesof(/obj/item/clothing/under/pants/altevian))
		pants[initial(pants_type.name)] = pants_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(pants))


//Feminine Colored Jumpsuits.
/datum/gear/uniform/f_jumpsuit_alt
	display_name = "Colored Feminine Jumpsuit"
	path = /obj/item/clothing/under/color/fjumpsuit

/datum/gear/uniform/f_jumpsuit_alt/New()
	..()
	var/list/jumpsuits = list()
	for(var/jumpsuit_style in typesof(/obj/item/clothing/under/color/fjumpsuit))
		var/obj/item/clothing/under/color/fjumpsuit/jumpsuit = jumpsuit_style
		jumpsuits[initial(jumpsuit.name)] = jumpsuit
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(jumpsuits))

//Modernized Sec Jumpsuit
/datum/gear/uniform/modernsec
    display_name = "undersuit, security, modernized (Security)"
    allowed_roles = list("Head of Security", "Warden", "Detective", "Security Officer")
    path = /obj/item/clothing/under/rank/security/modern

/datum/gear/uniform/singer_blue
	display_name = "blue singer dress"
	path = /obj/item/clothing/under/dress/singer

/datum/gear/uniform/singer_yellow
	display_name = "yellow singer dress"
	path = /obj/item/clothing/under/dress/singer/yellow

//Antediluvian corsets from CitRP
/datum/gear/uniform/antediluvian
	display_name = "corset, antediluvian"
	path = /obj/item/clothing/under/dress/antediluvian

/datum/gear/uniform/antediluvianalt
	display_name = "corset, antediluvian alt"
	path = /obj/item/clothing/under/dress/antediluvian/sheerless

//Colorable skirts
/datum/gear/uniform/coloredskirts
	display_name = "skirt selection, colorable"
	path = /obj/item/clothing/under/skirt/colorable

/datum/gear/uniform/coloredskirts/New()
	..()
	var/list/skirts = list(
	"casual skirt"=/obj/item/clothing/under/skirt/colorable,
	"puffy skirt"=/obj/item/clothing/under/skirt/colorable/puffy,
	"skater skirt"=/obj/item/clothing/under/skirt/colorable/skater,
	"pleated skirt"=/obj/item/clothing/under/skirt/colorable/pleated,
	"pencil skirt"=/obj/item/clothing/under/skirt/colorable/pencil,
	"plaid skirt"=/obj/item/clothing/under/skirt/colorable/plaid,
	"tube skirt"=/obj/item/clothing/under/skirt/colorable/tube,
	"long skirt"=/obj/item/clothing/under/skirt/colorable/long,
	"high skirt"=/obj/item/clothing/under/skirt/colorable/high,
	"swept skirt"=/obj/item/clothing/under/skirt/colorable/swept,
	"jumper skirt"=/obj/item/clothing/under/skirt/colorable/jumper,
	"jumper dress"=/obj/item/clothing/under/skirt/colorable/jumperdress
	)
	gear_tweaks += list(new/datum/gear_tweak/path(skirts), gear_tweak_free_color_choice)