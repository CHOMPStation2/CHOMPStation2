/mob/living/simple_mob/vore
	mob_class = MOB_CLASS_ANIMAL
	mob_bump_flag = 0
	can_be_drop_pred = 1

/mob/living/simple_mob
	var/nameset
	var/limit_renames = TRUE
	var/copy_prefs_to_mob = TRUE

/mob/living/simple_mob/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/set_name) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/proc/set_desc) //CHOMPEdit TGPanel

	if(copy_prefs_to_mob)
		login_prefs()

/mob/living/proc/login_prefs()

	ooc_notes = client.prefs.metadata
	ooc_notes_likes = client.prefs.metadata_likes
	ooc_notes_dislikes = client.prefs.metadata_dislikes
	//CHOMPEdit Start
	ooc_notes_favs = client.prefs.metadata_favs
	ooc_notes_maybes = client.prefs.metadata_maybes
	ooc_notes_style = client.prefs.matadata_ooc_style
	//CHOMPEdit End
	digestable = client.prefs_vr.digestable
	devourable = client.prefs_vr.devourable
	absorbable = client.prefs_vr.absorbable
	feeding = client.prefs_vr.feeding
	can_be_drop_prey = client.prefs_vr.can_be_drop_prey
	can_be_drop_pred = client.prefs_vr.can_be_drop_pred
	throw_vore = client.prefs_vr.throw_vore
	food_vore = client.prefs_vr.food_vore
	allow_spontaneous_tf = client.prefs_vr.allow_spontaneous_tf
	digest_leave_remains = client.prefs_vr.digest_leave_remains
	allowmobvore = client.prefs_vr.allowmobvore
	permit_healbelly = client.prefs_vr.permit_healbelly
	noisy = client.prefs_vr.noisy
	selective_preference = client.prefs_vr.selective_preference
	eating_privacy_global = client.prefs_vr.eating_privacy_global
	allow_mimicry = client.prefs_vr.allow_mimicry

	drop_vore = client.prefs_vr.drop_vore
	stumble_vore = client.prefs_vr.stumble_vore
	slip_vore = client.prefs_vr.slip_vore
	digest_pain = client.prefs_vr.digest_pain

	resizable = client.prefs_vr.resizable
	show_vore_fx = client.prefs_vr.show_vore_fx
	step_mechanics_pref = client.prefs_vr.step_mechanics_pref
	pickup_pref = client.prefs_vr.pickup_pref
	allow_mind_transfer = client.prefs_vr.allow_mind_transfer

	//CHOMP Stuff Start
	phase_vore = client.prefs_vr.phase_vore
	latejoin_vore = client.prefs_vr.latejoin_vore
	latejoin_prey = client.prefs_vr.latejoin_prey
	receive_reagents = client.prefs_vr.receive_reagents
	give_reagents = client.prefs_vr.give_reagents
	apply_reagents = client.prefs_vr.apply_reagents
	autotransferable = client.prefs_vr.autotransferable
	noisy_full = client.prefs_vr.noisy_full
	strip_pref = client.prefs_vr.strip_pref
	vore_sprite_color = client.prefs_vr.vore_sprite_color
	vore_sprite_multiply = client.prefs_vr.vore_sprite_multiply
	no_latejoin_vore_warning = client.prefs_vr.no_latejoin_vore_warning
	no_latejoin_prey_warning = client.prefs_vr.no_latejoin_prey_warning
	no_latejoin_vore_warning_time = client.prefs_vr.no_latejoin_vore_warning_time
	no_latejoin_prey_warning_time = client.prefs_vr.no_latejoin_prey_warning_time
	no_latejoin_vore_warning_persists = client.prefs_vr.no_latejoin_vore_warning_persists
	no_latejoin_prey_warning_persists = client.prefs_vr.no_latejoin_prey_warning_persists
	belly_rub_target = client.prefs_vr.belly_rub_target
	soulcatcher_pref_flags = client.prefs_vr.soulcatcher_pref_flags
	//CHOMP Stuff End

/mob/living/simple_mob/proc/set_name()
	set name = "Set Name"
	set desc = "Sets your mobs name. You only get to do this once."
	set category = "Abilities.Settings" //CHOMPEdit
	if(limit_renames && nameset)
		to_chat(src, "<span class='userdanger'>You've already set your name. Ask an admin to toggle \"nameset\" to 0 if you really must.</span>")
		return
	var/newname
	newname = sanitizeSafe(tgui_input_text(src,"Set your name. You only get to do this once. Max 52 chars.", "Name set","", MAX_NAME_LEN), MAX_NAME_LEN)
	if (newname)
		name = newname
		voice_name = newname
		nameset = 1

/mob/living/simple_mob/proc/set_desc()
	set name = "Set Description"
	set desc = "Set your description."
	set category = "Abilities.Settings" //CHOMPEdit
	var/newdesc
	newdesc = sanitizeSafe(tgui_input_text(src,"Set your description. Max 4096 chars.", "Description set","", prevent_enter = TRUE), MAX_MESSAGE_LEN)
	if(newdesc)
		desc = newdesc

/mob/living/simple_mob/vore/aggressive
	mob_bump_flag = HEAVY
