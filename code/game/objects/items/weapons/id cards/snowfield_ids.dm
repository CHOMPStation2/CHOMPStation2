/obj/item/weapon/card/id/gateway/snowfield // Basic access
	name = "Class 1 ID"
	desc = "An ID card with a basic access for the base. There's a mark of a \
	red star in the corner with hammer and sickle inside."
	initial_sprite_stack = list("base-stamp", "top-generic", "stamp-s", "clip")

/obj/item/weapon/card/id/gateway/snowfield/class2 // Service
	name = "Class 2 ID"
	desc = "An ID card with a service work access for the base.There's a mark of \
	a red star in the corner with hammer and sickle inside."
	initial_sprite_stack = list("base-stamp","top-green", "stamp-s", "clip")
	access = list(26, 28)

/obj/item/weapon/card/id/gateway/snowfield/class3M // Medical
	name = "Class 3M ID"
	desc = "An ID card with an advanced medical support access for the base. \
	There's a mark of a red star in the corner with hammer and sickle inside."
	initial_sprite_stack = list("base-stamp","top-medblu", "stamp-s", "pips-medblu", "clip")
	access = list(5, 33, 45)

/obj/item/weapon/card/id/gateway/snowfield/class3E // Engineering Part time worker
	name = "Class 3E ID"
	desc = "An ID card with a basic engineering support access for the base. \
	There's a mark of a red star in the corner with hammer and sickle inside."
	initial_sprite_stack = list("base-stamp", "top-orange", "stamp-s", "clip")
	access = list (10)

/obj/item/weapon/card/id/gateway/snowfield/class4 // Security
	name = "Class 4 ID"
	desc = "An ID card with a security access for the base. There's a mark of a \
	red star in the corner with hammer and sickle inside."
	initial_sprite_stack = list("base-stamp", "top-red", "stamp-s", "clip")
	access = list (1, 2)

/obj/item/weapon/card/id/gateway/snowfield/class4D // Detective
	name = "Class 4D ID"
	desc = "An ID card with a forensic security access for the base. There's a mark \
	of a red star in the corner with hammer and sickle inside."
	initial_sprite_stack = list("base-stamp", "top-red", "pips-brown", "stamp-s", "clip")
	access = list (1, 2, 4)

/obj/item/weapon/card/id/gateway/snowfield/class5R // Researcher
	name = "Class 5R ID"
	desc = "An ID card with a research access for the base. There's a mark of a red \
	star in the corner with hammer and sickle inside."
	initial_sprite_stack = list("base-stamp", "top-purple", "stamp-s", "clip")
	access = list (47, 61)

/obj/item/weapon/card/id/gateway/snowfield/class5E // Engineering
	name = "Class 5E ID"
	desc = "An ID card with an advanced engineering access for the base. There's a mark \
	of a red star in the corner with hammer and sickle inside."
	initial_sprite_stack = list("base-stamp-dark", "top-orange", "stripe-white", "stamp-s", "clip")
	access = list (10, 11)

/obj/item/weapon/card/id/gateway/snowfield/class6S // Head of Security-Warden
	name = "Class 6S ID"
	desc = "An ID card with a full access towards the security of the base. There's a \
	mark of a red star in the corner with hammer and sickle inside."
	initial_sprite_stack = list("base-stamp-dark", "top-red", "stripe-gold", "stamp-s", "clip")
	access = list (1, 2, 3, 4)

/obj/item/weapon/card/id/gateway/snowfield/class6R // Research Director
	name = "Class 6R ID"
	desc = "An ID card with a full access towards the secrets of the base. There's a mark of a red \
	star in the corner with hammer and sickle inside."
	initial_sprite_stack = list("base-stamp-dark", "top-purple", "stripe-gold", "stamp-s", "clip")
	access = list (30, 47, 61)

/obj/item/weapon/card/id/gateway/snowfield/class7 // Facility Director
	name = "Class 7"
	desc = "An ID card with a full access through out the base. There's a mark of a red \
	star in the corner with hammer and sickle inside."
	initial_sprite_stack = list("base-stamp-dark", "top-blue", "pips-gold", "stripe-gold", "stamp-s", "clip")
	access = list (1, 3, 20, 30, 47, 61)