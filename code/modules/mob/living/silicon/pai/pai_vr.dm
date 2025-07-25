/mob/living/silicon/pai
	icon = 'icons/mob/pai_vr.dmi'
	softfall = TRUE
	var/eye_glow = TRUE
	var/hide_glow = FALSE
	var/image/eye_layer = null		// Holds the eye overlay.
	var/eye_color = "#00ff0d"
	var/icon/holo_icon
	var/icon/holo_icon_north
	var/holo_icon_dimension_X = 32
	var/holo_icon_dimension_Y = 32
	//These vars keep track of whether you have the related software, used for easily updating the UI
	var/soft_ut = FALSE	//universal translator
	var/soft_mr = FALSE	//medical records
	var/soft_sr = FALSE	//security records
	var/soft_dj = FALSE	//door jack
	var/soft_as = FALSE	//atmosphere sensor
	var/soft_si = FALSE	//signaler
	var/soft_ar = FALSE	//ar hud

	vore_capacity = 1
	vore_capacity_ex = list("stomach" = 1)

/mob/living/silicon/pai/Initialize(mapload)
	. = ..()

	add_verb(src, /mob/proc/dominate_predator)
	add_verb(src, /mob/living/proc/dominate_prey)
	add_verb(src, /mob/living/proc/set_size)
	add_verb(src, /mob/living/proc/shred_limb)

/mob/living/silicon/pai/Login()
	. = ..()
	if(!holo_icon)
		last_special = world.time + 100		//Let's give get_character_icon time to work
		get_character_icon()
	if(stat == DEAD)
		healths.icon_state = "health7"

/mob/living/silicon/pai/proc/full_restore()
	adjustBruteLoss(- bruteloss)
	adjustFireLoss(- fireloss)
	do_after(src, 1 SECONDS)
	card.setEmotion(16)
	stat = CONSCIOUS
	do_after(src, 5 SECONDS)
	var/mob/observer/dead/ghost = src.get_ghost()
	if(ghost)
		ghost.notify_revive("Someone is trying to revive you. Re-enter your body if you want to be revived!", 'sound/effects/pai-restore.ogg', source = card)
	canmove = TRUE
	card.setEmotion(15)
	playsound(card, 'sound/effects/pai-restore.ogg', 50, FALSE)
	card.visible_message(span_filter_notice("\The [card] chimes."), runemessage = "chime")

/mob/living/silicon/pai/proc/pai_nom(var/mob/living/T in oview(1))
	set name = "pAI Nom"
	set category = "Abilities.pAI Commands"
	set desc = "Allows you to eat someone while unfolded. Can't be used while in card form."

	if (stat != CONSCIOUS)
		return
	return feed_grabbed_to_self(src,T)

/mob/living/silicon/pai/update_icon() //Some functions cause this to occur, such as resting
	..()
	if(chassis == "13")
		icon = holo_icon
		add_eyes()
		return

	update_fullness()

	//Add a check when selecting a chassis if you add in support for this, to set vore_capacity to 2 or however many states you have.
	var/fullness_extension = ""
	if(vore_capacity > 1 && vore_fullness > 1)
		fullness_extension = "_[vore_fullness]"

	if(!vore_fullness && !resting)
		icon_state = "[chassis]" //Using icon_state here resulted in quite a few bugs. Chassis is much less buggy.
	else if(!vore_fullness && resting)
		icon_state = "[chassis]_rest"

	// Unfortunately not all these states exist, ugh.
	else if(vore_fullness && !resting)
		if("[chassis]_full[fullness_extension]" in cached_icon_states(icon))
			icon_state = "[chassis]_full[fullness_extension]"
		else
			icon_state = "[chassis]"
	else if(vore_fullness && resting)
		if("[chassis]_rest_full[fullness_extension]" in cached_icon_states(icon))
			icon_state = "[chassis]_rest_full[fullness_extension]"
		else
			icon_state = "[chassis]_rest"
	if(chassis in GLOB.wide_chassis)
		pixel_x = -16
		default_pixel_x = -16
	else
		pixel_x = 0
		default_pixel_x = 0
	add_eyes()

