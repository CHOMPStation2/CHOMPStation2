
////////////////////////////
//	Purity Construct - Bishop - Spells
////////////////////////////

/spell/targeted/construct_advanced/crippling_beam
	name = "Crippling Beam"
	desc = "Fire a crippling beam to hold down your enemies or prey."

	hud_state = "const_beam"
	spell_obj = /obj/item/spell/construct/projectile/crippling_beam

/obj/item/spell/construct/projectile/crippling_beam
	name = "Crippling Beam"
	icon_state = "generic"
	desc = "Your manipulators fire crippling beam of dense light."
	cast_methods = CAST_RANGED
	spell_projectile = /obj/item/projectile/beam/crippling_beam
	pre_shot_delay = 0
	cooldown = 50
	fire_sound = 'sound/weapons/spiderlunge.ogg'

/obj/item/projectile/beam/crippling_beam
	name = "Crippling Beam"
	icon_state = "invert"
	fire_sound = 'sound/weapons/spiderlunge.ogg'
	damage = 20
	damage_type = BURN
	check_armour = "laser"
	armor_penetration = 60
	light_range = 2
	light_power = -2
	light_color = "#64B4E6"

	muzzle_type = /obj/effect/projectile/muzzle/laser_omni
	tracer_type = /obj/effect/projectile/tracer/laser_omni
	impact_type = /obj/effect/projectile/impact/laser_omni

/obj/item/projectile/beam/crippling_beam/proc/bang(var/mob/living/carbon/M)
	to_chat(M, span_danger("You hear a loud roar."))
	playsound(src, 'sound/effects/bang.ogg', 50, 1)
	var/ear_safety = 0
	ear_safety = M.get_ear_protection()
	if(ear_safety == 1)
		M.Confuse(150)
	else if (ear_safety > 1)
		M.Confuse(30)
	else if (!ear_safety)
		M.Stun(10)
		M.Weaken(2)
		M.ear_damage += rand(1, 10)
		M.ear_deaf = max(M.ear_deaf,15)
		M.deaf_loop.start()
	if (M.ear_damage >= 15)
		to_chat(M, span_danger("Your ears start to ring badly!"))
		if (prob(M.ear_damage - 5))
			to_chat(M, span_danger("You can't hear anything!"))
			M.sdisabilities |= DEAF
			M.deaf_loop.start()
	else
		if (M.ear_damage >= 5)
			to_chat(M, span_danger("Your ears start to ring!"))
	M.update_icons()

/obj/item/projectile/beam/crippling_beam/on_hit(var/atom/target)
	bang(target)
	. = ..()

/spell/targeted/construct_advanced/banishment
	name = "banishment"
	desc = "Fire a searing beam of light, banishing unholy foes."

	hud_state = "const_beam"
	spell_obj = /obj/item/spell/construct/projectile/banishment

/obj/item/spell/construct/projectile/banishment
	name = "banishment"
	icon_state = "generic"
	desc = "Your manipulators fire searing beams of light."
	cast_methods = CAST_RANGED
	spell_projectile = /obj/item/projectile/beam/banishment
	pre_shot_delay = 0
	cooldown = 10
	fire_sound = 'sound/weapons/spiderlunge.ogg'

/obj/item/projectile/beam/banishment
	name = "banishment"
	icon_state = "invert"
	fire_sound = 'sound/weapons/spiderlunge.ogg'
	damage = 15
	damage_type = BURN
	SA_bonus_damage = 45
	SA_vulnerability = list(MOB_CLASS_DEMONIC,MOB_CLASS_ILLUSION)
	check_armour = "laser"
	armor_penetration = 60
	light_range = 2
	light_power = -2
	light_color = "#64B4E6"

	muzzle_type = /obj/effect/projectile/muzzle/lightning
	tracer_type = /obj/effect/projectile/tracer/lightning
	impact_type = /obj/effect/projectile/impact/lightning

/obj/item/projectile/beam/banishment/proc/banish(var/mob/living/simple_mob/construct)
	if(construct)
		construct.Stun(10)
		construct.Weaken(2)
	else
		return

/obj/item/projectile/beam/banishment/on_hit(var/atom/target)
	banish(target)
	. = ..()

