/mob/living/simple_mob/humanoid/eclipse
	vore_active = 1
	vore_capacity = 2
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = null

	can_be_drop_prey = FALSE //CHOMP Add

/mob/living/simple_mob/humanoid/eclipse/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 3

/mob/living/simple_mob/humanoid/eclipse/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/humanoid/eclipse/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome preadtor gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach.."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with tour predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!",)

//This is placeholder code. Going to add special vorny for each of them slowly but surely.
/mob/living/simple_mob/humanoid/eclipse/head/scientist
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.

	can_be_drop_prey = FALSE //CHOMP Add
	digestable = 0
	devourable = 0

/mob/living/simple_mob/humanoid/eclipse/head/scientist/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/humanoid/eclipse/head/scientist/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/humanoid/eclipse/head/scientist/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome preadtor gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach.."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with tour predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",
		"Your surrondings glow with a neon red, dashes and spirals of pitch black flowing through the red gummy flesh as if it were a strange sky.",
		"Your satsified predator sways their bloated gullet happily, their warm rumbling vibrarting the stomach, and by extension you.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!",
		"The caustic red acid splashes, and washes over your frame, your sense of smell being overwhelmed by acid and sulfur as you're turned to nutrion.",
		"Every swift swap of the predator's hips sends you slamming against the glowing red sides, your vision blurring further as you contunie to weaken." ,)

/mob/living/simple_mob/humanoid/eclipse/head/security
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.

	can_be_drop_prey = FALSE //CHOMP Add
	digestable = 0
	devourable = 0

/mob/living/simple_mob/humanoid/eclipse/head/security/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/humanoid/eclipse/head/security/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/humanoid/eclipse/head/security/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome preadtor gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach.."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with tour predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",
		"Your surrondings glow with a neon red, dashes and spirals of pitch black flowing through the red gummy flesh as if it were a strange sky.",
		"Your satsified predator sways their bloated gullet happily, their warm rumbling vibrarting the stomach, and by extension you.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!",
		"The caustic red acid splashes, and washes over your frame, your sense of smell being overwhelmed by acid and sulfur as you're turned to nutrion.",
		"Every swift swap of the predator's hips sends you slamming against the glowing red sides, your vision blurring further as you contunie to weaken." ,)


/mob/living/simple_mob/humanoid/eclipse/head/captain
	vore_active = 1
	vore_capacity = 6
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.

	can_be_drop_prey = FALSE //CHOMP Add
	digestable = 0
	devourable = 0

/mob/living/simple_mob/humanoid/eclipse/head/captain/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 1

/mob/living/simple_mob/humanoid/eclipse/head/captain/MouseDrop_T(mob/living/M, mob/living/user)
	return

/mob/living/simple_mob/humanoid/eclipse/head/captain/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The fearsome preadtor gets a firm grip upon you, before dunking you into it's maw, then with a powerful swift gulp you're sent tumbling into it's stomach.."

	B.emote_lists[DM_HOLD] = list(
		"Your surroundings are momentarily filled with tour predator's pleased rumbling, its hands stroking over the taut swell you make in its belly.",
		"Your surrondings glow with a neon red, dashes and spirals of pitch black flowing through the red gummy flesh as if it were a strange sky.",
		"Your satsified predator sways their bloated gullet happily, their warm rumbling vibrarting the stomach, and by extension you.",)

	B.emote_lists[DM_DIGEST] = list(
		"Every clench of the predator's stomach grinds powerful digestive fluids into your body, forcibly churning away your strength!",
		"The caustic red acid splashes, and washes over your frame, your sense of smell being overwhelmed by acid and sulfur as you're turned to nutrion.",
		"Every swift swap of the predator's hips sends you slamming against the glowing red sides, your vision blurring further as you contunie to weaken." ,)