/mob/living/silicon/pai/update_icons() //And other functions cause this to occur, such as digesting someone.
	..()
	if(chassis == "13")
		icon = holo_icon
		add_eyes()
		return
	update_fullness()
	//Add a check when selecting a chassis if you add in support for this, to set vore_capacity to 2 or however many states you have.
	var/fullness_extension = ""
	if(vore_capacity > 1 && vore_fullness > 1)
		fullness_extension = "_[vore_fullness]"
	if(!vore_fullness && !resting)
		icon_state = "[chassis]"
	else if(!vore_fullness && resting)
		icon_state = "[chassis]_rest"
	else if(vore_fullness && !resting)
		icon_state = "[chassis]_full[fullness_extension]"
	else if(vore_fullness && resting)
		icon_state = "[chassis]_rest_full[fullness_extension]"
	if(chassis in GLOB.wide_chassis)
		pixel_x = -16
		default_pixel_x = -16
	else
		pixel_x = 0
		default_pixel_x = 0
	add_eyes()

//proc override to avoid pAI players being invisible while the chassis selection window is open
/mob/living/silicon/pai/proc/choose_chassis()
	set category = "Abilities.pAI Commands"
	set name = "Choose Chassis"
	var/choice

	choice = tgui_input_list(src, "What would you like to use for your mobile chassis icon?", "Chassis Choice", GLOB.possible_chassis)
	if(!choice) return
	var/oursize = size_multiplier
	resize(1, FALSE, TRUE, TRUE, FALSE)		//We resize ourselves to normal here for a moment to let the vis_height get reset
	chassis = GLOB.possible_chassis[choice]

	vore_capacity = 1
	vore_capacity_ex = list("stomach" = 1)

	if(chassis == "13")
		if(!holo_icon)
			if(!get_character_icon())
				return
		icon_state = null
		icon = holo_icon
	else if(chassis in GLOB.wide_chassis)
		icon = 'icons/mob/pai_vr64x64.dmi'
		vis_height = 64
	else
		icon = 'icons/mob/pai_vr.dmi'
		vis_height = 32
	resize(oursize, FALSE, TRUE, TRUE, FALSE)	//And then back again now that we're sure the vis_height is correct.

	if(chassis in GLOB.flying_chassis)
		hovering = TRUE
	else
		hovering = FALSE
		if(isopenspace(loc))
			fall()

	update_icon()

/mob/living/silicon/pai/verb/toggle_eyeglow()
	set category = "Abilities.pAI Commands"
	set name = "Toggle Eye Glow"

	if(chassis in GLOB.allows_eye_color)
		if(eye_glow && !hide_glow)
			eye_glow = FALSE
		else
			eye_glow = TRUE
			hide_glow = FALSE
		update_icon()
	else
		to_chat(src, span_filter_notice("Your selected chassis cannot modify its eye glow!"))
		return


/mob/living/silicon/pai/verb/pick_eye_color()
	set category = "Abilities.pAI Commands"
	set name = "Pick Eye Color"
	if(!(chassis in GLOB.allows_eye_color))
		to_chat(src, span_warning("Your selected chassis eye color can not be modified. The color you pick will only apply to supporting chassis and your card screen."))

	var/new_eye_color = tgui_color_picker(src, "Choose your character's eye color:", "Eye Color")
	if(new_eye_color)
		eye_color = new_eye_color
		update_icon()
		card.setEmotion(card.current_emotion)

// Release belly contents before being gc'd!
/mob/living/silicon/pai/Destroy()
	release_vore_contents()
	if(ckey)
		GLOB.paikeys -= ckey
	return ..()

/mob/living/silicon/pai/clear_client()
	if(ckey)
		GLOB.paikeys -= ckey
	return ..()

