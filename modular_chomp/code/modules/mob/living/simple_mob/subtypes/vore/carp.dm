/mob/living/simple_mob/animal/space/carp/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "Stomach"
	B.desc = "The toothy jaws of the space carp gnash down around your body while its throat opens up to suck you inside. The vicious attack is too swift for you to stop it. You're dragged down its short esophagus, then dumped into its muscular digestive system. Your body curls tight in the cramped confines of its slimy stomach; pushing aside a caustic mixture of other unrecognizable detritus. You realize the soupy chime consists of past explorers who went missing long ago. If you can't push your way back up to freedom, your fate will be the same."
	B.mode_flags = DM_FLAG_THICKBELLY
	B.digest_brute = 0.5
	B.digest_burn = 0.5
	B.escapechance = 20
	B.belly_fullscreen = "anim_belly"
	B.belly_fullscreen_color = "#660021"
	B.belly_fullscreen_color2 = "#660021"
	B.fancy_vore = 1

	B.emote_lists[DM_DIGEST] = list(
		"They say a space carp's belly can digest almost anything. You're going to find out first hand if you stay here for much longer.",
		"The gastric fluids sizzle ferociously as they ooze across your form.",
		"A possessive squeeze of the wrinkled walls forces you to scrunch against yourself, as if to say you're not even a bother. This powerful digestive system has processed far more hazardous prey than you.",
		"The rubbery flesh of the carp's stomach lining constantly pulverizes you from all sides.",
		"Slowly but surely, everything around you is digested. Organic or not, it's all nourishment to the carp.",
		"The carp's disgusting innards slowly mix you around with acid. As far as it's concerned, you're nothing but fish food now.",
		"The stomach walls of the fishy predator push against you from all sides, smushing you into the leftovers of the last adventurer to wind up here.",
		"The carp's belly gushes over you with slow, muscular compressions. Every passing second allows more acid to be rubbed against you."
		)

	B.struggle_messages_inside = list(
		"You jab with all your strength to free yourself from the carp's putrid gut.",
		"The carp's belly bounces at your thrashing while the creature hunts its next meal.",
		"You push and pry at the stomach sphincter, trying to force your way out.",
		"You shove against the back of the carp's stomach for leverage as you try forcing your head up its throat.",
		"You try to wriggle yourself out of the carp's belly before it grinds you into chum.",
		"Your feisty squirming is rewarded with a tight CLENCH from all sides. The carp stubbornly reminds you that it has eaten far worse."
		)

	B.struggle_messages_outside = list(
		"%pred's stomach lurches with movement beneath its underbelly scales. Someone is alive in there!"
		)
