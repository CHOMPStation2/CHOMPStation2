////////////////////////////////////////////////////////////////////////////////
/// Pills.
////////////////////////////////////////////////////////////////////////////////
/obj/item/reagent_containers/pill // CHOMPEdit - Removal of obj/item/weapon
	name = "pill"
	desc = "A pill."
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	item_state = "pill"
	drop_sound = 'sound/items/drop/food.ogg'
	pickup_sound = 'sound/items/pickup/food.ogg'

	var/base_state = "pill"

	possible_transfer_amounts = null
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_EARS
	volume = 60

/obj/item/reagent_containers/pill/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	if(!icon_state)
		icon_state = "[base_state][rand(1, 4)]" //preset pills only use colour changing or unique icons

/obj/item/reagent_containers/pill/attack(mob/M as mob, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(M == user)
		if(istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = M
			if(!H.check_has_mouth())
				to_chat(user, "Where do you intend to put \the [src]? You don't have a mouth!")
				return
			var/obj/item/blocked = H.check_mouth_coverage()
			if(blocked)
				// to_chat(user, "<span class='warning'>\The [blocked] is in the way!</span>")
				balloon_alert(user, "\The [blocked] is in the way!") // CHOMPEdit - Changed to balloon alert
				return

			// to_chat(M, "<span class='notice'>You swallow \the [src].</span>")
			balloon_alert(user, "Swallowed \the [src]")	// CHOMPEdit - Changed to balloon alert
			M.drop_from_inventory(src) //icon update
			if(reagents.total_volume)
				reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
			qdel(src)
			return 1

	else if(istype(M, /mob/living/carbon/human))

		var/mob/living/carbon/human/H = M
		if(!H.check_has_mouth())
			// to_chat(user, "Where do you intend to put \the [src]? \The [H] doesn't have a mouth!")
			balloon_alert(user, "\The [H] doesn't have a mouth.") // CHOMPEdit - Changed to balloon alert
			return
		var/obj/item/blocked = H.check_mouth_coverage()
		if(blocked)
			// to_chat(user, "<span class='warning'>\The [blocked] is in the way!</span>")
			balloon_alert(user, "\The [blocked] is in the way!") // CHOMPEdit - Changed to balloon alert
			return

		// user.visible_message("<span class='warning'>[user] attempts to force [M] to swallow \the [src].</span>")
		balloon_alert_visible("[user] attempts to force [M] to swallow \the [src].") // CHOMPEdit - Changed to balloon alert

		user.setClickCooldown(user.get_attack_speed(src))
		if(!do_mob(user, M))
			return

		user.drop_from_inventory(src) //icon update
		// user.visible_message("<span class='warning'>[user] forces [M] to swallow \the [src].</span>")
		balloon_alert_visible("[user] forces [M] to swallow \the [src].") // CHOMPEdit - Changed to balloon alert

		var/contained = reagentlist()
		add_attack_logs(user,M,"Fed a pill containing [contained]")

		if(reagents && reagents.total_volume)
			reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
		qdel(src)

		return 1

	return 0

/obj/item/reagent_containers/pill/afterattack(obj/target, mob/user, proximity) // CHOMPEdit - Removal of obj/item/weapon
	if(!proximity) return

	if(target.is_open_container() && target.reagents)
		if(!target.reagents.total_volume)
			// to_chat(user, "<span class='notice'>[target] is empty. Can't dissolve \the [src].</span>")
			balloon_alert(user, "[target] is empty.") // CHOMPEdit - Changed to balloon alert
			return
		// to_chat(user, "<span class='notice'>You dissolve \the [src] in [target].</span>")
		balloon_alert_visible("[user] puts something in \the [target]", "[target] dissolves in \the [src]", 2) // CHOMPEdit - Changed to balloon alert

		add_attack_logs(user,null,"Spiked [target.name] with a pill containing [reagentlist()]")

		reagents.trans_to(target, reagents.total_volume)
		/* for(var/mob/O in viewers(2, user)) // CHOMPEdit - balloon_alert_visible handles this
			O.show_message("<span class='warning'>[user] puts something in \the [target].</span>", 1)
		*/
		qdel(src)

	return

/obj/item/reagent_containers/pill/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(is_sharp(W))
		var/obj/item/reagent_containers/powder/J = new /obj/item/reagent_containers/powder(src.loc) // CHOMPEdit - Removal of obj/item/weapon
		// user.visible_message("<span class='warning'>[user] gently cuts up [src] with [W]!</span>")
		balloon_alert_visible("[user] gently cuts up [src] with [W]!", "You gently cut up \the [src] with [W]") // CHOMPEdit - Changed to balloon alert
		playsound(src.loc, 'sound/effects/chop.ogg', 50, 1)

		if(reagents)
			reagents.trans_to_obj(J, reagents.total_volume)
		J.get_appearance()
		qdel(src)

	if(istype(W, /obj/item/card/id)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/reagent_containers/powder/J = new /obj/item/reagent_containers/powder(src.loc) // CHOMPEdit - Removal of obj/item/weapon
		// user.visible_message("<span class='warning'>[user] clumsily cuts up [src] with [W]!</span>")
		balloon_alert_visible("[user] clumsily cuts up [src] with [W]!", "You clumsily cut up \the [src] with [W]") // CHOMPEdit - Changed to balloon alert
		playsound(src.loc, 'sound/effects/chop.ogg', 50, 1)

		if(reagents)
			reagents.trans_to_obj(J, reagents.total_volume)
		J.get_appearance()
		qdel(src)

	return ..()

////////////////////////////////////////////////////////////////////////////////
/// Pills. END
////////////////////////////////////////////////////////////////////////////////

//Pills
/obj/item/reagent_containers/pill/antitox // CHOMPEdit - Removal of obj/item/weapon
	name = "Dylovene (30u)" //VOREStation Edit
	desc = "Neutralizes many common toxins."
	icon_state = "pill1"

/obj/item/reagent_containers/pill/antitox/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("anti_toxin", 30) //VOREStation Edit
	color = reagents.get_color()

/obj/item/reagent_containers/pill/tox // CHOMPEdit - Removal of obj/item/weapon
	name = "Toxins pill"
	desc = "Highly toxic."
	icon_state = "pill4"

/obj/item/reagent_containers/pill/tox/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("toxin", 50)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/cyanide // CHOMPEdit - Removal of obj/item/weapon
	name = "Strange pill"
	desc = "It's marked 'KCN'. Smells vaguely of almonds."
	icon_state = "pill9"

/obj/item/reagent_containers/pill/cyanide/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("cyanide", 50)


/obj/item/reagent_containers/pill/adminordrazine // CHOMPEdit - Removal of obj/item/weapon
	name = "Adminordrazine pill"
	desc = "It's magic. We don't have to explain it."
	icon_state = "pillA"

/obj/item/reagent_containers/pill/adminordrazine/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("adminordrazine", 5)


/obj/item/reagent_containers/pill/stox // CHOMPEdit - Removal of obj/item/weapon
	name = "Soporific (15u)"
	desc = "Commonly used to treat insomnia."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/stox/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("stoxin", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/kelotane // CHOMPEdit - Removal of obj/item/weapon
	name = "Kelotane (20u)" //VOREStation Edit
	desc = "Used to treat burns."
	icon_state = "pill3"

/obj/item/reagent_containers/pill/kelotane/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("kelotane", 20) //VOREStation Edit
	color = reagents.get_color()

/obj/item/reagent_containers/pill/paracetamol // CHOMPEdit - Removal of obj/item/weapon
	name = "Paracetamol (15u)"
	desc = "Paracetamol! A painkiller for the ages. Chewables!"
	icon_state = "pill3"

/obj/item/reagent_containers/pill/paracetamol/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("paracetamol", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/tramadol // CHOMPEdit - Removal of obj/item/weapon
	name = "Tramadol (15u)"
	desc = "A simple painkiller."
	icon_state = "pill3"

/obj/item/reagent_containers/pill/tramadol/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("tramadol", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/methylphenidate // CHOMPEdit - Removal of obj/item/weapon
	name = "Methylphenidate (15u)"
	desc = "Improves the ability to concentrate."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/methylphenidate/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("methylphenidate", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/citalopram // CHOMPEdit - Removal of obj/item/weapon
	name = "Citalopram (15u)"
	desc = "Mild anti-depressant."
	icon_state = "pill4"

/obj/item/reagent_containers/pill/citalopram/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("citalopram", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/dexalin // CHOMPEdit - Removal of obj/item/weapon
	name = "Dexalin (7.5u)" //VOREstation Edit
	desc = "Used to treat oxygen deprivation."
	icon_state = "pill1"

/obj/item/reagent_containers/pill/dexalin/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("dexalin", 7.5) //VOREStation Edit
	color = reagents.get_color()

/obj/item/reagent_containers/pill/dexalin_plus // CHOMPEdit - Removal of obj/item/weapon
	name = "Dexalin Plus (15u)"
	desc = "Used to treat extreme oxygen deprivation."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/dexalin_plus/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("dexalinp", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/dermaline // CHOMPEdit - Removal of obj/item/weapon
	name = "Dermaline (15u)"
	desc = "Used to treat burn wounds."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/dermaline/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("dermaline", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/dylovene // CHOMPEdit - Removal of obj/item/weapon
	name = "Dylovene (15u)"
	desc = "A broad-spectrum anti-toxin."
	icon_state = "pill1"

/obj/item/reagent_containers/pill/dylovene/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("anti_toxin", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/inaprovaline // CHOMPEdit - Removal of obj/item/weapon
	name = "Inaprovaline (30u)"
	desc = "Used to stabilize patients."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/inaprovaline/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("inaprovaline", 30)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/bicaridine // CHOMPEdit - Removal of obj/item/weapon
	name = "Bicaridine (20u)"
	desc = "Used to treat physical injuries."
	icon_state = "pill2"

/obj/item/reagent_containers/pill/bicaridine/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("bicaridine", 20)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/spaceacillin // CHOMPEdit - Removal of obj/item/weapon
	name = "Spaceacillin (15u)" //VOREStation Edit
	desc = "A theta-lactam antibiotic. Effective against many diseases likely to be encountered in space."
	icon_state = "pill3"

/obj/item/reagent_containers/pill/spaceacillin/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("spaceacillin", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/carbon // CHOMPEdit - Removal of obj/item/weapon
	name = "Carbon (30u)" //VOREStation Edit
	desc = "Used to neutralise chemicals in the stomach."
	icon_state = "pill3"

/obj/item/reagent_containers/pill/carbon/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("carbon", 30) //VOREStation Edit
	color = reagents.get_color()

/obj/item/reagent_containers/pill/iron // CHOMPEdit - Removal of obj/item/weapon
	name = "Iron (30u)" //VOREStation Edit
	desc = "Used to aid in blood regeneration after bleeding for red-blooded crew."
	icon_state = "pill1"

/obj/item/reagent_containers/pill/iron/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("iron", 30) //VOREStation Edit
	color = reagents.get_color()

/obj/item/reagent_containers/pill/copper // CHOMPEdit - Removal of obj/item/weapon
	name = "Copper (30u)"
	desc = "Used to aid in blood regeneration after bleeding for blue-blooded crew."
	icon_state = "pill1"

/obj/item/reagent_containers/pill/copper/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("copper", 30)
	color = reagents.get_color()

//Not-quite-medicine
/obj/item/reagent_containers/pill/happy // CHOMPEdit - Removal of obj/item/weapon
	name = "Happy pill"
	desc = "Happy happy joy joy!"
	icon_state = "pill4"

/obj/item/reagent_containers/pill/happy/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("bliss", 15)
	reagents.add_reagent("sugar", 15)
	color = reagents.get_color()

/obj/item/reagent_containers/pill/zoom // CHOMPEdit - Removal of obj/item/weapon
	name = "Zoom pill"
	desc = "Zoooom!"
	icon_state = "pill4"

/obj/item/reagent_containers/pill/zoom/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	if(prob(50))						//VOREStation edit begin: Zoom pill adjustments
		reagents.add_reagent("mold", 2)	//Chance to be more dangerous
	reagents.add_reagent("expired_medicine", 5)
	reagents.add_reagent("stimm", 5)	//VOREStation edit end: Zoom pill adjustments
	color = reagents.get_color()

/obj/item/reagent_containers/pill/diet // CHOMPEdit - Removal of obj/item/weapon
	name = "diet pill"
	desc = "Guaranteed to get you slim!"
	icon_state = "pill4"

/obj/item/reagent_containers/pill/diet/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	reagents.add_reagent("lipozine", 15) //VOREStation Edit
	color = reagents.get_color()
