/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie
	name = "SWOOPIE XL"
	desc = "A large birdlike robot with thick assets, plump belly, and a long elastic vacuum hose of a neck. Somehow still a cleanbot, even if just for its duties. Use DISARM intent to access Vac-Pack settings."
	icon_state = "swoopie"
	icon_living = "swoopie"
	icon_dead = "swoopie_dead"
	icon_rest = "swoopie_rest"
	icon = 'modular_chomp/icons/mob/vore64x64_ch.dmi'
	vis_height = 64
	has_eye_glow = TRUE
	custom_eye_color = "#00CC00"
	mount_offset_y = 30
	vore_capacity_ex = list("stomach" = 1, "neck1" = 1, "neck2" = 1, "neck3" = 1, "neck4" = 1)
	vore_fullness_ex = list("stomach" = 0, "neck1" = 0, "neck2" = 0, "neck3" = 0, "neck4" = 0)
	vore_icon_bellies = list("stomach", "neck1", "neck2", "neck3", "neck4")
	vore_icons = 0
	vore_pounce_chance = 100
	vore_pounce_maxhealth = 200
	has_hands = TRUE
	adminbus_trash = TRUE //You know what, sure whatever. It's not like anyone's gonna be taking this bird on unga trips to be their gamer backpack, which kinda was the main reason for the trash eater restrictions in the first place anyway.
	faction = "neutral"
	say_list_type = /datum/say_list/swoopie
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate
	mob_bump_flag = 0
	var/static/list/crew_creatures = list(	/mob/living/simple_mob/protean_blob,
											/mob/living/simple_mob/slime/promethean)
	var/obj/item/device/vac_attachment/Vac

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/Initialize()
	. = ..()
	if(!voremob_loaded)
		voremob_loaded = TRUE
		init_vore()
	Vac = new /obj/item/device/vac_attachment(src)
	if(istype(Vac))
		Vac.output_dest = vore_selected
		Vac.vac_power = 3

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/IIsAlly(mob/living/L)
	. = ..()
	if(!.) // Outside the faction and not in friends, are they crew
		return L?.type in crew_creatures

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return TRUE
	verbs |= /mob/living/proc/eat_trash
	verbs |= /mob/living/proc/toggle_trash_catching
	verbs |= /mob/living/proc/restrict_trasheater
	var/obj/belly/B = new /obj/belly/(src)
	B.affects_vore_sprites = TRUE
	B.belly_sprite_to_affect = "stomach"
	B.name = "Churno-Vac"
	B.desc = "With an abrupt loud WHUMP after a very sucky trip through the hungry bot's vacuum tube, you finally spill out into its waste container, where everything the bot slurps off the floors ends up for swift processing among the caustic sludge, efficiently melting everything down into a thin slurry to fuel its form. More loose dirt and debris occasionally raining in from above as the bot carries on with its duties to keep the station nice and clean."
	B.digest_messages_prey = list("Under the heat and internal pressure of the greedy machine's gutworks, you can feel the tides of the hot caustic sludge claiming the last bits of space around your body, a few more squeezes of the synthetic muscles squelching and glurking as your body finally loses its form, completely blending down and merging into the tingly sludge to fuel the mean machine.")
	B.digest_mode = DM_DIGEST
	B.item_digest_mode = IM_DIGEST
	B.digest_burn = 3
	B.fancy_vore = 1
	B.vore_sound = "Stomach Move"
	B.belly_fullscreen = "VBO_trash"
	B.belly_fullscreen_color = "#555B34"
	B.sound_volume = 25
	B.count_items_for_sprite = TRUE

	B = new /obj/belly/longneck(src)
	B.affects_vore_sprites = TRUE
	B.belly_sprite_to_affect = "neck4"
	B.name = "vacuum hose 4"
	B.autotransferlocation = "Churno-Vac"
	B.desc = "Thank you for your biofuel contribution~"
	B.fancy_vore = 1
	B.vore_sound = "Stomach Move"
	B.sound_volume = 20

	B = new /obj/belly/longneck(src)
	B.affects_vore_sprites = TRUE
	B.belly_sprite_to_affect = "neck3"
	B.name = "vacuum hose 3"
	B.autotransferlocation = "vacuum hose 4"
	B.desc = "Looks like it's gonna be all downhill from here..."
	B.fancy_vore = 1
	B.vore_sound = "Stomach Move"
	B.sound_volume = 40

	B = new /obj/belly/longneck(src)
	B.affects_vore_sprites = TRUE
	B.belly_sprite_to_affect = "neck2"
	B.name = "vacuum hose 2"
	B.autotransferlocation = "vacuum hose 3"
	B.desc = "It feels very tight in here..."
	B.fancy_vore = 1
	B.vore_sound = "Stomach Move"
	B.sound_volume = 80

	B = new /obj/belly/longneck(src)
	B.affects_vore_sprites = TRUE
	B.belly_sprite_to_affect = "neck1"
	B.name = "vacuum hose"
	B.autotransferlocation = "vacuum hose 2"
	B.fancy_vore = 1
	B.vore_sound = "Stomach Move"
	B.sound_volume = 100

	B = new /obj/belly/longneck(src)
	B.affects_vore_sprites = FALSE
	B.name = "Vac-Beak"
	B.desc = "SNAP! You have been sucked up into the big synthbird's beak, the powerful vacuum within the bird roaring somewhere beyond the abyssal deep gullet hungrily gaping before you, eagerly sucking you deeper inside towards a long bulgy ride down the bird's vacuum hose of a neck!"
	B.autotransferlocation = "vacuum hose"
	B.autotransfer_max_amount = 0
	B.autotransferwait = 60

	vore_selected = B