/mob/living/silicon/pai/proc/add_eyes()
	remove_eyes()
	if(chassis == "13")
		if(holo_icon.Width() > 32)
			holo_icon_dimension_X = 64
			pixel_x = -16
			default_pixel_x = -16
		if(holo_icon.Height() > 32)
			holo_icon_dimension_Y = 64
		if(holo_icon_dimension_X == 32 && holo_icon_dimension_Y == 32)
			eye_layer = image('icons/mob/pai_vr.dmi', "type13-eyes")
		else if(holo_icon_dimension_X == 32 && holo_icon_dimension_Y == 64)
			eye_layer = image('icons/mob/pai_vr32x64.dmi', "type13-eyes")
		else if(holo_icon_dimension_X == 64 && holo_icon_dimension_Y == 32)
			eye_layer = image('icons/mob/pai_vr64x32.dmi', "type13-eyes")
		else if(holo_icon_dimension_X == 64 && holo_icon_dimension_Y == 64)
			eye_layer = image('icons/mob/pai_vr64x64.dmi', "type13-eyes")
	else if(chassis in GLOB.allows_eye_color)
		eye_layer = image(icon, "[icon_state]-eyes")
	else return
	eye_layer.appearance_flags = appearance_flags
	eye_layer.color = eye_color
	if(eye_glow && !hide_glow)
		eye_layer.plane = PLANE_LIGHTING_ABOVE
	add_overlay(eye_layer)

/mob/living/silicon/pai/proc/remove_eyes()
	cut_overlay(eye_layer)
	qdel(eye_layer)
	eye_layer = null

/mob/living/silicon/pai/UnarmedAttack(atom/A, proximity_flag)
	. = ..()

	if(istype(A,/obj/structure/ladder))
		// Zmovement already allows these to be used with the verbs anyway
		var/obj/structure/ladder/L = A
		L.attack_hand(src)
		return

	if(!ismob(A) || A == src)
		return

	switch(a_intent)
		if(I_HELP)
			if(isliving(A))
				hug(src, A)
		if(I_GRAB)
			pai_nom(A)

// Allow card inhabited machines to be interacted with
// This has to override ClickOn because of storage depth nonsense with how pAIs are in cards in GLOB.machines
/mob/living/silicon/pai/ClickOn(var/atom/A, var/params)
	if(istype(A, /obj/machinery))
		var/obj/machinery/M = A
		if(M.paicard == card)
			M.attack_ai(src)
			return
	return ..()

/mob/living/silicon/pai/proc/hug(var/mob/living/silicon/pai/H, var/mob/living/target)

	var/t_him = "them"
	if(ishuman(target))
		var/mob/living/carbon/human/T = target
		switch(T.identifying_gender)
			if(MALE)
				t_him = "him"
			if(FEMALE)
				t_him = "her"
			if(NEUTER)
				t_him = "it"
			if(HERM)
				t_him = "hir"
			else
				t_him = "them"
	else
		switch(target.gender)
			if(MALE)
				t_him = "him"
			if(FEMALE)
				t_him = "her"
			if(NEUTER)
				t_him = "it"
			if(HERM)
				t_him = "hir"
			else
				t_him = "them"

	if(H.zone_sel.selecting == BP_HEAD)
		H.visible_message( \
			span_notice("[H] pats [target] on the head."), \
			span_notice("You pat [target] on the head."), )
	else if(H.zone_sel.selecting == BP_R_HAND || H.zone_sel.selecting == BP_L_HAND)
		H.visible_message( \
			span_notice("[H] shakes [target]'s hand."), \
			span_notice("You shake [target]'s hand."), )
	else if(H.zone_sel.selecting == "mouth")
		H.visible_message( \
			span_notice("[H] boops [target]'s nose."), \
			span_notice("You boop [target] on the nose."), )
	else
		H.visible_message(span_notice("[H] hugs [target] to make [t_him] feel better!"), \
						span_notice("You hug [target] to make [t_him] feel better!"))
	playsound(src, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)

/mob/living/silicon/pai/proc/savefile_path(mob/user)
	return "data/player_saves/[copytext(user.ckey, 1, 2)]/[user.ckey]/pai.sav"

/mob/living/silicon/pai/proc/savefile_save(mob/user)
	if(IsGuestKey(user.key))
		return 0

	var/savefile/F = new /savefile(src.savefile_path(user))


	F["name"] << src.name
	F["description"] << src.flavor_text
	F["eyecolor"] << src.eye_color
	F["chassis"] << src.chassis
	F["emotion"] << src.card.current_emotion
	F["gender"] << src.gender
	F["version"] << 1

	return 1

