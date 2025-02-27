/mob/living/simple_mob/animal/sif/kururak
	icon = 'modular_chomp/icons/mob/vore64x64_ch.dmi' // New file path.
	vore_bump_chance = 50
	vore_bump_emote = "dazzles and HOMPHs"
	vore_capacity = 2

/mob/living/simple_mob/animal/sif/kururak/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.desc = vore_stomach_flavor ? vore_stomach_flavor : "You find yourself trapped inside in the stretchy hammock-like flesh of \the [name]'s ferociously caustic gut. The atmosphere is hot and steamy with an unpleasant aroma like bile and seafood. Potent gastric juices are oozing from the slimy walls, drenching every inch of you until you're soaked in sizzling acid. You can already tell by the sharpness of the sensation that you're not going to last for long. The kururak's digestive system is known to be much stronger than most beasts, as its diet is entirely meat. If you don't get out of its belly quickly, you'll be churned away into soup."
	B.digest_mode = vore_default_mode // Set to digest by default.
	B.mode_flags = DM_FLAG_LEAVEREMAINS | DM_FLAG_THICKBELLY
	B.contaminates = vore_default_contaminates
	B.escapechance = vore_escape_chance // I don't know what the escape chance is but it's probably fine as is.
	B.digestchance = vore_digest_chance
	B.absorbchance = vore_absorb_chance
	B.human_prey_swallow_time = swallowTime/2 // Double the swallow speed. These are snappy little things.
	B.nonhuman_prey_swallow_time = swallowTime/2 // Ditto.
	B.vore_verb = "scarf down"
//	B.emote_lists[DM_HOLD] = list() // The defaults are probably fine but these creatures will probably not be endo.
	B.emote_lists[DM_DIGEST] = list(
		"You are steadily churned by a ferocious hot gurgling as \the [name]'s digestive system works to break you down into nutrients.",
		"\the [name] rurrs to itself in delight at the weight of fresh prey now sloshing in its bloated underbelly.",
		"The rippling walls of \the [name]'s powerful stomach help to rub you down with a soaking of stinging acid.",
		"Burning gastric juices eat away at you with a feverish intensity. You can feel yourself melting as the seconds drag on.",
		"\the [name] bellows out an almost purring-like sound as you slosh inside of its sagging round gut.",
		"\the [name] burps up some of the noxious gasses that are produced by your digestion. The slimy prison closes in on you just that little bit more.",
		"Muscular stomach flesh grinds harshly against you from all sides, intent on pulverizing you until there's nothing left but mush.",
		"Caustic air stings your insides when you try to take a breath.",
		"\the [name]'s slimy gut squeezes inward to help the digestive juices soften you up. Everything aches, and it's only getting worse.",
		"The onslaught against your body doesn't seem to be letting up. You're just food now to \the [name] now.",
		"\the [name]'s insides ripple and crush against you as aggressive digestive enzymes steadily pull you apart.",
		"\the [name] corrosive juices pool beneath you, sizzling against your aching form.",
		"The churning walls slowly pulverize you into nothing but meaty mush.",
		"\the [name]'s stomach glorps and gurgles loudly as it works you into hot slurry.",
		"As you languish helplessly in \the [name]'s squashy guts, the beast can be felt waddling around on the prowl of its next hunt.",
		"The hypercarnivore spares no mercy for its victim. You can feel yourself getting weaker by the second as ruthless digestion snuffs you out.",
		"Your senses are getting bombarded by constant sizzling, squishing, and the bassy breathing of \the [name]'s three lungs.",
		"You feel short of breath as you try to inhale the foul gastric air.",
		"As digestion kneads away at your battered body, you're also suffocated by the heat and humidity of \the [name]'s boiling innards.",
		"Constant digestion squeezes and smothers as you're jostled around in this soggy sack of flesh.",
		"It hurts to breathe. It hurts to move. Soon you'll be pummeled down into \the [name]'s intestines and soaked up as calories to fuel its next hunt.",
		"*Ggllrrrgggnnrrnn...*",
		"*Blort... glrrsh... grrrroooooo...*",
		"*Fizzzzzzzzz... glorp... plsh*"
		)
	can_be_drop_pred = TRUE
	B.belly_fullscreen = "VBOanim_belly2"
	B.belly_fullscreen_color = "#823232"
	B.belly_fullscreen_color2 = "#232300"