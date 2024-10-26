//This is pretty much just copied from construct_spells but adjusted so anyone can use them

/spell/targeted/unrestricted
	name = "Base Unrestricted Spell"
	desc = "If you see this, you should probably remind coders to refactor spell code."

	range = -1
	school = "evocation"
	charge_type = Sp_RECHARGE
	invocation_type = SpI_NONE

	spell_flags = INCLUDEUSER

	hud_state = "const_rune"
	smoke_amt = 0

	charge_max = 10

	var/obj/item/spell/unrestricted/spell_obj = null //This is the var that determines what Technomancer-style spell is put into their hands.

/spell/targeted/unrestricted/cast(list/targets, mob/living/user)
	user.place_spell_in_hand(spell_obj)

/obj/item/spell/unrestricted
	name = "a spell"
	desc = "Remind the devs to refactor spell code."
	icon = 'icons/obj/spells.dmi'
	icon_state = "generic"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_spells.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_spells.dmi',
		)
	throwforce = 0
	force = 0
	show_examine = FALSE
	owner = null
	core = null
	cast_methods = null			// Controls how the spell is casted.
	aspect = ASPECT_UNHOLY		// Not used for everything we do
	toggled = 0					// Mainly used for overlays.
	cooldown = 0 				// If set, will add a cooldown overlay and adjust click delay.  Must be a multiple of 5 for overlays.
	cast_sound = null			// Sound file played when this is used.
	var/last_castcheck = null	// The last time this spell was cast.

/obj/item/spell/unrestricted/New()
	if(isliving(loc))
		owner = loc
	if(!owner)
		qdel(src)
	update_icon()

/obj/item/spell/unrestricted/run_checks()
	if(owner)
		if(world.time >= (last_castcheck + cooldown)) //Are they a cultist or a construct, and has the cooldown time passed?
			last_castcheck = world.time
			return 1
	return 0

/obj/item/spell/unrestricted/pay_energy(var/amount)
	if(owner)
		return 1

/obj/item/spell/unrestricted/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!run_checks())
		return
	if(!proximity_flag)
		if(cast_methods & CAST_RANGED)
			on_ranged_cast(target, user)
	else
		if(istype(target, /obj/item/spell))
			var/obj/item/spell/spell = target
			if(spell.cast_methods & CAST_COMBINE)
				spell.on_combine_cast(src, user)
				return
		if(cast_methods & CAST_MELEE)
			on_melee_cast(target, user)
		else if(cast_methods & CAST_RANGED) //Try to use a ranged method if a melee one doesn't exist.
			on_ranged_cast(target, user)
	if(cooldown)
		var/effective_cooldown = round(cooldown, 5)
		user.setClickCooldown(effective_cooldown)
		flick("cooldown_[effective_cooldown]",src)

/obj/item/spell/unrestricted/projectile //This makes me angry, but we need the template, and we can't use it because special check overrides on the base.
	name = "construct projectile template"
	icon_state = "generic"
	desc = "This is a generic template that shoots projectiles.  If you can read this, the game broke!"
	cast_methods = CAST_RANGED
	var/obj/item/projectile/spell_projectile = null
	var/pre_shot_delay = 0
	var/fire_sound = null
	var/energy_cost_per_shot = 5

/obj/item/spell/unrestricted/projectile/on_ranged_cast(atom/hit_atom, mob/living/user)
	if(set_up(hit_atom, user))
		var/obj/item/projectile/new_projectile = make_projectile(spell_projectile, user)
		new_projectile.old_style_target(hit_atom)
		new_projectile.firer = user	//Don't shoot yourself while moving
		new_projectile.fire()
		log_attack("has casted [src] at \the [hit_atom].")
		if(fire_sound)
			playsound(src, fire_sound, 75, 1)
		return 1
	return 0

/obj/item/spell/unrestricted/projectile/proc/make_projectile(obj/item/projectile/projectile_type, mob/living/user)
	var/obj/item/projectile/P = new projectile_type(get_turf(user))
	return P

/obj/item/spell/unrestricted/projectile/proc/set_up(atom/hit_atom, mob/living/user)
	if(spell_projectile)
		if(pay_energy(energy_cost_per_shot))
			if(pre_shot_delay)
				var/image/target_image = image(icon = 'icons/obj/spells.dmi', loc = get_turf(hit_atom), icon_state = "target")
				user << target_image
				user.Stun(pre_shot_delay / 10)
				sleep(pre_shot_delay)
				qdel(target_image)
				if(owner)
					return TRUE
				return FALSE // We got dropped before the firing occured.
			return TRUE // No delay, no need to check.
	return FALSE

//
//		The actual spells
//

/spell/targeted/unrestricted/plasmastun
	name = "Plasma Snare"
	desc = "Fire a debillitating slowing projectile."

	hud_state = "const_beam"
	spell_obj = /obj/item/spell/unrestricted/projectile/plasmastun

/obj/item/spell/unrestricted/projectile/plasmastun
	name = "plasma snare"
	icon_state = "generic"
	desc = "Your hands fire a debillitating slowing projectile."
	cast_methods = CAST_RANGED
	spell_projectile = /obj/item/projectile/energy/plasmastun/slow
	pre_shot_delay = 0
	cooldown = 5
	fire_sound = 'sound/weapons/weaponsounds_laserstrong.ogg'

/spell/targeted/unrestricted/mend
	name = "Mend Target"
	desc = "Mend a target over time."

	charge_max = 100

	hud_state = "const_mend"
	spell_obj = /obj/item/spell/unrestricted/mend

/obj/item/spell/unrestricted/mend
	name = "mend target"
	desc = "Mend the wounds of a target over time"
	icon_state = "mend_wounds"
	cast_methods = CAST_MELEE
	aspect = ASPECT_UNHOLY
	light_color = "#FF5C5C"
	light_power = -2
	light_on = TRUE

/obj/item/spell/unrestricted/mend/on_melee_cast(atom/hit_atom, mob/living/user, def_zone)
	if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		L.add_modifier(/datum/modifier/mend_occult, 150)	//No need to change this, it does the job
	qdel(src)