////////////////////////////
//	Purity Construct - Deacon - Spells
////////////////////////////

///Deacon Laser
/spell/targeted/construct_advanced/force_beam
	name = "Force Beam"
	desc = "Fire a beam of kinetic energy to force back troublemakers."

	hud_state = "const_beam"
	spell_obj = /obj/item/spell/construct/projectile/force_beam

/obj/item/spell/construct/projectile/force_beam
	name = "force_beam"
	icon_state = "generic"
	desc = "Your manipulators fire a condensed beam of kinetic energy."
	cast_methods = CAST_RANGED
	spell_projectile = /obj/item/projectile/beam/force_beam
	pre_shot_delay = 0
	cooldown = 5
	fire_sound = 'sound/weapons/spiderlunge.ogg'

/obj/item/projectile/beam/force_beam
	name = "force beam"
	icon_state = "invert"
	fire_sound = 'sound/weapons/spiderlunge.ogg'
	damage = 5
	damage_type = BRUTE
	check_armour = "melee"
	armor_penetration = 60
	light_range = 2
	light_power = -2
	light_color = "#64B4E6"

	muzzle_type = /obj/effect/projectile/muzzle/tungsten
	tracer_type = /obj/effect/projectile/tracer/tungsten
	impact_type = /obj/effect/projectile/impact/tungsten

/obj/item/projectile/beam/force_beam/on_hit(var/atom/movable/target, var/blocked = 0)
	if(isliving(target))
		var/mob/living/L = target
		if(prob(40) && !blocked)
			L.Stun(1)
			L.Confuse(1)


///Deacon Healing Sphere
/spell/targeted/construct_advanced/soothing_sphere
	name = "Sphere of soothing"
	desc = "Rend a portal into a plane of sothing energy at the target location."

	charge_max = 100

	hud_state = "const_harvest"
	spell_obj = /obj/item/spell/construct/spawner/soothing_sphere

/obj/item/spell/construct/spawner/soothing_sphere
	name = "sphere of soothing"
	desc = "Call forth a portal to a dimension of soothing energies at your target."

	spawner_type = /obj/effect/temporary_effect/pulse/soothing_sphere

/obj/item/spell/construct/spawner/soothing_sphere/on_ranged_cast(atom/hit_atom, mob/user)
	if(within_range(hit_atom) && pay_energy(10))
		..()

/obj/item/spell/construct/spawner/soothing_sphere/on_throw_cast(atom/hit_atom, mob/user)
	pay_energy(5)
	if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		L.add_modifier(/datum/modifier/soothe, 10 SECONDS)

/obj/effect/temporary_effect/pulse/soothing_sphere
	name = "soothing sphere"
	desc = "A portal to some hellish place. Its screams wrack your body with pain."
	icon = 'icons/effects/effects.dmi'
	icon_state = "blue_static_sphere"
	time_to_die = null
	light_range = 4
	light_power = 5
	light_color = "#64B4E6"
	light_on = TRUE
	pulses_remaining = 10
	pulse_delay = 1 SECOND

/obj/effect/temporary_effect/pulse/soothing_sphere/on_pulse()
	for(var/mob/living/L in view(4,src))
		if(!iscultist(L) && !istype(L, /mob/living/simple_mob/construct))
			L.add_modifier(/datum/modifier/soothe, 2 SECONDS)
			L.adjustBruteLoss(rand(-5,-10))
			L.adjustFireLoss(rand(-5,-10))

/datum/modifier/soothe
	name = "soothe"
	desc = "Your body is soothed of pain."

	on_created_text = span_notice("A blue lightning quickly covers your body. Pain quickly fading.")
	on_expired_text = span_notice("The lightning fades, and so too does the ongoing soothing of pain.")

	stacks = MODIFIER_STACK_EXTEND

	mob_overlay_state = "blue_electricity_constant"

/datum/modifier/soothe/tick()
	spawn()
		if(ishuman(holder))
			var/mob/living/carbon/human/H = holder
			H.apply_effect(-20, AGONY)
			if(prob(10))
				to_chat(H, span_warning("It feels so comforting!"))

////////////////////////////
//	Purity Construct - Priest - Spells
////////////////////////////

