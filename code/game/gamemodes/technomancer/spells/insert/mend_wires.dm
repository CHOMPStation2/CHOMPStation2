/datum/technomancer/spell/mend_wires
	name = "Mend Wires"
	desc = "Binds the internal wiring of robotic limbs and components over time."
	spell_power_desc = "Healing amount increased."
	cost = 50
	obj_path = /obj/item/spell/insert/mend_wires
	ability_icon_state = "tech_mendwounds"
	category = SUPPORT_SPELLS

/obj/item/spell/insert/mend_wires
	name = "mend wires"
	desc = "A roboticist is now obsolete."
	icon_state = "mend_wounds"
	cast_methods = CAST_MELEE
	aspect = ASPECT_BIOMED
	light_color = "#FF5C5C"
	inserting = /obj/item/inserted_spell/mend_wires

/obj/item/inserted_spell/mend_wires/on_insert()
	if(ishuman(host))
		var/mob/living/carbon/human/H = host
		var/heal_power = host == origin ? 10 : 30
		heal_power = round(heal_power * spell_power_at_creation, 1)
		origin.adjust_instability(10)
		looped_insert(5, H)

/obj/item/inserted_spell/mend_wires/looped_insert(remaining_callbacks, mob/living/carbon/human/H)
	if(H)
		remaining_callbacks --
		for(var/obj/item/organ/external/O in H.organs)
			if(O.robotic < ORGAN_ROBOT) // Robot parts only.
				continue
			O.heal_damage(0, heal_power / 5, internal = 1, robo_repair = 1)

		if(remaining_callbacks > 0)
			addtimer(CALLBACK(src, PROC_REF(looped_insert), remaining_callbacks, H), 1 SECOND, TIMER_DELETE_ME)
			return

	on_expire()
