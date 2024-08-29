/obj/machinery/alembic
	name = "Alembic"
	desc = "A piece of glass chemical apparatus that is used to distill and concentrate chemicals."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "alembic"
	use_power = FALSE
	anchored = TRUE
	density = FALSE
	layer = ABOVE_WINDOW_LAYER
	vis_flags = VIS_HIDE
	unacidable = TRUE
	clicksound = "button"
	clickvol = 60

	var/potion_reagent = 0
	var/bubbling = 0
	var/base_reagent = 0
	var/product_potion = 0
	var/expected_base = 0

/obj/machinery/alembic/update_icon()
	if(potion_reagent == 0 && base_reagent == 0) //Empty
		icon_state = "alembic"
	else if(potion_reagent != 0 && base_reagent == 0) //Has potion reagent but not base
		icon_state = "alembic-base"
	else if(potion_reagent == 0 && base_reagent != 0) //Has a base but no reagent
		icon_state = "alembic-base"
	else if(potion_reagent != 0 && base_reagent != 0 && !bubbling ) //Has a reagent but is not turned on
		icon_state = "alembic-full"
	else if(bubbling == 1) //is actively bubbling
		icon_state = "alembic-bubble"
	return

/obj/machinery/alembic/attackby(var/obj/item/potion_material/O as obj, var/mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(O,/obj/item/potion_material)) // CHOMPEdit - Removal of obj/item/weapon
		if(potion_reagent != 0 )
			to_chat(user, SPAN_WARNING("There is already a reagent in the alembic!"))
			return
		else
			src.potion_reagent = O
			src.expected_base = O.base_reagent
			src.product_potion = O.product_potion
			user.drop_item()
			O.loc = src
			update_icon()
			to_chat(user, SPAN_NOTICE("You place the [O] in the alembic."))
			src.updateUsrDialog()
			return
	else if(istype(O,/obj/item/potion_base)) // CHOMPEdit - Removal of obj/item/weapon
		if(base_reagent != 0 )
			to_chat(user, SPAN_WARNING("There is already a base in the alembic!"))
			return
		else
			src.base_reagent = O
			user.drop_item()
			O.loc = src
			update_icon()
			to_chat(user, SPAN_NOTICE("You place the [O] in the alembic."))
			src.updateUsrDialog()
			return
	else
		to_chat(user, SPAN_WARNING("This item is no use in the alembic."))
		return

/obj/machinery/alembic/attack_hand(mob/user as mob)

	if(potion_reagent == 0 || base_reagent == 0) //If there is nothing in there
		to_chat(user, SPAN_WARNING("The alembic is not yet full!"))
		return
	else if(potion_reagent != 0 && base_reagent != 0 && !bubbling) //if there is something in there and it's not bubbling yet
		bubbling = 1
		update_icon()
		to_chat(user, SPAN_NOTICE("The alembic begins boiling the [potion_reagent] in the [base_reagent]."))
		sleep(30)
		bubbling = 0
		to_chat(user, SPAN_NOTICE("The alembic finishes brewing the potion!"))
		spawn_potion()
		potion_reagent = 0
		base_reagent = 0
		update_icon()
		return
	else if(bubbling)
		to_chat(user, SPAN_WARNING("The alembic is already boiling!"))
		return

/obj/machinery/alembic/AltClick(mob/user)
	if(potion_reagent == 0)
		to_chat(user, SPAN_WARNING("There is nothing in the alembic!"))
		return
	else if(potion_reagent != 0 && !bubbling) //if there is something in there and it's not bubbling yet
		if(!user.incapacitated() && Adjacent(user))
			user.put_in_hands(potion_reagent)
			potion_reagent = 0
			update_icon()
		else
			return
	else if(bubbling)
		to_chat(user, SPAN_WARNING("The alembic is already boiling, it's too late to get your reagent back!"))
		return