/mob/living/silicon/pai/proc/savefile_load(mob/user, var/silent = 1)
	if (IsGuestKey(user.key))
		return 0

	var/path = savefile_path(user)

	if (!fexists(path))
		return 0

	var/savefile/F = new /savefile(path)

	if(!F) return //Not everyone has a pai savefile.

	var/version = null
	F["version"] >> version

	if (isnull(version) || version != 1)
		fdel(path)
		if (!silent)
			tgui_alert_async(user, "Your savefile was incompatible with this version and was deleted.")
		return 0
	var/ourname
	var/ouremotion
	var/ourdesc
	var/oureyes
	var/ourchassis
	var/ourgender
	F["name"] >> ourname
	F["description"] >> ourdesc
	F["eyecolor"] >> oureyes
	F["chassis"] >> ourchassis
	F["emotion"] >> ouremotion
	F["gender"] >> ourgender
	if(ourname)
		SetName(ourname)
	if(ourdesc)
		flavor_text = ourdesc
	if(ourchassis)
		chassis = ourchassis
	if(ourgender)
		gender = ourgender
	if(oureyes)
		card.screen_color = oureyes
		eye_color = oureyes
	if(ouremotion)
		card.setEmotion(ouremotion)

	update_icon()
	return 1

/mob/living/silicon/pai/verb/save_pai_to_slot()
	set category = "Abilities.pAI Commands"
	set name = "Save Configuration"
	savefile_save(src)
	to_chat(src, span_filter_notice("[name] configuration saved to global pAI settings."))

/mob/living/silicon/pai/a_intent_change(input as text)
	. = ..()

	switch(a_intent)
		if(I_HELP)
			hud_used.help_intent.icon_state = "intent_help-s"
			hud_used.disarm_intent.icon_state = "intent_disarm-n"
			hud_used.grab_intent.icon_state = "intent_grab-n"
			hud_used.hurt_intent.icon_state = "intent_harm-n"

		if(I_DISARM)
			hud_used.help_intent.icon_state = "intent_help-n"
			hud_used.disarm_intent.icon_state = "intent_disarm-s"
			hud_used.grab_intent.icon_state = "intent_grab-n"
			hud_used.hurt_intent.icon_state = "intent_harm-n"

		if(I_GRAB)
			hud_used.help_intent.icon_state = "intent_help-n"
			hud_used.disarm_intent.icon_state = "intent_disarm-n"
			hud_used.grab_intent.icon_state = "intent_grab-s"
			hud_used.hurt_intent.icon_state = "intent_harm-n"

		if(I_HURT)
			hud_used.help_intent.icon_state = "intent_help-n"
			hud_used.disarm_intent.icon_state = "intent_disarm-n"
			hud_used.grab_intent.icon_state = "intent_grab-n"
			hud_used.hurt_intent.icon_state = "intent_harm-s"

/mob/living/silicon/pai/verb/toggle_gender_identity_vr()
	set name = "Set Gender Identity"
	set desc = "Sets the pronouns when examined and performing an emote."
	set category = "IC.Settings"
	var/new_gender_identity = tgui_input_list(src, "Please select a gender Identity:", "Set Gender Identity", list(FEMALE, MALE, NEUTER, PLURAL, HERM))
	if(!new_gender_identity)
		return 0
	gender = new_gender_identity
	return 1

/mob/living/silicon/pai/verb/pai_hide()
	set name = "Hide"
	set desc = "Allows to hide beneath tables or certain items. Toggled on or off."
	set category = "Abilities.pAI"

	hide()
	if(status_flags & HIDING)
		hide_glow = TRUE
	else
		hide_glow = FALSE
	update_icon()