/spell/targeted/construct_advanced/mend_purity
	name = "Mend Purity"
	desc = "Mend a target living being or construct over time."

	charge_max = 100

	hud_state = "const_mend"
	spell_obj = /obj/item/spell/construct/mend_purity

/obj/item/spell/construct/mend_purity
	name = "Mend Purity"
	desc = "Mend the wounds of constructs or living beings overtime."
	icon_state = "mend_wounds"
	cast_methods = CAST_MELEE
	aspect = ASPECT_UNHOLY
	light_color = "#64B4E6"
	light_power = -2
	light_on = TRUE

/obj/item/spell/construct/mend_purity/on_melee_cast(atom/hit_atom, mob/living/user, def_zone)
	if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		L.add_modifier(/datum/modifier/mend_purity, 150)
	qdel(src)

/datum/modifier/mend_purity
	name = "holy mending"
	desc = "Your body is mending, rejoice!"

	on_created_text = span_notice("A holy light envelops your body as it begins to mend.")
	on_expired_text = span_notice("The cloak of unease dissipates.")

	stacks = MODIFIER_STACK_EXTEND

	mob_overlay_state = "blue_electricity_constant"

/datum/modifier/mend_purity/tick()
	spawn()
		if(isliving(holder))
			var/mob/living/L = holder
			if(istype(L, /mob/living/simple_mob/construct))
				L.adjustBruteLoss(rand(-5,-10))
				L.adjustFireLoss(rand(-5,-10))
			else
				L.adjustBruteLoss(-2)
				L.adjustFireLoss(-2)

			if(ishuman(holder))
				var/mob/living/carbon/human/H = holder

				for(var/obj/item/organ/O in H.internal_organs)
					if(O.damage > 0)
						O.damage = max(O.damage - 2, 0)
					if(O.damage <= 5 && O.organ_tag == O_EYES)
						H.sdisabilities &= ~BLIND

				for(var/obj/item/organ/external/O in H.organs)
					O.heal_damage(rand(1,3), rand(1,3), internal = 1, robo_repair = 1)

				for(var/obj/item/organ/E in H.bad_external_organs)
					var/obj/item/organ/external/affected = E
					if((affected.damage < affected.min_broken_damage * CONFIG_GET(number/organ_health_multiplier)) && (affected.status & ORGAN_BROKEN)) // CHOMPEdit
						affected.status &= ~ORGAN_BROKEN

					for(var/datum/wound/W in affected.wounds)
						if(istype(W, /datum/wound/internal_bleeding))
							affected.wounds -= W
							affected.update_damages()

				H.restore_blood()
				if(iscultist(H))
					H.apply_effect(100, AGONY)//it will heal cultists but purity really doesn't like them so causes much pain
				if(prob(10))
					to_chat(H, span_danger("It feels as though your body is being torn apart!"))
			L.updatehealth()

/spell/targeted/purity_repair_aura
	name = "Repair Aura"
	desc = "Emit a field of energy around your shell to repair nearby constructs at range."

	range = -1
	school = "evocation"
	charge_type = Sp_RECHARGE
	invocation_type = SpI_NONE

	spell_flags = CONSTRUCT_CHECK | INCLUDEUSER

	hud_state = "const_repairaura"
	smoke_amt = 0

	charge_max = 600

/spell/targeted/purity_repair_aura/cast(list/targets, mob/living/user)
	if(findNullRod(user) || user.has_modifier_of_type(/datum/modifier/repair_aura))
		charge_counter = 300
		return
	user.add_modifier(/datum/modifier/repair_aura_purity, 30 SECONDS)

/datum/modifier/repair_aura_purity
	name = "aura of repair (purity)"
	desc = "You are emitting a field of strange energy, capable of repairing constructs."

	on_created_text = span_notice("You begin emitting an purity repair aura.")
	on_expired_text = span_notice("The purity repair aura fades.")
	stacks = MODIFIER_STACK_EXTEND

/datum/modifier/repair_aura_purity/tick()
	spawn()
		for(var/mob/living/simple_mob/construct/T in view(4,holder))
			T.adjustBruteLoss(rand(-10,-15))
			T.adjustFireLoss(rand(-10,-15))
