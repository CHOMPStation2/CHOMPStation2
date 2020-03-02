/mob/living/simple_mob/shadekin/Initialize()
	var/list/ability_types = subtypesof(/obj/effect/shadekin_ability)
	if(name == "Rakshasa")
		ability_types += subtypesof(/obj/effect/rakshasa_ability)
	shadekin_abilities = list()
	for(var/type in ability_types)
		shadekin_abilities += new type(src)

	update_icon()

	return ..()


/obj/effect/rakshasa_ability
	name = ""
	desc = ""
	icon = 'icons/mob/screen_spells.dmi'
	var/ability_name = "FIX ME"
	var/cost = 50
	var/mob/living/simple_mob/shadekin/my_kin
	var/shift_mode = NOT_WHILE_SHIFTED
	var/ab_sound

/obj/effect/rakshasa_ability/New(var/new_kin)
	..()
	my_kin = new_kin
	loc = null

/obj/effect/rakshasa_ability/Destroy()
	my_kin = null
	return ..()

/obj/effect/rakshasa_ability/proc/atom_button_text()
	var/shift_denial

	if(shift_mode == NOT_WHILE_SHIFTED && (my_kin.ability_flags & AB_PHASE_SHIFTED))
		shift_denial = "Physical Only"
	else if(shift_mode == ONLY_WHILE_SHIFTED && !(my_kin.ability_flags & AB_PHASE_SHIFTED))
		shift_denial = "Shifted Only"

	if(shift_denial)
		name = shift_denial
	else
		name = my_kin.energy >= cost ? "Activate" : "No Energy"
	return src

/obj/effect/rakshasa_ability/Click(var/location, var/control, var/params)
	if(my_kin.stat) return

	var/list/clickprops = params2list(params)
	var/opts = clickprops["shift"]

	if(opts)
		to_chat(my_kin,"<span class='notice'><b>[name]</b> (Cost: [cost]%) - [desc]</span>")
	else
		do_ability(my_kin)

/obj/effect/rakshasa_ability/proc/do_ability()
	if(my_kin.stat)
		to_chat(my_kin,"<span class='warning'>Can't use that ability in your state!</span>")
		return FALSE
	if(shift_mode == NOT_WHILE_SHIFTED && (my_kin.ability_flags & AB_PHASE_SHIFTED))
		to_chat(my_kin,"<span class='warning'>Can't use that ability while phase shifted!</span>")
		return FALSE
	else if(shift_mode == ONLY_WHILE_SHIFTED && !(my_kin.ability_flags & AB_PHASE_SHIFTED))
		to_chat(my_kin,"<span class='warning'>Can only use that ability while phase shifted!</span>")
		return FALSE
	else if(my_kin.energy < cost)
		to_chat(my_kin,"<span class='warning'>Not enough energy for that ability!</span>")
		return FALSE

	my_kin.energy -= cost
	if(ab_sound)
		playsound(src,ab_sound,75,1)

	return TRUE




/obj/effect/rakshasa_ability/phase_shift2
	ability_name = "Goo Shift"
	desc = "Shift yourself with goopy effects."
	icon_state = "tech_passwall"
	cost = 100
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/phase_shift2/do_ability()
	if(!..())
		return
	new /obj/effect/decal/cleanable/blood/oil(loc, src)
	playsound(src, 'sound/rakshasa/Corrosion1.ogg', 100, 1)
	my_kin.phase_shift()
	if(my_kin.ability_flags & AB_PHASE_SHIFTED)
		cost = 0 //Shifting back is free (but harmful in light)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
		var/sound = pick(goo_sounds)
		playsound(my_kin.loc, sound, 100, 1)
	else
		cost = initial(cost)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		playsound(my_kin.loc, 'sound/rakshasa/Emerge0.ogg', 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/phase_shift3
	ability_name = "Goo Shift No Emerge"
	desc = "Shift yourself with goopy effects."
	icon_state = "tech_passwall"
	cost = 100
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/phase_shift3/do_ability()
	if(!..())
		return
	new /obj/effect/decal/cleanable/blood/oil(loc, src)
	playsound(src, 'sound/rakshasa/Corrosion1.ogg', 100, 1)
	my_kin.phase_shift()
	if(my_kin.ability_flags & AB_PHASE_SHIFTED)
		cost = 0 //Shifting back is free (but harmful in light)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
		var/sound = pick(goo_sounds)
		playsound(my_kin.loc, sound, 100, 1)
	else
		cost = initial(cost)
		new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
		var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
		var/sound = pick(goo_sounds)
		playsound(my_kin.loc, sound, 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/drip_oil
	ability_name = "Goo Drip"
	desc = "Drip some goo."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/drip_oil/do_ability()
	if(!..())
		return
	new /obj/effect/decal/cleanable/blood/oil(my_kin.loc)
	var/goo_sounds = list (
			'sound/rakshasa/Decay1.ogg',
			'sound/rakshasa/Decay2.ogg',
			'sound/rakshasa/Decay3.ogg'
			)
	var/sound = pick(goo_sounds)
	playsound(my_kin.loc, sound, 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/laugh
	ability_name = "Laugh"
	desc = "Laugh."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/laugh/do_ability()
	if(!..())
		return
	playsound(my_kin.loc, 'sound/rakshasa/Laugh.ogg', 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/no
	ability_name = "Say No"
	desc = "Say no!"
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/no/do_ability()
	if(!..())
		return
	playsound(my_kin.loc, 'sound/rakshasa/No.ogg', 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/emergesound
	ability_name = "Heavy Breating"
	desc = "Do the emrge sound without actually emerging."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/emergesound/do_ability()
	if(!..())
		return
	playsound(my_kin.loc, 'sound/rakshasa/Emerge0.ogg', 100, 1)
/////////////////////////////////////////////////////////////////
/obj/effect/rakshasa_ability/trap
	ability_name = "Lay Trap"
	desc = "Lay a trap that will notify you when someone steps in it."
	icon_state = ""
	cost = 0
	shift_mode = SHIFTED_OR_NOT
	ab_sound = 'sound/effects/stealthoff.ogg'
/obj/effect/rakshasa_ability/trap/do_ability()
	if(!..())
		return
	var/goo_sounds = list (
			'sound/rakshasa/Corrosion1.ogg',
			'sound/rakshasa/Corrosion2.ogg',
			'sound/rakshasa/Corrosion3.ogg'
			)
	var/sound = pick(goo_sounds)
	playsound(my_kin.loc, sound, 100, 1)
	new /obj/structure/gootrap (my_kin.loc)
