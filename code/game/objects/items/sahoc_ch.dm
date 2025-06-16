/obj/item/buttonofnormal
	name = "Chaos button"
	desc = "It radiates an aura of chaotic size energy."
	icon = 'icons/obj/mobcap.dmi'
	icon_state = "mobcap0"
	matter = list(DEFAULT_WALL_MATERIAL = 1000)
	throwforce = 00
	throw_speed = 4
	throw_range = 20
	force = 0
	var/colorindex = 0
	var/mob/living/capsuleowner = null //taken from Capsule Code
	var/sizetouse = 0.25

/obj/item/buttonofnormal/pickup(mob/user)
	if(!capsuleowner)
		capsuleowner = user

/obj/item/buttonofnormal/attack_self(mob/user)
	if(colorindex)
		nonrandom()
	addtimer(CALLBACK(src, PROC_REF(do_size_effect), capsuleowner), 10, TIMER_DELETE_ME)

/obj/item/buttonofnormal/throw_impact(atom/A, speed, mob/user)
	..()
	if(isliving(A))
		if(colorindex)
			nonrandom()
		addtimer(CALLBACK(src, PROC_REF(do_size_effect), A), 5, TIMER_DELETE_ME)

/obj/item/buttonofnormal/proc/do_size_effect(atom/A)
	var/mob/living/capsulehit = A
	capsulehit.resize(sizetouse)
	sizetouse = rand(25,200)/100 //randmization occurs after press

/obj/item/buttonofnormal/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/pen))
		colorindex = (colorindex + 1) % 6
		icon_state = "mobcap[colorindex]"
		update_icon()
	if(istype(W, /obj/item/card/id))
		capsuleowner = null
	..()

/obj/item/buttonofnormal/proc/nonrandom() //Secret ball randmoizer rig code
	switch(colorindex)
		if(1)	sizetouse = RESIZE_HUGE
		if(2)	sizetouse = RESIZE_BIG
		if(3)	sizetouse = RESIZE_NORMAL
		if(4)	sizetouse = RESIZE_SMALL
		if(5)	sizetouse = RESIZE_TINY

/obj/item/daredevice
	name = "Dare button"
	desc = "A strange button, the only distinguishing feature being an engraved text reading 'Suffer to Gain.'."
	icon = 'icons/obj/mobcap.dmi'
	icon_state = "mobcap1"
	matter = list(DEFAULT_WALL_MATERIAL = 5000)
	throwforce = 00
	throw_speed = 2
	throw_range = 20
	force = 0
	var/luckynumber7 = 0
	var/colorindex = 1

	var/list/winitems = list(
				/obj/item/reagent_containers/food/snacks/sugarcookie,
				/obj/item/spacecasinocash,
				/obj/item/reagent_containers/syringe/drugs,
	)

/obj/item/daredevice/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/pen))
		colorindex += 1
		if(colorindex >= 6)
			colorindex = 0
		icon_state = "mobcap[colorindex]"
		update_icon()
	..()

/obj/item/daredevice/attack_self(mob/user)
	var/mob/living/capsuleowner = user
	playsound(src, 'sound/effects/splat.ogg', 30, 1)
	var/item = pick(winitems)
	sleep(100)
	switch(luckynumber7)
		if(1)	capsuleowner.resize(RESIZE_TINY) //Loss Shrinking!
		if(2)	capsuleowner.apply_damage(5, BRUTE) //Loss Damaging!
		if(3)	capsuleowner.Weaken(5) //Loss Knee spaghetti!
		if(4)	capsuleowner.hallucination += 66 //loss woah, dude.
		if(5)	new	item(capsuleowner.loc) //Win!
		if(7)
			new	/obj/item/material/butterfly/switchblade(capsuleowner.loc)
			capsuleowner.apply_damage(10, BRUTE) //Loss Damaging! WIN KNIVE!
		if(9)
			new	/obj/item/gun/energy/sizegun/not_advanced(capsuleowner.loc)
			qdel(src)
		if(777)	new	/obj/item/spacecash/c1000(capsuleowner.loc) //for rigging
		else luckynumber7 = (rand(0,10))
	luckynumber7 = rand(0,10)
	sleep(100)
	playsound(src.loc, 'sound/machines/slotmachine.ogg', 25, 1)

//items literally just made for the above item spawner

//
//BADvanced size gun
//
/obj/item/gun/energy/sizegun/not_advanced
	name = "\improper corrupted size gun"	// CHOMPedit Adds \improper
	desc = "A highly advanced ray gun with a knob on the side to adjust the size you desire. Or at least that's what it used to be."
	projectile_type = /obj/item/projectile/beam/sizelaser/chaos
	charge_cost = 60 //1/3 of the base price for a normal one.
//
//CHAOS laser
//
/obj/item/projectile/beam/sizelaser/chaos //The Defintiely not advanced sizeguns laser.
	name = "chaos size beam"
	light_color = "#FF0000"
	light_range = 3
	light_power = 9 //should be plenty visible.
	var/list/chaos_colors = list(
					"#FF0000",
					"#00FF00",
					"#0000FF",
					"#FFFF00",
					"#00FFFF",
					"#FF00FF",
					"#000000",
					"#FFFFFF",
					"#F0F0F0",
					"#0F0F0F",
					)

/obj/item/projectile/beam/sizelaser/chaos/on_hit(var/atom/target)
	light_color = pick(chaos_colors)
	var/chaos = rand(25,200)
	var/mob/living/M = target
	if(ishuman(target))
		var/mob/living/carbon/human/H = M
		H.resize(chaos/100)
		H.show_message(span_purple("The beam fires into your body, changing your size!"))
		H.update_icon()
	else if (istype(target, /mob/living/))
		var/mob/living/H = M
		H.resize(chaos/100)
		H.update_icon()
	else
		return 1
