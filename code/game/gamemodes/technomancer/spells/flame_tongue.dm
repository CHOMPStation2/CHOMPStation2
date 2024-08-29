/datum/technomancer/spell/flame_tongue
	name = "Flame Tongue"
	desc = "Using a miniturized flamethrower in your gloves, you can emit a flame strong enough to melt both your enemies and walls."
	cost = 50
	obj_path = /obj/item/spell/flame_tongue // CHOMPEdit - Removal of obj/item/weapon
	ability_icon_state = "tech_flametongue"
	category = OFFENSIVE_SPELLS

/obj/item/spell/flame_tongue // CHOMPEdit - Removal of obj/item/weapon
	name = "flame tongue"
	icon_state = "flame_tongue"
	desc = "Burn!"
	cast_methods = CAST_MELEE
	aspect = ASPECT_FIRE
	var/obj/item/weldingtool/spell/welder = null // CHOMPEdit - Removal of obj/item/weapon

/obj/item/spell/flame_tongue/New() // CHOMPEdit - Removal of obj/item/weapon
	..()
	set_light(3, 2, l_color = "#FF6A00")
	visible_message("<span class='warning'>\The [loc]'s hand begins to emit a flame.</span>")
	welder = new /obj/item/weldingtool/spell(src) // CHOMPEdit - Removal of obj/item/weapon
	welder.setWelding(1)

/obj/item/spell/flame_tongue/Destroy() // CHOMPEdit - Removal of obj/item/weapon
	QDEL_NULL(welder)
	return ..()

/obj/item/weldingtool/spell // CHOMPEdit - Removal of obj/item/weapon
	name = "flame"
	eye_safety_modifier = 3

/obj/item/weldingtool/spell/process() // CHOMPEdit - Removal of obj/item/weapon
	return

//Needed to make the spell welder have infinite fuel.  Don't worry, it uses energy instead.
/obj/item/weldingtool/spell/remove_fuel() // CHOMPEdit - Removal of obj/item/weapon
	return 1

/obj/item/weldingtool/spell/eyecheck(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	return

/obj/item/spell/flame_tongue/on_melee_cast(atom/hit_atom, mob/living/user, def_zone) // CHOMPEdit - Removal of obj/item/weapon
	if(isliving(hit_atom) && user.a_intent != I_HELP)
		var/mob/living/L = hit_atom
		if(pay_energy(1000))
			visible_message("<span class='danger'>\The [user] reaches out towards \the [L] with the flaming hand, and they ignite!</span>")
			to_chat(L, "<span class='danger'>You ignite!</span>")
			L.fire_act()
			add_attack_logs(user,L,"Ignited with [src]")
			adjust_instability(12)
	else
		//This is needed in order for the welder to work, and works similarly to grippers.
		welder.loc = user
		var/resolved = hit_atom.attackby(welder, user)
		if(!resolved && welder && hit_atom)
			if(pay_energy(500))
				welder.attack(hit_atom, user, def_zone)
				adjust_instability(4)
		if(welder && user && (welder.loc == user))
			welder.loc = src
		else
			welder = null
			qdel(src)
			return
