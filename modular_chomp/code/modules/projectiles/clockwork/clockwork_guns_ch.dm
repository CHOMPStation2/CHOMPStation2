//clockcult gun

/obj/item/gun/energy/clockwork
	name = "clockwork rifle"
	desc = "A rifle that looks to be made entirely out of brass. It has a charging handle on the side, but doesn't seem to have a way to eject the magazine underneath."
	icon = 'modular_chomp/icons/obj/guns/clockwork/guns_ch.dmi'
	icon_state = "clockrifle"
	item_state = "clockrifle"
	wielded_item_state = "clockrifle-wielded"
	slot_flags = SLOT_BACK
	item_icons = list(slot_l_hand_str = 'modular_chomp/icons/mob/items/lefthand_guns_ch.dmi', slot_r_hand_str = 'modular_chomp/icons/mob/items/righthand_guns_ch.dmi', "slot_back" = 'modular_chomp/icons/mob/guns_back_ch.dmi')
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 2, TECH_POWER = 4)
	projectile_type = /obj/item/projectile/bullet/rifle/clockwork
	w_class = ITEMSIZE_HUGE
	one_handed_penalty = 90
	accuracy = 45
	charge_cost = 300

	battery_lock = 1
	unacidable = TRUE

	var/recharging = 0
	var/phase_power = 2400
	firemodes = list(
		list(mode_name="burst", burst=3, fire_delay=8, projectile_type=/obj/item/projectile/bullet/rifle/clockwork, charge_cost = 80),
		list(mode_name="volt beam", fire_delay=12, projectile_type=/obj/item/projectile/beam/shock/clockwork, charge_cost = 2400),
	)
	cell_type = /obj/item/cell/device/weapon/empproof

/obj/item/gun/energy/clockwork/unload_ammo(var/mob/user)
	if(recharging)
		return
	recharging = 1
	update_icon()
	playsound(src,'sound/weapons/clockwork/clockwork_cock.ogg',25,1)
	user.visible_message(span_notice("[user] pulls the charging handle on \the [src] and it whirrs to life!"), \
						span_notice("You pull the charging handle on \the [src] and begin the reloading sequence."))
	playsound(src,'sound/weapons/clockwork/cwc_rifle_fabricate.ogg',25,5)
	while(recharging)
		if(!do_after(user, 50, src))
			break
		user.hud_used.update_ammo_hud(user, src)
		if(power_supply.give(phase_power) < phase_power)
			break

	recharging = 0
	update_icon()
	user.hud_used.update_ammo_hud(user, src) // Update one last time once we're finished!

/obj/item/projectile/bullet/rifle/clockwork
	fire_sound = 'sound/weapons/clockwork/cwc_rifle_fire.ogg'
	damage = 20 //Old 10
	hud_state = "rifle_heavy"

/obj/item/projectile/beam/shock/clockwork
	name = "shock beam"
	fire_sound = 'sound/weapons/clockwork/voltbeam_fire.ogg'
	icon_state = "lightning"
	damage_type = ELECTROCUTE

	muzzle_type = /obj/effect/projectile/muzzle/voltbeam
	tracer_type = /obj/effect/projectile/tracer/voltbeam
	impact_type = /obj/effect/projectile/impact/voltbeam

	damage = 40 //Old 20
	agony = 15
	eyeblur = 2
	hitsound = 'sound/effects/lightningshock.ogg'
	hitsound_wall = 'sound/weapons/clockwork/voltbeamsearwall.ogg'
	hud_state = "taser"

/obj/effect/projectile/muzzle/voltbeam
	icon = 'modular_chomp/icons/obj/guns/clockwork/projectiles_tracer_ch.dmi'
	icon_state = "muzzle_volt_ray"
	light_range = 2
	light_power = 1
	light_color = "#DAAA18"

/obj/effect/projectile/tracer/voltbeam
	icon = 'modular_chomp/icons/obj/guns/clockwork/projectiles_tracer_ch.dmi'
	icon_state = "volt_ray"
	light_range = 2
	light_power = 1
	light_color = "#DAAA18"

/obj/effect/projectile/impact/voltbeam
	icon = 'modular_chomp/icons/obj/guns/clockwork/projectiles_tracer_ch.dmi'
	icon_state = "impact_volt_ray"
	light_range = 2
	light_power = 1
	light_color = "#DAAA18"
