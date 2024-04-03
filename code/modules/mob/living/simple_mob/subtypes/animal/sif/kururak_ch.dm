/mob/living/simple_mob/animal/sif/kururak
	icon = 'modular_chomp/icons/mob/vore64x64_ch.dmi' //CHOMPEdit changed filepath


// Adds vore belly -- WIP DO NOT FUCKING ADD
/mob/living/simple_mob/animal/sif/kururak/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The snake coils its tail around you, pushing you to the ground and pinning you with its weight. It flicks its tongue at you, before pouncing onto your head, engulfing the upper half of your body with ease as it unhinges its jaw. With greedy swallows, it pulls you deeper, and deeper. The tight walls undulate rhythmically as the danger noodle rumbles contentedly at this new meal. The snake sends the last of you down with a deep swallow, hissing softly and closing its eyes as it enjoys its new meal, tucked away nicely under those beautiful, green scales."
	B.item_digest_mode = IM_DIGEST_FOOD
	B.mode_flags = DM_FLAG_THICKBELLY
	B.digestchance = 25
	B.escape_stun = 5

	B.emote_lists[DM_HOLD] = list(
		"A near-constant string of soft, slick noises drift over you as waves of peristalsis slowly drag you further within the possessive serpent.",
		"\the [name]'s stomach suddenly squishes inwards from everywhere at once, wrapping you up in a warm, doughy embrace before easing back again.",
		"A growing sense of relaxed lethargy seeps into your muscles the longer you're massaged over amidst those hot, humid confines.",
		"Slimy, heat-trapping muscles rhythmically ripple over and knead down into your figure, ensuring the snake's new filling was subdued.",
		"\the [name] occasionally hisses out in satisfaction as it feels your twitching, filling weight bulge out its scales before giving you a compressing squeeze.",
		"Hot, viscous ooze clings to and coats your body as time passes, encouraging you to submit and let the snake do all the serpentine, winding slithering.")
	B.emote_lists[DM_DIGEST] = list(
		"A chorus of sordid, slick sounds fill your senses as another wave of peristalsis ripples over you, tugging you a deeper into the serpent's digestive system.",
		"\the [name]'s all-encompassing stomach closes in tight around your figure, soaking acid into your flesh.",
		"You find it harder to breathe as time goes on, your dizziness growing as you lack the space to breathe in enough of that caustic, thinning air.",
		"\the [name]'s ample, kneading muscle gradually squeezes the strength and fight from your body with clench after clench.",
		"A pleased hiss emanates from the well fed serpent, clearly satisfied with the meal it's made out of you.",
		"Your movements grow sluggish as \the [name]'s oozing stomach walls cling to your entire body, drenchning you in corrosive juices.")
	B.struggle_messages_inside = list(
		"You jam your limbs against the tight walls in an effort to get some leverage.",
		"You writhe inside the tube-like gastric chamber in a bid to force yourself to freedom.",
		"You push back at the clenched sphincter at the entrance to \the [name]'s gut.")
	B.struggle_messages_outside = list(
		"\the [name]'s tail jostles around as something inside of it fights to escape.",
		"\the [name]'s tail lurches with the struggles of a live meal.")
	B.examine_messages = list(
		"\the [name]'s tail is swollen fat with a lump of prey it swallowed whole.")