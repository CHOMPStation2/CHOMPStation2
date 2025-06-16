/obj/item/holosign_creator/forcewand
	name = "wand of force"
	desc = "A strange wand with odd bits of wires and circuits poking out."
	icon = 'modular_chomp/icons/obj/guns/fakemagic.dmi'
	icon_state = "forcewand"
	holosign_type = /obj/structure/holosign/barrier/forcebarrier
	creation_time = 5
	max_signs = 3

/obj/item/holosign_creator/smokewand
	name = "wand of smoke"
	desc = "A strange wand with odd bits of wires and circuits poking out."
	icon = 'modular_chomp/icons/obj/guns/fakemagic.dmi'
	icon_state = "smokewand"
	holosign_type = /obj/structure/holosign/barrier/smokewall
	creation_time = 0
	max_signs = 10

/obj/structure/holosign/barrier/forcebarrier
	name = "force barrier"
	desc = "A strange nigh invisible wall."
	icon = 'modular_chomp/icons/obj/guns/fakemagic.dmi'
	icon_state = "forcewall"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_TURF_LAYER
	can_atmos_pass = ATMOS_PASS_NO

/obj/structure/holosign/barrier/smokewall
	name = "force barrier"
	desc = "A wall of smoke."
	icon = 'modular_chomp/icons/obj/guns/fakemagic.dmi'
	icon_state = "smokewall"
	anchored = TRUE
	density = FALSE
	layer = ABOVE_TURF_LAYER

//Maybe shock staff later

/obj/item/gun/magic/firestaff/cultstaff
	name = "cultist staff"
	desc = "A strange staff, bits of lose wires and circuit poking out from the wooden handle."
	icon = 'modular_chomp/icons/obj/guns/fakemagic.dmi'
	icon_state = "cultstaff"
	w_class = ITEMSIZE_NORMAL
	checks_antimagic = FALSE
	max_charges = 5
	charges = 5
	recharge_rate = 1
	charge_tick = 0
	can_charge = TRUE

	projectile_type = /obj/item/projectile/beam/inversion
