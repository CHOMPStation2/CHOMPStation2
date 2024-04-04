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
	result = "change_secert"
	required_reagents = list("blood" = 5, "water" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/sepia

/decl/chemical_reaction/instant/slime/secertslime/on_reaction(var/datum/reagents/holder)
	holder.my_atom.visible_message("<span class='warning'>Infused with the mixture, the core begins to quiver and grow, and soon a new baby slime emerges from it!</span>")
	new /mob/living/simple_mob/slime/xenobio/redspace(get_turf(holder.my_atom))
	..()

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
			/mob/living/simple_mob/slime/xenobio/dream,
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
			/mob/living/simple_mob/slime/xenobio/dream,
			/mob/living/simple_mob/slime/xenobio/plague
		)

/obj/item/slime_extract/dark
	name = "dark slime extract"
	icon_state = "oil slime extract"
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

/decl/chemical_reaction/instant/slime/dark_deathblood
	name = "Slime Secert Painite"
	id = "m_slime_painite"
	required_reagents = list("deathblood" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/dark

/decl/chemical_reaction/instant/slime/dark_deathblood/on_reaction(var/datum/reagents/holder)
	new /obj/item/stack/material/painite(get_turf(holder.my_atom))
	..()

/decl/chemical_reaction/instant/slime/dark_liquidlife
	name = "Slime Secert Overcharge"
	id = "m_slime_darkspeed"
	required_reagents = list("liquidlife" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/dark

/decl/chemical_reaction/instant/slime/dark_liquidfire/on_reaction(var/datum/reagents/holder)
	for(var/mob/living/L in range(49, holder.my_atom))
		L.add_modifier(/datum/modifier/sprinting, 5 MINUTES, src)
	..()


/decl/chemical_reaction/instant/slime/dark_carpotoxin
	name = "Slime Dark Secert "
	id = "m_fish_slime"
	required_reagents = list("carpotoxin" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/dark

/decl/chemical_reaction/instant/slime/dark_carpotoxin/on_reaction(var/datum/reagents/holder)
	holder.my_atom.visible_message("<span class='warning'>Infused with slime jelly, the core begins to quiver and grow, and soon a new baby slime emerges from it!</span>")
	new /mob/living/simple_mob/slime/xenobio/oceanic(get_turf(holder.my_atom))
	..()

/decl/chemical_reaction/instant/slime/dark_spidertoxin
	name = "Slime Secert Dark Spooder"
	id = "m_slime_darkspooder"
	required_reagents = list("spidertoxin" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/dark

/decl/chemical_reaction/instant/slime/dark_deathblood/on_reaction(var/datum/reagents/holder)
	new /obj/effect/spider/eggcluster/royal/space(get_turf(holder.my_atom))
	..()

/decl/chemical_reaction/instant/slime/dark_blood
	name = "Slime Secert Void Opal"
	id = "m_slime_voidopal"
	required_reagents = list("blood" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/dark

/decl/chemical_reaction/instant/slime/dark_blood/on_reaction(var/datum/reagents/holder)
	new /obj/item/stack/material/void_opal(get_turf(holder.my_atom))
	..()

/mob/living/simple_mob/slime/xenobio/plague
	desc = "This slime is rather unknown and strange."
	color = "#336600"
	slime_color = "plague"
	coretype = /obj/item/slime_extract/plague

	mutation_chance = 0

	slime_mutation = list(
			/mob/living/simple_mob/slime/xenobio/dark,
			/mob/living/simple_mob/slime/xenobio/redspace,
			/mob/living/simple_mob/slime/xenobio/dream,
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


/mob/living/simple_mob/slime/xenobio/oceanic
	desc = "This slime is rather unknown and strange."
	color = "#006666"
	slime_color = "oceanic"
	coretype = /obj/item/slime_extract/oceanic
	rainbow_core_candidate = FALSE //For health and safety
	mutation_chance = 0

	reagent_injected = "carpotoxin"

	slime_mutation = list(
			/mob/living/simple_mob/slime/xenobio/sepia,
			/mob/living/simple_mob/slime/xenobio/sepia,
			/mob/living/simple_mob/slime/xenobio/sepia,
			/mob/living/simple_mob/slime/xenobio/oceanic
		)
	water_resist = 10 //I heard putting this higher makes them heal.


/mob/living/simple_mob/slime/xenobio/oceanic/handle_special()
	if(stat != DEAD)
		ocean_aura()
	..()

/mob/living/simple_mob/slime/xenobio/oceanic/proc/ocean_aura()
	for(var/mob/living/L in view(src, 4))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/aura/slime_healingtide, null, src)

/datum/modifier/aura/slime_healingtide
	name = "Aura Healing Tide"
	desc = "You are filled with an overwhelming energy."

	on_created_text = "<span class='critical'>Your body begins to focus on recovering!</span>"
	on_expired_text = "<span class='notice'>The healing subsides.</span>"
	stacks = MODIFIER_STACK_FORBID
	aura_max_distance = 4

	metabolism_percent = 0.5
	incoming_healing_percent = 1.15 //The negative hurts less in this form

/obj/item/slime_extract/oceanic
	name = "oceanic slime extract"
	icon_state = "blue slime extract"
	description_info = "Who knows what will happen."
	slime_type = /mob/living/simple_mob/slime/xenobio/oceanic

/decl/chemical_reaction/instant/slime/carpfren
	name = "Carp Friend"
	id = "m_carp_friends"
	required_reagents = list("blood" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/oceanic

/decl/chemical_reaction/instant/slime/carpfren/on_reaction(var/datum/reagents/holder)
	new /mob/living/simple_mob/animal/space/carp/station(get_turf(holder.my_atom))
	..()

/decl/chemical_reaction/instant/slime/oceancarp
	name = "Slime Carptoxi"
	id = "m_slime_carptox"
	required_reagents = list("slimejelly" = 5)
	result = "carpotoxin"
	result_amount = 30
	required = /obj/item/slime_extract/oceanic

/decl/chemical_reaction/instant/slime/waterdupe
	name = "Water Duplication"
	id = "m_slime_water"
	required_reagents = list("water" = 5)
	result = "water"
	result_amount = 30
	required = /obj/item/slime_extract/oceanic

/decl/chemical_reaction/instant/slime/oceanboon
	name = "Carp Boon"
	id = "m_carp_boon"
	required_reagents = list("phoron" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/oceanic

/decl/chemical_reaction/instant/slime/oceanboon/on_reaction(var/datum/reagents/holder)
	for(var/mob/living/L in range(21, holder.my_atom))
		L.add_modifier(/datum/modifier/healingtide, 10 MINUTES, src)
	..()

/decl/chemical_reaction/instant/slime/warplague
	name = "Nuclear Slime Summon"
	id = "m_nuclear_slime"
	required_reagents = list("mindbreaker" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/plague

/decl/chemical_reaction/instant/slime/warplague/on_reaction(var/datum/reagents/holder)
	holder.my_atom.visible_message("<span class='warning'>Infused with slime jelly, the core begins to quiver and grow, and soon a new baby slime emerges from it!</span>")
	new /mob/living/simple_mob/slime/xenobio/nuclear(get_turf(holder.my_atom))
	..()

/mob/living/simple_mob/slime/xenobio/nuclear
	desc = "This slime is rather unknown and strange."
	color = "#006600"
	slime_color = "nuclear"
	coretype = /obj/item/slime_extract/nuclear

	rainbow_core_candidate = FALSE //For health and safety

	slime_mutation = list(
		/mob/living/simple_mob/slime/xenobio/sepia,
		/mob/living/simple_mob/slime/xenobio/sepia,
		/mob/living/simple_mob/slime/xenobio/sepia,
		/mob/living/simple_mob/slime/xenobio/nuclear
		)

/mob/living/simple_mob/slime/xenobio/nuclear/handle_special()
	if(stat != DEAD)
		nuclear_aura()
	..()

/mob/living/simple_mob/slime/xenobio/nuclear/proc/nuclear_aura()
	for(var/mob/living/L in view(src, 4))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/aura/radiationhide, null, src)

/datum/modifier/aura/radiationhide
	name = "Radiation Hide"
	desc = "Your body defensivly warps."

	on_created_text = "<span class='critical'>Your body strangly mutates!</span>"
	on_expired_text = "<span class='notice'>Your body returns to normal.</span>"
	stacks = MODIFIER_STACK_FORBID
	aura_max_distance = 4

	icon_scale_x_percent = 1.2
	icon_scale_y_percent = 1.2
	incoming_clone_damage_percent = 0
	incoming_healing_percent = 0.5
	incoming_damage_percent = 0.8

/obj/item/slime_extract/nuclear
	name = "nuclear slime extract"
	icon_state = "green slime extract"
	description_info = "Who knows what will happen."
	slime_type = /mob/living/simple_mob/slime/xenobio/nuclear

/decl/chemical_reaction/instant/slime/nuclear_radpulse
	name = "Slime Radiation Pulse"
	id = "m_green_radpulse"
	required_reagents = list("phoron" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/nuclear

/decl/chemical_reaction/instant/slime/nuclear_radpulse/on_reaction(var/datum/reagents/holder)
	log_and_message_admins("Green extract reaction (radiation pulse) has been activated in [get_area(holder.my_atom)].  Last fingerprints: [holder.my_atom.fingerprintslast]")
	playsound(holder.my_atom, 'sound/effects/phasein.ogg', 75, 1)
	holder.my_atom.visible_message("<span class='danger'>\The [holder.my_atom] begins to vibrate violently!</span>")
	spawn(5 SECONDS)
		SSradiation.flat_radiate(src, 30, 7, TRUE)
	..()


/decl/chemical_reaction/instant/slime/nuclear_emitter
	name = "Slime Radiation Emitter"
	id = "m_green_emitter"
	required_reagents = list("blood" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/green

/decl/chemical_reaction/instant/slime/green_emitter/on_reaction(var/datum/reagents/holder)
	log_and_message_admins("Green extract reaction (radiation emitter) has been activated in [get_area(holder.my_atom)].  Last fingerprints: [holder.my_atom.fingerprintslast]")
	new /obj/item/slime_irradiator(get_turf(holder.my_atom))
	..()


/decl/chemical_reaction/instant/slime/nuclear_radium
	name = "Slime Radium"
	id = "m_green_radium"
	result = "radium"
	required_reagents = list("water" = 5)
	result_amount = 30
	required = /obj/item/slime_extract/green


/decl/chemical_reaction/instant/slime/nuclear_uranium
	name = "Slime Uranium"
	id = "m_green_uranium"
	required_reagents = list("slimejelly" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/green

/decl/chemical_reaction/instant/slime/nuclear_uranium/on_reaction(var/datum/reagents/holder)
	new /obj/item/stack/material/uranium(get_turf(holder.my_atom), 10)
	..()


/mob/living/simple_mob/slime/xenobio/dream
	desc = "This slime is rather unknown and strange."
	color = "#FFFFFF"
	slime_color = "dream"
	coretype = /obj/item/slime_extract/dream

	slime_mutation = list(
			/mob/living/simple_mob/slime/xenobio/dark,
			/mob/living/simple_mob/slime/xenobio/redspace,
			/mob/living/simple_mob/slime/xenobio/dream,
			/mob/living/simple_mob/slime/xenobio/plague
		)

/obj/item/slime_extract/dream
	name = "dream slime extract"
	icon_state = "grey slime extract"
	description_info = "Who knows what will happen."
	slime_type = /mob/living/simple_mob/slime/xenobio/dream

/decl/chemical_reaction/instant/slime/dreamscale
	name = "dream scale creation "
	id = "m_dreamscale_slime"
	required_reagents = list("water" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/dream

/decl/chemical_reaction/instant/slime/dreamscale/on_reaction(var/datum/reagents/holder)
	new /obj/item/stack/material/uranium(get_turf(holder.my_atom), 10)
	..()

/decl/chemical_reaction/instant/slime/nightmareslime
	name = "Nightmare Slime Summon "
	id = "m_nightmare_slime"
	required_reagents = list("blood" = 5, "phoron" = 5, "slimejelly" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/dream

/decl/chemical_reaction/instant/slime/nightmareslime/on_reaction(var/datum/reagents/holder)
	holder.my_atom.visible_message("<span class='warning'>Infused with slime jelly, the core begins to quiver and grow, and soon a new baby slime emerges from it!</span>")
	new /mob/living/simple_mob/slime/xenobio/nightmare(get_turf(holder.my_atom))
	..()

/mob/living/simple_mob/slime/xenobio/nightmare
	desc = "This slime is rather unknown and strange."
	color = "#993366"
	slime_color = "nightmare"
	coretype = /obj/item/slime_extract/nightmare

	rainbow_core_candidate = FALSE //For health and safety

	slime_mutation = list(
			/mob/living/simple_mob/slime/xenobio/nightmare,
			/mob/living/simple_mob/slime/xenobio/nightmare,
			/mob/living/simple_mob/slime/xenobio/nightmare,
			/mob/living/simple_mob/slime/xenobio/nightmare
		)


/mob/living/simple_mob/slime/xenobio/nightmare/handle_special()
	if(stat != DEAD)
		nightmare_aura()
	..()

/mob/living/simple_mob/slime/xenobio/nightmare/proc/nightmare_aura()
	for(var/mob/living/carbon/L in view(src, 3))
		if(L.stat == DEAD)
			continue
		L.add_modifier(/datum/modifier/doomed, null, src)
		L.add_modifier(/datum/modifier/dreamarmor, null, src)

/datum/modifier/dreamarmor
	name = "dream armor"
	desc = "You are highly resistant to damage."
	stacks = MODIFIER_STACK_FORBID

	mob_overlay_state = "cult_aura"
	incoming_damage_percent = 0.3

/obj/item/slime_extract/nightmare
	name = "nightmare slime extract"
	icon_state = "oil slime extract"
	description_info = "Who knows what will happen."
	slime_type = /mob/living/simple_mob/slime/xenobio/nightmare

/decl/chemical_reaction/instant/slime/nightmarewater
	name = "nightmare water"
	id = "m_nightmare_water"
	required_reagents = list("water" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/nightmare

/decl/chemical_reaction/instant/slime/nightmarewater/on_reaction(var/datum/reagents/holder)
	for(var/mob/living/L in range(3, holder.my_atom))
		L.add_modifier(/datum/modifier/faraday, 1 MINUTES, src)
		L.add_modifier(/datum/modifier/blastshield, 1 MINUTES, src)
	..()

/decl/chemical_reaction/instant/slime/nightmarejelly
	name = "nightmare jelly"
	id = "m_nightmare_jelly"
	required_reagents = list("slimejelly" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/nightmare

/decl/chemical_reaction/instant/slime/nightmarejelly/on_reaction(var/datum/reagents/holder)
	for(var/mob/living/L in range(14, holder.my_atom))
		L.add_modifier(/datum/modifier/poisoned/strong, 3 MINUTES, src)
	..()

/decl/chemical_reaction/instant/slime/nightmareblood
	name = "nightmare blood"
	id = "m_nightmare_blood"
	required_reagents = list("blood" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/nightmare

/decl/chemical_reaction/instant/slime/nightmareblood/on_reaction(var/datum/reagents/holder)
	new /obj/item/stack/material/valhollide(get_turf(holder.my_atom), 5)
	..()

/decl/chemical_reaction/instant/slime/nightmarephoron
	name = "nightmare phoron"
	id = "m_nightmare_phoron"
	required_reagents = list("phoron" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/nightmare

/decl/chemical_reaction/instant/slime/nightmarephoron/on_reaction(var/datum/reagents/holder)
	for(var/mob/living/L in range(14, holder.my_atom))
		L.add_modifier(/datum/modifier/berserk_exhaustion, 1 MINUTES, src)
	..()




/decl/chemical_reaction/instant/slime/redspace_sound
	name = "Slime Sound Creation"
	id = "m_make_sound"
	required_reagents = list("mindbreaker" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/redspace

/decl/chemical_reaction/instant/slime/redspace_sound/on_reaction(var/datum/reagents/holder)
	holder.my_atom.visible_message("<span class='warning'>Infused with the mixture, the core begins to quiver and grow, and soon a new baby slime emerges from it!</span>")
	new /mob/living/simple_mob/slime/xenobio/sound(get_turf(holder.my_atom))
	..()

/mob/living/simple_mob/slime/xenobio/sound
	desc = "This slime is rather unknown and strange."
	color = "#808080"
	slime_color = "sound"
	coretype = /obj/item/slime_extract/sound

	rainbow_core_candidate = FALSE //For health and safety

	slime_mutation = list(
			/mob/living/simple_mob/slime/xenobio/redspace,
			/mob/living/simple_mob/slime/xenobio/dream,
			/mob/living/simple_mob/slime/xenobio/plague,
			/mob/living/simple_mob/slime/xenobio/sound
		)

/mob/living/simple_mob/slime/xenobio/sound/handle_special()
	if(stat != DEAD)
		sound_aura()
	..()

/mob/living/simple_mob/slime/xenobio/sound/proc/sound_aura()
	for(var/mob/living/L in view(src, 4))
		if(L.stat == DEAD || !IIsAlly(L))
			continue
		L.add_modifier(/datum/modifier/aura/soothingsong, null, src)

/datum/modifier/aura/soothingsong
	name = "Soothing Song"
	desc = "Your body is soothed."

	on_created_text = "<span class='critical'>Your mind is put to rest!</span>"
	on_expired_text = "<span class='notice'>Your mind functions normally.</span>"
	stacks = MODIFIER_STACK_FORBID
	aura_max_distance = 4

	disable_duration_percent = 0.7
	incoming_hal_damage_percent = 0.8

/obj/item/slime_extract/sound
	name = "sound slime extract"
	icon_state = "silver slime extract"
	description_info = "Who knows what will happen."
	slime_type = /mob/living/simple_mob/slime/xenobio/sound

/decl/chemical_reaction/instant/slime/soundblood
	name = "sound blood"
	id = "m_sound_blood"
	required_reagents = list("blood" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/sound

/decl/chemical_reaction/instant/slime/soundblood/on_reaction(var/datum/reagents/holder)
	new /obj/item/stack/material/quartz(get_turf(holder.my_atom), 5)
	..()

/decl/chemical_reaction/instant/slime/soundphoron
	name = "sound blood"
	id = "m_sound_blood"
	required_reagents = list("phoron" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/sound

/decl/chemical_reaction/instant/slime/soundphoron/on_reaction(var/datum/reagents/holder)
	for(var/mob/living/L in range(1, holder.my_atom))
		L.add_modifier(/datum/modifier/aura/soothingsong, 10 MINUTES, src)
	..()

/decl/chemical_reaction/instant/slime/soundwater
	name = "sound water"
	id = "m_sound_water"
	required_reagents = list("water" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/sound

/decl/chemical_reaction/instant/slime/soundwater/on_reaction(var/datum/reagents/holder)
	holder.my_atom.visible_message("<span class='warning'>Infused with the mixture, the core begins to quiver and grow, and soon a new baby slime emerges from it!</span>")
	new /mob/living/simple_mob/slime/xenobio/sound(get_turf(holder.my_atom))
	..()

/decl/chemical_reaction/instant/slime/soundjelly
	name = "sound slimejelly"
	id = "m_sound_slimejelly"
	required_reagents = list("slimejelly" = 5)
	result_amount = 1
	required = /obj/item/slime_extract/sound

/decl/chemical_reaction/instant/slime/soundjelly/on_reaction(var/datum/reagents/holder)
	new /obj/item/stack/material/glass/plastitanium(get_turf(holder.my_atom), 5)
	..()
