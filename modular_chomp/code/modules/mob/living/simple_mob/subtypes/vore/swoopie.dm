/datum/category_item/catalogue/technology/drone/corrupt_hound/swoopie // Writing this so that they arnt corrupt hounds! -Reo
	name = "Drone - SWOOPIE XL"
	desc = "A large drone that typically wanders about maintenance or other places that are dirty, mindlessly sucking \
	up everything it deems to be debris, trash or a pest. \
	It looks like a blue and yellow long-necked bird with a large distinct black, plump belly and flexible neck that \
	bulges with every object it swoops. \
	They tend to run on extremely basic AI until proper ones are available to be downloaded from an external, \
	oddly spooky, provider. \
	<br><br>\
	The SWOOPIE's belly and neck are made of a synthetic rubber compound that is durable enough to allow them to pack \
	away even the most fiesty of pests once they make it past the synthbird's beak, and staring into that beak would allow \
	one to see far down into the drone, though the frequent curving of the SWOOPIE's neck often makes seeing down \
	the entire length next to impossible even with a cooperative unit, let alone the passive suction that threatens to \
	make anything that gets too close vanish into the drone's dangerous depths. SWOOPIE XLs are equipped with powerful \
	CHURNO-VAC digestive chambers that are able to effectively melt down most anything that gets claimed by their vac-beaks, \
	indescriminately melting anything that happens to end up in that chamber, it would be a terrible idea to allow yourself \
	get swooped by one of these drones, unless you want to add to their biofuel reserves."
	value = CATALOGUER_REWARD_MEDIUM

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie
	name = "SWOOPIE XL"
	desc = "A large birdlike robot with thick assets, plump belly, and a long elastic vacuum hose of a neck. Somehow still a cleanbot, even if just for its duties."
	description_info = "Use DISARM intent to access the integrated Vac-Pack settings.<br>Use GRAB intent while targeting the head damage zone to grab the SWOOPIE XL's neck and use it as a vaccum."
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
	player_msg = "You are a SWOOPIE XL cleaning bot! Use DISARM intent to change your integrated Vac-Pack settings, or GRAB intent to swoop stuff up! Turning off the Vac-Pack will make your grab clicks function as normal grab intent clicks."

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
		Vac.item_state = null
		Vac.vac_owner = src
		Vac.icon = 'modular_chomp/icons/mob/vacpack_swoop.dmi'

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/IIsAlly(mob/living/L)
	. = ..()
	if(!.) // Outside the faction and not in friends, are they crew
		return L?.type in crew_creatures

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return TRUE
	add_verb(src,/mob/living/proc/eat_trash) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_trash_catching) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/restrict_trasheater) //CHOMPEdit TGPanel
	var/obj/belly/B = new /obj/belly/(src)
	B.affects_vore_sprites = TRUE
	B.belly_sprite_to_affect = "stomach"
	B.name = "Churno-Vac"
	B.desc = "With an abrupt loud WHUMP after a very sucky trip through the hungry bot's vacuum tube, you finally spill out into its waste container, where everything the bot slurps off the floors ends up for swift processing among the caustic sludge, efficiently melting everything down into a thin slurry to fuel its form. More loose dirt and debris occasionally raining in from above as the bot carries on with its duties to keep the station nice and clean."
	B.digest_messages_prey = list("Under the heat and internal pressure of the greedy machine's gutworks, you can feel the tides of the hot caustic sludge claiming the last bits of space around your body, a few more squeezes of the synthetic muscles squelching and glurking as your body finally loses its form, completely blending down and merging into the tingly sludge to fuel the mean machine.")
	B.digest_mode = DM_DIGEST
	B.item_digest_mode = IM_DIGEST
	B.mode_flags = DM_FLAG_TURBOMODE | DM_FLAG_THICKBELLY //Hard to be heard from inside the swoop! Also very active belly.
	B.digest_burn = 3
	B.fancy_vore = 1
	B.vore_sound = "Stomach Move"
	B.belly_fullscreen = "VBO_trash"
	B.belly_fullscreen_color = "#555B34"
	B.sound_volume = 25
	B.count_items_for_sprite = TRUE

	B = new /obj/belly/longneck(src)
	B.affects_vore_sprites = FALSE
	B.name = "Vac-Beak"
	B.desc = "SNAP! You have been sucked up into the big synthbird's beak, the powerful vacuum within the bird roaring somewhere beyond the abyssal deep gullet hungrily gaping before you, eagerly sucking you deeper inside towards a long bulgy ride down the bird's vacuum hose of a neck!"
	B.entrance_logs = TRUE //Exept for the maw. I think that's reasonable. -Reo
	B.autotransferlocation = "vacuum hose"
	B.autotransfer_max_amount = 0
	B.autotransferwait = 60
	B.belly_fullscreen_color2 = "#1C1C1C"
	B.belly_fullscreen_color3 = "#292929"
	B.belly_fullscreen_color4 = "#CCFFFF"
	B.belly_fullscreen = "VBO_maw8" //Swoopies have beaks!!

	vore_selected = B

	B = new /obj/belly/longneck(src)
	B.affects_vore_sprites = TRUE
	B.belly_sprite_to_affect = "neck1"
	B.name = "vacuum hose"
	B.autotransferlocation = "vacuum hose 2"
	B.fancy_vore = 1
	B.vore_sound = "Stomach Move"
	B.sound_volume = 100

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
	B.belly_sprite_to_affect = "neck3"
	B.name = "vacuum hose 3"
	B.autotransferlocation = "vacuum hose 4"
	B.desc = "Looks like it's gonna be all downhill from here..."
	B.fancy_vore = 1
	B.vore_sound = "Stomach Move"
	B.sound_volume = 40

	B = new /obj/belly/longneck(src)
	B.affects_vore_sprites = TRUE
	B.belly_sprite_to_affect = "neck4"
	B.name = "vacuum hose 4"
	B.autotransferlocation = "Churno-Vac"
	B.desc = "Thank you for your biofuel contribution~"
	B.fancy_vore = 1
	B.vore_sound = "Stomach Move"
	B.sound_volume = 20

