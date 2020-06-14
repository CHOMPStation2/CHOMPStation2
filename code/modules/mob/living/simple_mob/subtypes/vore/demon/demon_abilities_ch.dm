
/mob/living/simple_mob/vore/demon/verb/blood_burst()
	set name = "Blood burst"
	set desc = "Spawn bloody remains from your past hunts."
	set category = "Abilities"

	var/turf/T = get_turf(src)

	if(shifted_out)
		to_chat(src,"<span class='warning'>You must be in the physical world to create blood!</span>")
		return FALSE

	if(world.time - blood_spawn < 1500)
		to_chat(src,"<span class='warning'>You can't create blood so soon! You need to wait [round(((blood_spawn+1500)-world.time)/10)] second\s!</span>")
		return FALSE


	new /obj/effect/gibspawner/generic(T)

	playsound(src.loc, 'sound/effects/blobattack.ogg', 50, 1)

	blood_spawn = world.time

	return