/obj/machinery/alembic/proc/spawn_potion()
	if(istype(base_reagent,expected_base))
		new product_potion(loc)
	else
		var/failed_product = pick(/obj/item/reagent_containers/glass/bottle/potion/plain, // CHOMPEdit - Removal of obj/item/weapon
								/obj/item/reagent_containers/glass/bottle/potion/ethanol, // CHOMPEdit - Removal of obj/item/weapon
								/obj/item/reagent_containers/glass/bottle/potion/sugar, // CHOMPEdit - Removal of obj/item/weapon
								/obj/item/reagent_containers/glass/bottle/potion/capsaicin, // CHOMPEdit - Removal of obj/item/weapon
								/obj/item/reagent_containers/glass/bottle/potion/soporific, // CHOMPEdit - Removal of obj/item/weapon
								/obj/item/reagent_containers/glass/bottle/potion/lipostipo, // CHOMPEdit - Removal of obj/item/weapon
								/obj/item/reagent_containers/glass/bottle/potion/phoron) // CHOMPEdit - Removal of obj/item/weapon
		new failed_product(loc)

//The actual ingredients!

/obj/item/potion_material // CHOMPEdit - Removal of obj/item/weapon
	name = "blood ruby"
	desc = "An extremely hard but oddly brittle gem with a beautiful red colouration."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "blood_ruby"
	var/base_reagent = /obj/item/potion_base/ichor // CHOMPEdit - Removal of obj/item/weapon
	var/product_potion = /obj/item/reagent_containers/glass/bottle/potion/healing // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/blood_ruby // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/ruby_eye // CHOMPEdit - Removal of obj/item/weapon
	name = "ruby eye"
	desc = "An odd gem in the shape of an eye, it has a strange static charge to the surface."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "ruby_eye"
	base_reagent = /obj/item/potion_base/ichor // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/greater_healing // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/golden_scale // CHOMPEdit - Removal of obj/item/weapon
	name = "golden scale"
	desc = "A reptilian scale with an almost metalic texture and a shining gold surface."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "golden_scale"
	base_reagent = /obj/item/potion_base/alkahest // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/fire_resist // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/frozen_dew // CHOMPEdit - Removal of obj/item/weapon
	name = "frozen dew"
	desc = "A bitter leaf with a small droplet of crystalised dew attached to it."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "frozen_dew"
	base_reagent = /obj/item/potion_base/ichor // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/antidote // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/living_coral // CHOMPEdit - Removal of obj/item/weapon
	name = "living coral"
	desc = "Some coral that appears to be friving outside of the water, it has an oddly metallic scent."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "living_coral"
	base_reagent = /obj/item/potion_base/aqua_regia // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/water // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/rare_horn // CHOMPEdit - Removal of obj/item/weapon
	name = "rare horn"
	desc = "A sharp, straight horn from some unknown animal."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "rare_horn"
	base_reagent = /obj/item/potion_base/alkahest // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/regeneration // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/moldy_bread // CHOMPEdit - Removal of obj/item/weapon
	name = "moldy bread"
	desc = "A slice of bread that's clearly been left out for far too long."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "moldy_bread"
	base_reagent = /obj/item/potion_base/aqua_regia // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/panacea // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/glowing_gem // CHOMPEdit - Removal of obj/item/weapon
	name = "glowing gem"
	desc = "An pretty but rough gem that is literally glowing green, it tingles to touch."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "glowing_gem"
	base_reagent = /obj/item/potion_base/alkahest // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/magic // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/giant_toe // CHOMPEdit - Removal of obj/item/weapon
	name = "giant toe"
	desc = "One really large severed toe, in some state of suspended decomposition. It's gross and stinks."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "giant_toe"
	base_reagent = /obj/item/potion_base/aqua_regia // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/lightness // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/flesh_of_the_stars // CHOMPEdit - Removal of obj/item/weapon
	name = "flesh of the stars"
	desc = "A rare slab of meat with an unknown origin, said to have fallen from the sky."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "flesh_of_the_stars"
	base_reagent = /obj/item/potion_base/aqua_regia // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/bonerepair // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/spinning_poppy // CHOMPEdit - Removal of obj/item/weapon
	name = "spinning poppy"
	desc = "A small poppy flower that seems inclined to twirl without aid."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "spinning_poppy"
	base_reagent = /obj/item/potion_base/aqua_regia // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/pain // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/salt_mage // CHOMPEdit - Removal of obj/item/weapon
	name = "salt mage"
	desc = "A statuette made from salt crystals, it's adorned with a little mages hat."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "salt_mage"
	base_reagent = /obj/item/potion_base/alkahest // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/shrink // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/golden_grapes // CHOMPEdit - Removal of obj/item/weapon
	name = "golden grapes"
	desc = "A bunch of grapes with a shining golden skin, they smell strongly of some sort of solvent."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "golden_grapes"
	base_reagent = /obj/item/potion_base/alkahest // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/growth // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/fairy_house // CHOMPEdit - Removal of obj/item/weapon
	name = "fairy house"
	desc = "A moderately large mushroom with a speckled red cap and... a door on the front?"
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "fairy_house"
	base_reagent = /obj/item/potion_base/ichor // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/faerie // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/thorny_bulb // CHOMPEdit - Removal of obj/item/weapon
	name = "thorny bulb"
	desc = "A flesh green plant bulb covered in thorns, it has a sulfur rich aroma."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "thorny_bulb"
	base_reagent = /obj/item/potion_base/aqua_regia // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/relaxation // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/ancient_egg // CHOMPEdit - Removal of obj/item/weapon
	name = "ancient egg"
	desc = "An egg, but seemingly really really old and long past rotten."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "ancient_egg"
	base_reagent = /obj/item/potion_base/aqua_regia // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/speed // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/crown_stem // CHOMPEdit - Removal of obj/item/weapon
	name = "crown stem"
	desc = "An odd little flower that looks like a crown, the leaves have a minty aroma."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "crown_stem"
	base_reagent = /obj/item/potion_base/alkahest // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/attractiveness // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/red_ingot // CHOMPEdit - Removal of obj/item/weapon
	name = "red ingot"
	desc = "An oddly red coloured block of iron, it seems rather brittle and wouldn't make for a good smithing material."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "red_ingot"
	base_reagent = /obj/item/potion_base/alkahest // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/boyjuice // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/soft_diamond // CHOMPEdit - Removal of obj/item/weapon
	name = "soft diamond"
	desc = "A gem that looks much like a diamond, but is squishy to the touch."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "soft_diamond"
	base_reagent = /obj/item/potion_base/ichor // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/girljuice // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/solid_mist // CHOMPEdit - Removal of obj/item/weapon
	name = "solid mist"
	desc = "A small purple stone that seems to be radiating some sort of mist."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "solid_mist"
	base_reagent = /obj/item/potion_base/ichor // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/badpolymorph // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/spider_leg // CHOMPEdit - Removal of obj/item/weapon
	name = "spider leg"
	desc = "A severed limb from a spider, it seems to be oozing with green... something."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "spider_leg"
	base_reagent = /obj/item/potion_base/aqua_regia // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/SOP // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/folded_dark // CHOMPEdit - Removal of obj/item/weapon
	name = "folded dark"
	desc = "A folded material that appears to be made of pure dark."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "folded_dark"
	base_reagent = /obj/item/potion_base/ichor // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/truepolymorph // CHOMPEdit - Removal of obj/item/weapon