/obj/belly/longneck
	affects_vore_sprites = TRUE
	belly_sprite_to_affect = "neck1"
	name = "vacuum hose"
	desc = "With a mighty WHUMP, the suction of the big bird's ravenous vacuum system has sucked you up out of the embrace of its voracious main beak and into a tight bulge squeezing along the long ribbed rubbery tube leading towards the roaring doom of the synthetic bird's efficient waste disposal system."
	digest_mode = DM_HOLD
	item_digest_mode = IM_HOLD
	contaminates = FALSE //Stuff doesnt get messy in the throat, the bird's gut is the messy place!
	entrance_logs = FALSE //QOL to stop spam when stuff is getting gulped down~
	autotransfer_enabled = TRUE
	autotransferchance = 100
	autotransferwait = 60
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
	//speedy_mob_processing = TRUE
	mode_flags = DM_FLAG_TURBOMODE

	size_factor_for_sprite = 5

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/Life()
	. =..()
	var/turf/T = get_turf(src)
	if(istype(Vac))
		if(Vac.loc != src)
			var/turf/VT = get_turf(Vac)
			if(!T.Adjacent(VT) || isturf(Vac.loc))
				if(isliving(Vac.loc))
					var/mob/living/L = Vac.loc
					L.remove_from_mob(Vac, src)
				else
					Vac.forceMove(src)
		if(!Vac.output_dest)
			if(isbelly(vore_selected))
				Vac.output_dest = vore_selected
	if(!istype(T) || !istype(Vac) || !has_AI() || Vac.loc != src || stat)
		return
	if(istype(T, /turf/simulated))
		var/turf/simulated/S = T
		if(S.dirt > 50)
			Vac.afterattack(S, src, 1)
			return
	for(var/obj/O in T)
		if(is_type_in_list(O, edible_trash) && !O.anchored)
			Vac.afterattack(T, src, 1)
			return
	for(var/mob/living/L in T)
		if(!L.anchored && L.devourable && !L == src && !L.buckled && L.can_be_drop_prey)
			Vac.afterattack(L, src, 1)
			return

/datum/say_list/swoopie
	speak = list("Scanning for debris...", "Scanning for dirt...", "Scanning for pests...", "Squawk!")
	emote_hear = list("squawks!", "whirrs idly.", "revs up its vacuum.")
	emote_see = list("twitches.", "sways.", "stretches its neck.", "stomps idly.")
	say_maybe_target = list("Pest detected?")
	say_got_target = list("PEST DETECTED!")

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/ClickOn(var/atom/A, var/params)
	var/list/modifiers = params2list(params)
	if(modifiers["shift"] || modifiers["ctrl"] || modifiers["middle"] || modifiers["alt"])
		return ..()
	if(stat) //Cant suck if we're not able to...
		return ..()
	if(istype(Vac) && A.Adjacent(src))
		face_atom(A)
		if(src.a_intent == I_DISARM && A == src) //Only if on disarm intent.
			Vac.attack_self(src)
			return
		if(istype(A, /obj/machinery/disposal)) //Dont put the nossle in the trash
			return
		if(src.a_intent == I_GRAB && Vac.vac_power != 0) //Only on grab intent. if someone needs to use grab intent they can just turn off the vac
			var/resolved = Vac.resolve_attackby(A, src, click_parameters = params)
			if(!resolved && A && Vac)
				Vac.afterattack(A, src, 1, params)
				return
	. = ..()

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/attack_hand(mob/living/L)
	if(stat) //Make sure we're alive
		return ..()
	if(L.a_intent == I_DISARM && Vac)
		Vac.attack_self(L)
		return
	if(L.a_intent == I_GRAB && Vac && Vac.loc == src)
		if(L.zone_sel.selecting == BP_HEAD)
			if(L.put_in_active_hand(Vac))
				L.visible_message("<span class='warning'>[L] grabs [src] by the neck, brandishing the thing like a regular vacuum cleaner!</span>")
				L.start_pulling(src)
				return
	. = ..()

/mob/living/simple_mob/vore/aggressive/corrupthound/swoopie/verb/borrow_vac()
	set name = "Borrow Vac-Pack"
	set desc = "Allows adjacent user to borrow Swoopie's Vac-Pack"
	set category = "Object"
	set src in oview(1)
	if(istype(Vac))
		if(usr != src)
			usr.put_in_active_hand(Vac)
		else
			var/mob/living/L = input("Borrow Vac-Pack for") as null| mob in view(1,usr.loc)
			if(!L || L == usr)
				return
			L.put_in_active_hand(Vac)