/mob/living/silicon/pai/verb/screen_message(message as text|null)
	set category = "Abilities.pAI Commands"
	set name = "Screen Message"
	set desc = "Allows you to display a message on your screen. This will show up in the chat of anyone who is holding your card."

	if (src.client)
		if(client.prefs.muted & MUTE_IC)
			to_chat(src, span_warning("You cannot speak in IC (muted)."))
			return
	if(loc != card)
		to_chat(src, span_warning("Your message won't be visible while unfolded!"))
	if (!message)
		message = tgui_input_text(src, "Enter text you would like to show on your screen.","Screen Message")
	message = sanitize_or_reflect(message,src)
	if (!message)
		return
	message = capitalize(message)
	if (stat == DEAD)
		return
	card.screen_msg = message
	var/logmsg = "(CARD SCREEN)[message]"
	log_say(logmsg,src)
	to_chat(src, span_filter_say(span_cult("You print a message to your screen, \"[message]\"")))
	if(isliving(card.loc))
		var/mob/living/L = card.loc
		if(L.client)
			to_chat(L, span_filter_say(span_cult("[src.name]'s screen prints, \"[message]\"")))
		else return
	else if(isbelly(card.loc))
		var/obj/belly/b = card.loc
		if(b.owner.client)
			to_chat(b.owner, span_filter_say(span_cult("[src.name]'s screen prints, \"[message]\"")))
		else return
	else if(istype(card.loc, /obj/item/pda))
		var/obj/item/pda/p = card.loc
		if(isliving(p.loc))
			var/mob/living/L = p.loc
			if(L.client)
				to_chat(L, span_filter_say(span_cult("[src.name]'s screen prints, \"[message]\"")))
			else return
		else if(isbelly(p.loc))
			var/obj/belly/b = card.loc
			if(b.owner.client)
				to_chat(b.owner, span_filter_say(span_cult("[src.name]'s screen prints, \"[message]\"")))
			else return
		else return
	else return
	to_chat(src, span_notice("Your message was relayed."))
	for (var/mob/G in GLOB.player_list)
		if (isnewplayer(G))
			continue
		else if(isobserver(G) && G.client?.prefs?.read_preference(/datum/preference/toggle/ghost_ears))
			if((client?.prefs?.read_preference(/datum/preference/toggle/whisubtle_vis) || check_rights_for(G.client, R_HOLDER)) && \
			G.client?.prefs?.read_preference(/datum/preference/toggle/ghost_see_whisubtle))
				to_chat(G, span_filter_say(span_cult("[src.name]'s screen prints, \"[message]\"")))

/mob/living/silicon/pai/proc/touch_window(soft_name)	//This lets us touch TGUI procs and windows that may be nested behind other TGUI procs and windows
	if(stat != CONSCIOUS)								//so we can access our software without having to open up the software interface TGUI window
		to_chat(src, span_warning("You can't do that right now."))
		return
	for(var/thing in software)
		var/datum/pai_software/S = software[thing]
		if(istype(S, /datum/pai_software) && S.name == soft_name)
			if(S.toggle)
				S.toggle(src)
				to_chat(src, span_notice("You toggled [S.name]."))
				refresh_software_status()
			else
				S.tgui_interact(src)
				refresh_software_status()
			return
	for(var/thing in GLOB.pai_software_by_key)
		var/datum/pai_software/our_soft = GLOB.pai_software_by_key[thing]
		if(our_soft.name == soft_name)
			if(!(ram >= our_soft.ram_cost))
				to_chat(src, span_warning("Insufficient RAM for download. (Cost [our_soft.ram_cost] : [ram] Remaining)"))
				return
			if(tgui_alert(src, "Do you want to download [our_soft.name]? It costs [our_soft.ram_cost], and you have [ram] remaining.", "Download [our_soft.name]", list("Yes", "No")) == "Yes")
				ram -= our_soft.ram_cost
				software[our_soft.id] = our_soft
				to_chat(src, span_notice("You downloaded [our_soft.name]. ([ram] RAM remaining.)"))
				refresh_software_status()

