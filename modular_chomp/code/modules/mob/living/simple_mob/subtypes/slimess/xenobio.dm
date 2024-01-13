/mob/living/simple_mob/slime/xenobio/yellow
	projectiletype = /obj/item/projectile/energy/mob/electric_spider

/mob/living/simple_mob/slime/xenobio/sepia
	desc = "This slime is rather unknown and strange."
	color = "#968473"
	slime_color = "sepia"
	coretype = /obj/item/slime_extract/sepia
	reagent_injected = "stoxin"

	mutation_chance = 100

	slime_mutation = list(
			/mob/living/simple_mob/slime/xenobio/sepia,
			/mob/living/simple_mob/slime/xenobio/oil,
			/mob/living/simple_mob/slime/xenobio/green,
			/mob/living/simple_mob/slime/xenobio/ruby
		)

/obj/item/slime_extract/sepia
	name = "sepia slime extract"
	icon_state = "sepia slime extract"
	description_info = "Who knows what will happen."
	slime_type = /mob/living/simple_mob/slime/xenobio/sepia

/decl/chemical_reaction/instant/slime/senseenhancer
	name = "Slime Sense Enhancer"
	id = "sepia_sh"
	result = "senseenhancer"
	required_reagents = list("phoron" = 5)
	result_amount = 30
	required = /obj/item/slime_extract/sepia

/decl/chemical_reaction/instant/slime/secertslime
	name = "Secert Slime "
	id = "sepia_swapm"
	result = "change_drug_male"
	required_reagents = list("water" = 1, "blood" = 1, "phoron" = 3)
	result_amount = 1
	required = /obj/item/slime_extract/sepia

/decl/chemical_reaction/instant/slime/secertslime/on_reaction(var/datum/reagents/holder)
	holder.my_atom.visible_message("<span class='warning'>Infused with the mixture, the core begins to quiver and grow, and soon a new baby slime emerges from it!</span>")
	new /mob/living/simple_mob/slime/xenobio/redspace(get_turf(holder.my_atom))
	..()

/decl/chemical_reaction/instant/slime/genderswapf
	name = "Slime Change F"
	id = "sepia_swapf"
	result = "change_drug_female"
	required_reagents = list("water" = 5)
	result_amount = 30
	required = /obj/item/slime_extract/sepia

/decl/chemical_reaction/instant/slime/genderswapm
	name = "Slime Change M"
	id = "sepia_swapf"
	result = "change_drug_male"
	required_reagents = list("blood" = 5)
	result_amount = 30
	required = /obj/item/slime_extract/sepia

