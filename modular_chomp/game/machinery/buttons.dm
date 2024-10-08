/obj/machinery/button/mob_spawner_button
	name = "Mob spawner"
	var/mob/living/simple_mob/mobspawned
	///What spawner is linked with this spawner
	var/link = "MOBSPAWN"

/obj/machinery/button/mob_spawner_button/attack_hand(mob/living/user)
	var/mob_wanted = tgui_input_list(user, "Which Mob do you want to spawn?", "Mob spawn", vr_mob_spawner_options)
	if(!mob_wanted)
		return
	var/neutral = FALSE
	var/mobtype = vr_mob_spawner_options[mob_wanted]
	var/faction = tgui_alert(user, "Do you want the mob's faction to remain the same or be passive?","Faction",list("Normal","Neutral"))
	if(!faction)
		return
	QDEL_NULL(mobspawned)
	if(faction == "Neutral")
		neutral = TRUE
	mobspawned = new mobtype(get_turf(GLOB.button_mob_spawner_landmark[link]))
	if(!istype(mobspawned))
		mobspawned = null
		return
	mobspawned.voremob_loaded = TRUE
	mobspawned.init_vore()
	if(neutral == TRUE)
		mobspawned.faction = "neutral"
	RegisterSignal(mobspawned, COMSIG_PARENT_QDELETING, PROC_REF(clean_mob))

/obj/machinery/button/mob_spawner_button/proc/clean_mob()
	SIGNAL_HANDLER
	mobspawned = null

/obj/machinery/button/mob_spawner_button/second
	link = "MOBSPAWNSECOND"

/obj/machinery/button/remote/noemag/emag_act(var/remaining_charges, var/mob/user)
	to_chat(usr, span_warning("The cryptographic sequencer seems to do nothing."))
	return 0