/mob/living/silicon/pai/proc/refresh_software_status()	//This manages the pAI software status buttons icon states based on if you have them and if they are enabled
	for(var/thing in software)							//this only gets called when you click one of the relevent buttons, rather than all the time!
		var/datum/pai_software/soft = software[thing]
		if(istype(soft,/datum/pai_software/med_records))
			soft_mr = TRUE
		if(istype(soft,/datum/pai_software/sec_records))
			soft_sr = TRUE
		if(istype(soft,/datum/pai_software/door_jack))
			soft_dj = TRUE
		if(istype(soft,/datum/pai_software/atmosphere_sensor))
			soft_as = TRUE
		if(istype(soft,/datum/pai_software/pai_hud))
			soft_ar = TRUE
		if(istype(soft,/datum/pai_software/translator))
			soft_ut = TRUE
		if(istype(soft,/datum/pai_software/signaller))
			soft_si = TRUE
	for(var/obj/screen/pai/button in hud_used.other)
		if(button.name == "medical records")
			if(soft_mr)
				button.icon_state = "[button.base_state]"
			else
				button.icon_state = "[button.base_state]_o"
		if(button.name == "security records")
			if(soft_sr)
				button.icon_state = "[button.base_state]"
			else
				button.icon_state = "[button.base_state]_o"
		if(button.name == "door jack")
			if(soft_dj)
				button.icon_state = "[button.base_state]"
			else
				button.icon_state = "[button.base_state]_o"
		if(button.name == "atmosphere sensor")
			if(soft_as)
				button.icon_state = "[button.base_state]"
			else
				button.icon_state = "[button.base_state]_o"
		if(button.name == "remote signaler")
			if(soft_si)
				button.icon_state = "[button.base_state]"
			else
				button.icon_state = "[button.base_state]_o"
		if(button.name == "universal translator")
			if(soft_ut && translator_on)
				button.icon_state = "[button.base_state]"
			else
				button.icon_state = "[button.base_state]_o"
		if(button.name == "ar hud")
			if(soft_ar && paiHUD)
				button.icon_state = "[button.base_state]"
			else
				button.icon_state = "[button.base_state]_o"

//Procs for using the various UI buttons for your softwares
/mob/living/silicon/pai/proc/directives()
	touch_window("Directives")

/mob/living/silicon/pai/proc/crew_manifest()
	touch_window("Crew Manifest")

/mob/living/silicon/pai/proc/med_records()
	touch_window("Medical Records")

/mob/living/silicon/pai/proc/sec_records()
	touch_window("Security Records")

/mob/living/silicon/pai/proc/remote_signal()
	touch_window("Remote Signaler")

/mob/living/silicon/pai/proc/atmos_sensor()
	touch_window("Atmosphere Sensor")

/mob/living/silicon/pai/proc/translator()
	touch_window("Universal Translator")

/mob/living/silicon/pai/proc/door_jack()
	touch_window("Door Jack")

/mob/living/silicon/pai/proc/ar_hud()
	touch_window("AR HUD")

/mob/living/silicon/pai/proc/get_character_icon()
	if(!client || !client.prefs) return FALSE
	var/mob/living/carbon/human/dummy/dummy = new ()
	//This doesn't include custom_items because that's ... hard.
	client.prefs.dress_preview_mob(dummy)
	sleep(1 SECOND) //Strange bug in preview code? Without this, certain things won't show up. Yay race conditions?
	dummy.regenerate_icons()

	var/icon/new_holo = getCompoundIcon(dummy)

	dummy.tail_layering = TRUE
	dummy.set_dir(NORTH)
	var/icon/new_holo_north = getCompoundIcon(dummy)

	qdel(holo_icon)
	qdel(holo_icon_north)
	qdel(dummy)
	holo_icon = new_holo
	holo_icon_north = new_holo_north
	return TRUE

/mob/living/silicon/pai/set_dir(var/new_dir)
	. = ..()
	if(. && (chassis == "13"))
		switch(dir)
			if(SOUTH)
				icon = holo_icon
			else
				icon = holo_icon_north

/mob/living/silicon/pai/adjustBruteLoss(amount, include_robo)
	. = ..()
	if(amount > 0 && health <= 90)	//Something's probably attacking us!
		if(prob(amount))	//The more damage it is doing, the more likely it is to damage something important!
			card.damage_random_component()

/mob/living/silicon/pai/adjustFireLoss(amount, include_robo)
	. = ..()
	if(amount > 0 && health <= 90)
		if(prob(amount))
			card.damage_random_component()
