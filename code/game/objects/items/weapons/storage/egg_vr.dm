//Item type vorepanel egg release containers.

/obj/item/storage/vore_egg // CHOMPEdit - Removal of obj/item/weapon
	name = "egg"
	desc = "It's an egg; it's smooth to the touch." //This is the default egg.
	icon = 'icons/obj/egg_new_vr.dmi'
	icon_state = "egg"
	var/open_egg_icon = 'icons/obj/egg_open_vr.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_storage.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_storage.dmi',
		)
	w_class = 2
	max_w_class = 0
	show_messages = 0
	allow_quick_empty = TRUE
	use_sound = 'sound/items/drop/flesh.ogg'
	var/egg_name = null //CHOMPAdd

/obj/item/storage/vore_egg/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	randpixel_xy()

/obj/item/storage/vore_egg/open(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(isobserver(user))
		return
	icon = open_egg_icon
	..()

/obj/item/storage/vore_egg/proc/hatch(mob/living/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	visible_message("<span class='danger'>\The [src] begins to shake as something pushes out from within!</span>")
	animate_shake()
	if(do_after(user, 50))
		if(use_sound)
			playsound(src, src.use_sound, 50, 0, -5)
		animate_shake()
		drop_contents()
		icon = open_egg_icon
		if(user.transforming)
			user.transforming = FALSE

/obj/item/storage/vore_egg/proc/animate_shake() // CHOMPEdit - Removal of obj/item/weapon
	var/init_px = pixel_x
	var/shake_dir = pick(-1, 1)
	animate(src, transform=turn(matrix(), 8*shake_dir), pixel_x=init_px + 2*shake_dir, time=1)
	animate(transform=null, pixel_x=init_px, time=6, easing=ELASTIC_EASING)

/obj/item/storage/vore_egg/unathi // CHOMPEdit - Removal of obj/item/weapon
	name = "unathi egg"
	desc = "Some species of Unathi apparently lay soft-shelled eggs!"
	icon_state = "egg_unathi"

/obj/item/storage/vore_egg/nevrean // CHOMPEdit - Removal of obj/item/weapon
	name = "nevrean egg"
	desc = "Most Nevreans lay hard-shelled eggs!"
	icon_state = "egg_nevrean"

/obj/item/storage/vore_egg/human // CHOMPEdit - Removal of obj/item/weapon
	name = "human egg"
	desc = "Some humans lay eggs that are--wait, what?"
	icon_state = "egg_human"

/obj/item/storage/vore_egg/tajaran // CHOMPEdit - Removal of obj/item/weapon
	name = "tajaran egg"
	desc = "Apparently that's what a Tajaran egg looks like. Weird."
	icon_state = "egg_tajaran"

/obj/item/storage/vore_egg/skrell // CHOMPEdit - Removal of obj/item/weapon
	name = "skrell egg"
	desc = "Its soft and squishy"
	icon_state = "egg_skrell"

/obj/item/storage/vore_egg/shark // CHOMPEdit - Removal of obj/item/weapon
	name = "akula egg"
	desc = "Its soft and slimy to the touch"
	icon_state  = "egg_akula"

/obj/item/storage/vore_egg/sergal // CHOMPEdit - Removal of obj/item/weapon
	name = "sergal egg"
	desc = "An egg with a slightly fuzzy exterior, and a hard layer beneath."
	icon_state = "egg_sergal"

/obj/item/storage/vore_egg/slime // CHOMPEdit - Removal of obj/item/weapon
	name = "slime egg"
	desc = "An egg with a soft and squishy interior, coated with slime."
	icon_state = "egg_slime"

/obj/item/storage/vore_egg/special //Not actually used, but the sprites are in, and it's there in case any admins need to spawn in the egg for any specific reasons. // CHOMPEdit - Removal of obj/item/weapon
	name = "special egg"
	desc = "This egg has a very unique look to it."
	icon_state = "egg_unique"

/obj/item/storage/vore_egg/scree // CHOMPEdit - Removal of obj/item/weapon
	name = "Chimera egg"
	desc = "...You don't know what type of creature laid this egg."
	icon_state = "egg_scree"

/obj/item/storage/vore_egg/xenomorph // CHOMPEdit - Removal of obj/item/weapon
	name = "Xenomorph egg"
	desc = "Some type of pitch black egg. It has a slimy exterior coating."
	icon_state = "egg_xenomorph"

/obj/item/storage/vore_egg/chocolate // CHOMPEdit - Removal of obj/item/weapon
	name = "chocolate egg"
	desc = "Delicious. May contain a choking hazard."
	icon_state = "egg_chocolate"

/obj/item/storage/vore_egg/owlpellet // CHOMPEdit - Removal of obj/item/weapon
	name = "boney egg"
	desc = "Can an egg shell be made of bones and hair?"
	icon_state = "egg_pellet"

/obj/item/storage/vore_egg/slimeglob // CHOMPEdit - Removal of obj/item/weapon
	name = "glob of slime"
	desc = "Very squishy."
	icon_state = "egg_slimeglob"

/obj/item/storage/vore_egg/chicken // CHOMPEdit - Removal of obj/item/weapon
	name = "chicken egg"
	desc = "Looks like chickens come in all sizes and shapes."
	icon_state = "egg_chicken"

/obj/item/storage/vore_egg/synthetic // CHOMPEdit - Removal of obj/item/weapon
	name = "synthetic egg"
	desc = "Smells like Easter morning."
	icon_state = "egg_synthetic"

/obj/item/storage/vore_egg/escapepod // CHOMPEdit - Removal of obj/item/weapon
	name = "small escape pod"
	desc = "Someone left in a hurry."
	icon_state = "egg_escapepod"

/obj/item/storage/vore_egg/floppy // CHOMPEdit - Removal of obj/item/weapon
	name = "blue space floppy disc"
	desc = "Probably shouldn't copy THIS floppy."
	icon_state = "egg_floppy"

/obj/item/storage/vore_egg/cd // CHOMPEdit - Removal of obj/item/weapon
	name = "blue space cd"
	desc = "What could even be on this?!"
	icon_state = "egg_cd"

/obj/item/storage/vore_egg/file // CHOMPEdit - Removal of obj/item/weapon
	name = "blue space file"
	desc = "Gotta wonder how much is compressed in there."
	icon_state = "egg_file"

/obj/item/storage/vore_egg/badrecipe // CHOMPEdit - Removal of obj/item/weapon
	name = "Burned mess"
	desc = "Someone didn't cook this egg quite right..."
	icon_state = "egg_badrecipe"

/obj/item/storage/vore_egg/cocoon // CHOMPEdit - Removal of obj/item/weapon
	name = "web cocoon"
	desc = "It straight up smells like spiders in here."
	icon_state = "egg_cocoon"

/obj/item/storage/vore_egg/honeycomb // CHOMPEdit - Removal of obj/item/weapon
	name = "honeycomb"
	desc = "Smells delicious!"
	icon_state = "egg_honeycomb"

/obj/item/storage/vore_egg/bugcocoon // CHOMPEdit - Removal of obj/item/weapon
	name = "bug cocoon"
	desc = "Metamorphosis!"
	icon_state = "egg_bugcocoon"

/obj/item/storage/vore_egg/rock // CHOMPEdit - Removal of obj/item/weapon
	name = "rock egg"
	desc = "It looks like a small boulder."
	icon_state = "egg_rock"

/obj/item/storage/vore_egg/yellow // CHOMPEdit - Removal of obj/item/weapon
	name = "yellow egg"
	desc = "It is a nice yellow egg."
	icon_state = "egg_yellow"

/obj/item/storage/vore_egg/blue // CHOMPEdit - Removal of obj/item/weapon
	name = "blue egg"
	desc = "It is a nice blue egg."
	icon_state = "egg_blue"

/obj/item/storage/vore_egg/green // CHOMPEdit - Removal of obj/item/weapon
	name = "green egg"
	desc = "It is a nice green egg."
	icon_state = "egg_green"

/obj/item/storage/vore_egg/orange // CHOMPEdit - Removal of obj/item/weapon
	name = "orange egg"
	desc = "It is a nice orange egg."
	icon_state = "egg_orange"

/obj/item/storage/vore_egg/purple // CHOMPEdit - Removal of obj/item/weapon
	name = "purple egg"
	desc = "It is a nice purple egg."
	icon_state = "egg_purple"

/obj/item/storage/vore_egg/red // CHOMPEdit - Removal of obj/item/weapon
	name = "red egg"
	desc = "It is a nice red egg."
	icon_state = "egg_red"

/obj/item/storage/vore_egg/rainbow // CHOMPEdit - Removal of obj/item/weapon
	name = "rainbow egg"
	desc = "It looks so colorful."
	icon_state = "egg_rainbow"

/obj/item/storage/vore_egg/pinkspots // CHOMPEdit - Removal of obj/item/weapon
	name = "spotted pink egg"
	desc = "It is a cute pink egg with white spots."
	icon_state = "egg_pinkspots"
