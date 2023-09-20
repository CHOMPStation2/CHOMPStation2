/obj/machinery/button/mob_spawner_button
	name = "Mob spawner"
	var/mob/living/simple_mob/mobspawned
	///What spawner is linked with this spawner
	var/link = "MOBSPAWN"

/obj/machinery/button/mob_spawner_button/attack_hand(mob/living/user)
	var/mob_wanted = tgui_input_list(user, "Which Mob do you want to spawn?", "Mob spawn", vr_mob_spawner_options)
	if(!mob_wanted)
		return
	QDEL_NULL(mobspawned)
	var/neutral = FALSE
	var/mobtype = vr_mob_spawner_options[mob_wanted]
	var/faction = tgui_alert(user, "Do you want the mob's faction to remain the same or be passive?","Faction",list("Normal","Neutral"))
	if(faction == "Neutral")
		neutral = TRUE
	mobspawned = new mobtype(get_turf(GLOB.button_mob_spawner_landmark[link]))
	mobspawned.voremob_loaded = TRUE
	mobspawned.init_vore()
	if(neutral == TRUE)
		mobspawned.faction = "neutral"
	RegisterSignal(mobspawned, COMSIG_PARENT_QDELETING, .proc/clean_mob)

/obj/machinery/button/mob_spawner_button/proc/clean_mob()
	SIGNAL_HANDLER
	mobspawned = null

/obj/machinery/button/mob_spawner_button/second
	link = "MOBSPAWNSECOND"

/obj/machinery/button/remote/noemag/emag_act(var/remaining_charges, var/mob/user)
	to_chat(usr, "<span class='warning'>The cryptographic sequencer seems to do nothing.</span>")
	return 0

/obj/machinery/button/button_that_makes_you_explode //Funny
	name = "Button that makes you explode"
	desc = "This button will make you explode if you press it."
	description_info = "<span class='warning'>Pressing this button will actually kill you, be careful!</span>"
	explosion_resistance = 1

/obj/machinery/button/button_that_makes_you_explode/attack_hand(var/mob/living/user)
	. = ..()
	visible_message("<span class='warning'>[user] presses \the [src], exploding!</span>")
	explosion(user.loc, 0, 0, 3, 6)
	user.gib()
	log_and_message_admins("[key_name_admin(user)] has pressed the button that makes you explode and exploded.") //Admins should know when someone explodes

/obj/machinery/button/button_that_makes_you_explode/ex_act() //The button is immune to explosions so it doesnt blow itself up
	return
