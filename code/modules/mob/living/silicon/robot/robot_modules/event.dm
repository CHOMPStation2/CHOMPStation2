//CHOMPNOTE - if upstream edits the sprite lists it will have to be manually copied into our station_vr file, anything else is just read from here
/* Other, unaffiliated modules */

// The module that borgs on the surface have.  Generally has a lot of useful tools in exchange for questionable loyalty to the crew.
/obj/item/robot_module/robot/lost
	name = "lost robot module"
	hide_on_manifest = TRUE

/obj/item/robot_module/robot/lost/create_equipment(var/mob/living/silicon/robot/robot)
	..()
	// Sec
	src.modules += new /obj/item/melee/baton/shocker/robot(src)
	src.modules += new /obj/item/handcuffs/cyborg(src)
	src.modules += new /obj/item/borg/combat/shield(src)

	// Med
	src.modules += new /obj/item/healthanalyzer(src)
	src.modules += new /obj/item/shockpaddles/robot(src)
	src.modules += new /obj/item/reagent_containers/borghypo/lost(src)

	// Engi
	src.modules += new /obj/item/weldingtool/electric/mounted(src)
	src.modules += new /obj/item/tool/screwdriver/cyborg(src)
	src.modules += new /obj/item/tool/wrench/cyborg(src)
	src.modules += new /obj/item/tool/wirecutters/cyborg(src)
	src.modules += new /obj/item/multitool(src)

	// Sci
	src.modules += new /obj/item/robotanalyzer(src)

	// Potato
	src.emag += new /obj/item/gun/energy/retro/mounted(src)

	var/datum/matter_synth/wire = new /datum/matter_synth/wire()
	synths += wire

	var/obj/item/stack/cable_coil/cyborg/C = new /obj/item/stack/cable_coil/cyborg(src)
	C.synths = list(wire)
	src.modules += C

	src.modules += new /obj/item/dogborg/sleeper/lost(src)
	src.modules += new /obj/item/dogborg/pounce(src)

/obj/item/robot_module/robot/gravekeeper
	name = "gravekeeper robot module"
	hide_on_manifest = TRUE

/obj/item/robot_module/robot/gravekeeper/create_equipment(var/mob/living/silicon/robot/robot)
	..()
	// For fending off animals and looters
	src.modules += new /obj/item/melee/baton/shocker/robot(src)
	src.modules += new /obj/item/borg/combat/shield(src)

	// For repairing gravemarkers
	src.modules += new /obj/item/weldingtool/electric/mounted(src)
	src.modules += new /obj/item/tool/screwdriver/cyborg(src)
	src.modules += new /obj/item/tool/wrench/cyborg(src)

	// For growing flowers
	src.modules += new /obj/item/material/minihoe(src)
	src.modules += new /obj/item/material/knife/machete/hatchet(src)
	src.modules += new /obj/item/analyzer/plant_analyzer(src)
	src.modules += new /obj/item/storage/bag/plants(src)
	src.modules += new /obj/item/robot_harvester(src)

	// For digging and beautifying graves
	src.modules += new /obj/item/shovel(src)
	src.modules += new /obj/item/gripper/gravekeeper(src)

	// For really persistent looters
	src.emag += new /obj/item/gun/energy/retro/mounted(src)

	var/datum/matter_synth/wood = new /datum/matter_synth/wood(50000) //CHOMPEdit - "Buffing this to 50k on account of broken code not letting us pick up more stacks. Wee."
	synths += wood

	var/obj/item/stack/material/cyborg/wood/W = new (src)
	W.synths = list(wood)
	src.modules += W

	// For uwu
	src.modules += new /obj/item/dogborg/sleeper/compactor/generic(src)
	src.emag += new /obj/item/dogborg/pounce(src)

	//CHOMPEdit - "Giving the gravekeeper drone more modules to allow it to actually do it's job."
	src.modules += new /obj/item/tool/wirecutters/cyborg(src) //Gotta clear those pesky landmines somehow. Also allows for deconstruction of things in the way!
	src.modules += new /obj/item/multitool(src)
	src.modules += new /obj/item/soap/nanotrasen(src)
	src.modules += new /obj/item/storage/bag/trash(src)
	src.modules += new /obj/item/mop(src)
	src.modules += new /obj/item/lightreplacer(src)
	src.modules += new /obj/item/gripper/no_use/loader(src)
	src.modules += new /obj/item/gripper(src)
	src.modules += new /obj/item/pickaxe(src)
	src.modules += new /obj/item/floor_painter(src)
	src.modules += new /obj/item/pen/robopen(src)
	src.modules += new /obj/item/form_printer(src)
	src.modules += new /obj/item/gripper/paperwork(src)
	src.modules += new /obj/item/hand_labeler(src)
	src.modules += new /obj/item/stamp(src)
	src.modules += new /obj/item/stamp/denied(src)

	var/obj/item/flame/lighter/zippo/L = new /obj/item/flame/lighter/zippo(src)
	L.lit = 1
	src.modules += L

	var/datum/matter_synth/metal = new /datum/matter_synth/metal(50000)
	var/datum/matter_synth/glass = new /datum/matter_synth/glass(50000)
	var/datum/matter_synth/plasteel = new /datum/matter_synth/plasteel(20000)
	var/datum/matter_synth/plastic = new /datum/matter_synth/plastic(50000)
	var/datum/matter_synth/wire = new /datum/matter_synth/wire()
	synths += metal
	synths += glass
	synths += plasteel
	synths += plastic
	synths += wire

	var/obj/item/matter_decompiler/MD = new /obj/item/matter_decompiler(src)
	MD.metal = metal
	MD.glass = glass
	src.modules += MD

	var/obj/item/stack/material/cyborg/steel/M = new (src)
	M.synths = list(metal)
	src.modules += M

	var/obj/item/stack/material/cyborg/glass/G = new (src)
	G.synths = list(glass)
	src.modules += G

	var/obj/item/stack/rods/cyborg/rods = new /obj/item/stack/rods/cyborg(src)
	rods.synths = list(metal)
	src.modules += rods

	var/obj/item/stack/cable_coil/cyborg/C = new /obj/item/stack/cable_coil/cyborg(src)
	C.synths = list(wire)
	src.modules += C

	var/obj/item/stack/material/cyborg/plasteel/PS = new (src)
	PS.synths = list(plasteel)
	src.modules += PS

	var/obj/item/stack/tile/wood/cyborg/WT = new /obj/item/stack/tile/wood/cyborg(src)
	WT.synths = list(wood)
	src.modules += WT

	var/obj/item/stack/tile/floor/cyborg/S = new /obj/item/stack/tile/floor/cyborg(src)
	S.synths = list(metal)
	src.modules += S

	var/obj/item/stack/tile/roofing/cyborg/CT = new /obj/item/stack/tile/roofing/cyborg(src)
	CT.synths = list(metal)
	src.modules += CT

	var/obj/item/stack/material/cyborg/glass/reinforced/RG = new (src)
	RG.synths = list(metal, glass)
	src.modules += RG

	var/obj/item/stack/material/cyborg/plastic/PL = new (src)
	PL.synths = list(plastic)
	src.modules += PL //CHOMEdit End