/decl/chemical_reaction/instant/slime/sepia_new_slime
	name = "Slime Spawn"
	id = "m_sepia_spawn"
	result = null
	required_reagents = list("slimejelly" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/sepia

/decl/chemical_reaction/instant/slime/sepia_new_slime/on_reaction(var/datum/reagents/holder)
	holder.my_atom.visible_message("<span class='warning'>Infused with slime jelly, the core begins to quiver and grow, and soon a new baby slime emerges from it!</span>")
	new /mob/living/simple_mob/slime/xenobio/sepia(get_turf(holder.my_atom))
	..()



/mob/living/simple_mob/slime/xenobio/redspace
	desc = "This slime is rather unknown and strange."
	color = "#A50021"
	slime_color = "redspace"
	coretype = /obj/item/slime_extract/redspace
	reagent_injected = "mindbreaker"

	mutation_chance = 0

	slime_mutation = list(
			/mob/living/simple_mob/slime/xenobio/dark,
			/mob/living/simple_mob/slime/xenobio/redspace,
			/mob/living/simple_mob/slime/xenobio/bluespace,
			/mob/living/simple_mob/slime/xenobio/plague
		)

/obj/item/slime_extract/redspace
	name = "redspace slime extract"
	icon_state = "ruby slime extract"
	description_info = "Who knows what will happen."
	slime_type = /mob/living/simple_mob/slime/xenobio/redspace


/decl/chemical_reaction/instant/slime/redspace_fire
	name = "Slime Living Fire"
	id = "m_liquid_fire"
	result = "neoliquidfire"
	required_reagents = list("phoron" = 5)
	result_amount = 30
	required = /obj/item/slime_extract/redspace

/decl/chemical_reaction/instant/slime/soulstone
	name = "Slime Soulstone"
	id = "m_redspace_soulstone"
	required_reagents = list("blood" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/redspace

/decl/chemical_reaction/instant/slime/soulstone/on_reaction(var/datum/reagents/holder)
	new /obj/item/device/soulstone(get_turf(holder.my_atom))
	..()

/decl/chemical_reaction/instant/slime/obj/item/slime_extract/redspace_smoke
	name = "Slime Smoke"
	id = "m_redspace_smoke"
	required_reagents = list("water" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/redspace

/decl/chemical_reaction/instant/slime/redspace_smoke/on_reaction(var/datum/reagents/holder)
	var/location = get_turf(holder.my_atom)
	var/datum/effect/effect/system/smoke_spread/chem/S = new /datum/effect/effect/system/smoke_spread/chem
	S.attach(location)
	S.set_up(holder, 120, 0, location)
	playsound(location, 'sound/effects/smoke.ogg', 50, 1, -3)
	spawn(0)
		S.start()
	..()


/decl/chemical_reaction/instant/slime/slime_mindbreaker
	name = "Slime Pyrotoxin"
	id = "m_redspace_mindbreaker"
	result = "mindbreaker"
	required_reagents = list("slimejelly" = 5)
	result_amount = 30
	required = /obj/item/slime_extract/redspace


/mob/living/simple_mob/slime/xenobio/dark
	desc = "This slime is rather unknown and strange."
	color = "#080808"
	slime_color = "dark"
	coretype = /obj/item/slime_extract/dark
	reagent_injected = "potassium_chlorophoride"

	mutation_chance = 0

	slime_mutation = list(
			/mob/living/simple_mob/slime/xenobio/dark,
			/mob/living/simple_mob/slime/xenobio/redspace,
			/mob/living/simple_mob/slime/xenobio/bluespace,
			/mob/living/simple_mob/slime/xenobio/plague
		)

/obj/item/slime_extract/dark
	name = "dark slime extract"
	icon_state = "emerald slime extract"
	description_info = "A strange extract, seems inert. Maybe something strange can be done one day"
	slime_type = /mob/living/simple_mob/slime/xenobio/dark

/decl/chemical_reaction/instant/slime/dark_neofire
	name = "Slime Healing Liquid"
	id = "m_liquid_healing"
	result = "healing_nanites"
	required_reagents = list("neoliquidfire" = 5)
	result_amount = 30
	required = /obj/item/slime_extract/dark

/decl/chemical_reaction/instant/slime/dark_liquidfire
	name = "Slime Secert Guard"
	id = "m_slime_guardian"
	required_reagents = list("liquidfire" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/dark


/decl/chemical_reaction/instant/slime/dark_liquidfire/on_reaction(var/datum/reagents/holder)
	for(var/mob/living/L in range(1, holder.my_atom))
		L.add_modifier(/datum/modifier/feysight, 10 MINUTES, src)
	..()

/mob/living/simple_mob/slime/xenobio/plague
	desc = "This slime is rather unknown and strange."
	color = "#A50021"
	slime_color = "plague"
	coretype = /obj/item/slime_extract/plague

	mutation_chance = 0

	slime_mutation = list(
			/mob/living/simple_mob/slime/xenobio/dark,
			/mob/living/simple_mob/slime/xenobio/redspace,
			/mob/living/simple_mob/slime/xenobio/bluespace,
			/mob/living/simple_mob/slime/xenobio/plague
		)

/obj/item/slime_extract/plague
	name = "plague slime extract"
	icon_state = "emerald slime extract"
	description_info = "Who knows what will happen."
	slime_type = /mob/living/simple_mob/slime/xenobio/plague

/decl/chemical_reaction/instant/slime/plague_toxin
	name = "Slime Living Fire"
	id = "m_plague_toxin"
	result = "neurophage_nanites"
	required_reagents = list("phoron" = 5)
	result_amount = 30
	required = /obj/item/slime_extract/plague


/decl/chemical_reaction/instant/slime/virusdish
	name = "Virus dish"
	id = "m_plague_dish"
	required_reagents = list("blood" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/plague

/decl/chemical_reaction/instant/slime/virusdish/on_reaction(var/datum/reagents/holder)
	new /obj/item/weapon/virusdish(get_turf(holder.my_atom))
	..()

/decl/chemical_reaction/instant/slime/obj/item/slime_extract/plague_jelly
	name = "Slime Smoke"
	id = "m_slimejelly_alt"
	result = "slimejelly"
	required_reagents = list("water" = 5)
	result_amount = 30
	required = /obj/item/slime_extract/plague