/obj/belly/longneck
	affects_vore_sprites = TRUE
	belly_sprite_to_affect = "neck1"
	name = "vacuum hose"
	desc = "With a mighty WHUMP, the suction of the big bird's ravenous vacuum system has sucked you up out of the embrace of its voracious main beak and into a tight bulge squeezing along the long ribbed rubbery tube leading towards the roaring doom of the synthetic bird's efficient waste disposal system."
	digest_mode = DM_HOLD
	item_digest_mode = IM_HOLD
	autotransfer_enabled = TRUE
	autotransferchance = 100
	autotransferwait = 70
	autotransferlocation = "Churno-Vac"
	vore_verb = "suck"
	belly_fullscreen_color = "#4d4d4d"
	belly_fullscreen = "a_tumby"
	human_prey_swallow_time = 1
	nonhuman_prey_swallow_time = 1
	autotransfer_max_amount = 2
	count_items_for_sprite = TRUE
	item_multiplier = 10
	health_impacts_size = FALSE
	speedy_mob_processing = TRUE
	size_factor_for_sprite = 5

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/Life()
	. =..()
	var/turf/T = get_turf(src)
	if(istype(T) && istype(Vac) && has_AI())
		if(istype(T, /turf/simulated))
			var/turf/simulated/S = T
			if(S.dirt > 10)
				Vac.afterattack(S, src, 1)
				return
		for(var/obj/O in T)
			if(is_type_in_list(O, edible_trash) && !O.anchored)
				Vac.afterattack(T, src, 1)
				return
		for(var/mob/living/L in T)
			if(!L.anchored || L.devourable || !L == src || !L.buckled || L.can_be_drop_prey)
				Vac.afterattack(L, src, 1)
				return

/datum/say_list/swoopie
	speak = list("Scanning for debris...", "Scanning for dirt...", "Scanning for pests...", "Squawk!")
	emote_hear = list("squawks!", "whirrs idly.", "revs up its vacuum.")
	emote_see = list("twitches.", "sways.", "stretches its neck.", "stomps idly.")
	say_maybe_target = list("Pest detected?")
	say_got_target = list("PEST DETECTED!")

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/ClickOn(var/atom/A, var/params)
	if(istype(Vac) && A.Adjacent(src))
		face_atom(A)
		if(A == src)
			Vac.attack_self(src)
			return
		if(Vac.vac_power != 0)
			var/resolved = Vac.resolve_attackby(A, src, click_parameters = params)
			if(!resolved && A && Vac)
				Vac.afterattack(A, src, 1, params)
				return
	. = ..()

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/attack_hand(mob/living/L)
	if(L.a_intent == I_DISARM && Vac)
		Vac.attack_self(L)
		return
	. = ..()