/obj/item/potion_material/glamour_shard // CHOMPEdit - Removal of obj/item/weapon
	name = "glamour shard"
	desc = "A shard of hardened white crystal that seems to change shapes as you hold it."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "glamour_shard"
	base_reagent = /obj/item/potion_base/aqua_regia // CHOMPEdit - Removal of obj/item/weapon
	product_potion = /obj/item/reagent_containers/glass/bottle/potion/glamour // CHOMPEdit - Removal of obj/item/weapon

//base ingredients

/obj/item/potion_base/aqua_regia // CHOMPEdit - Removal of obj/item/weapon
	name = "aqua regia"
	desc = "A mixture of concentrated acids, be careful not to spill it! A base ingredient of many potions."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "aqua_regia"
	w_class = ITEMSIZE_TINY

/obj/item/potion_base/ichor // CHOMPEdit - Removal of obj/item/weapon
	name = "ichor"
	desc = "A thick and heavy red reagent said to be tinged with the blood of gods. A base ingredient of many potions."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "ichor"
	w_class = ITEMSIZE_TINY

/obj/item/potion_base/alkahest // CHOMPEdit - Removal of obj/item/weapon
	name = "alkahest"
	desc = "Also known as the universal solvent, said to be capable of dissolving metal rapidly. A base ingredient of many potions."
	icon = 'icons/obj/chemical_potionreagents.dmi'
	icon_state = "alkahest"
	w_class = ITEMSIZE_TINY
