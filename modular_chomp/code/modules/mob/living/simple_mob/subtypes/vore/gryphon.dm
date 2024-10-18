/mob/living/simple_mob/vore/gryphon
	name = "gryphon"
	desc = "A large, lazy feline-avian hybrid. Best not to walk too close to a gryphon alone."

	icon_state = "gryphon"
	icon_living = "gryphon"
	icon = 'modular_chomp/icons/mob/vore64x64_ch.dmi'
	vis_height = 64

	faction = FACTION_GRYPHON
	maxHealth = 200 // Pretty tanky, but not a boss
	health = 200
	see_in_dark = 8

	melee_damage_lower = 5
	melee_damage_upper = 30

	meat_amount = 15
	meat_type = /obj/item/reagent_containers/food/snacks/meat

	response_help = "pats"
	response_disarm = "tries to shove"
	response_harm = "hits"
	attacktext = list("scratches", "bites")

	friendly = list("beak-nudges", "purrs towards", "slobberlicks")
	vore_bump_emote = "tries to quickly devour"

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0
	mount_offset_y = 15
	mount_offset_x = -12
	max_buckled_mobs = 1
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE

	var/random_skin = TRUE
	var/list/skins = list(
		"gryphon"
	)

	special_attack_min_range = 2
	special_attack_max_range = 4
	special_attack_cooldown = 30 SECONDS

	devourable = FALSE

	ai_holder_type = /datum/ai_holder/simple_mob/vore/gryphon
	say_list_type = /datum/say_list/gryphon

	can_be_drop_prey = FALSE
	var/leap_warmup = 2 SECOND // How long the leap telegraphing is.
	var/leap_sound = 'sound/weapons/spiderlunge.ogg'

// Activate Noms!
/mob/living/simple_mob/vore/gryphon
	vore_bump_chance = 25
	vore_digest_chance = 100
	vore_pounce_chance = 100
	vore_active = TRUE
	vore_icons = 0
	vore_capacity = 2
	swallowTime = 20
	vore_ignores_undigestable = TRUE
	vore_default_mode = DM_DIGEST
	vore_pounce_maxhealth = 125
	vore_bump_emote = "tries to gulp down"
	vore_capacity_ex = list("stomach" = 1, "throat" = 1)
	vore_fullness_ex = list("stomach" = 0, "throat" = 0)
	vore_icon_bellies = list("stomach", "throat")

/datum/ai_holder/simple_mob/vore/gryphon
	var/eat_attempts = 0
	var/maybe_eating = null

/datum/ai_holder/simple_mob/vore/gryphon/find_target(list/possible_targets, has_targets_list)
	ai_log("find_target() : Entered.", AI_LOG_TRACE)
	var/targets = list()
	if(!has_targets_list)
		possible_targets = list_targets()
	var/mob/sentient = null
	var/alone = TRUE
	for(var/mob/possible_target in possible_targets)
		if(can_attack(possible_target)) // Can we attack it?
			targets += possible_target
			if (possible_target.client != null)
				if (sentient == null)
					if (vore_check(possible_target))
						sentient = possible_target
					else
						alone = FALSE
				else
					alone = FALSE

	// Only one player, consider eating them
	if (sentient != null)
		return possibly_eat(sentient, alone)

	// Only one mob, eat them
	if (length(targets) == 1 && alone)
		var/target = pick_target(targets)
		if (vore_check(target) && can_attack(target))
			give_target(target)
			return target
	eat_attempts = 0
	return null

/datum/ai_holder/simple_mob/vore/gryphon/proc/possibly_eat(var/target, var/alone)
	if (target != maybe_eating)
		eat_attempts = 0

	maybe_eating = target
	if (eat_attempts == 5)
		to_chat(target, span_danger("\The [holder] licks its beak"))
	else if (eat_attempts == 10)
		to_chat(target, span_danger("\The [holder]'s stomach grumbles loudly"))
	else if (alone && eat_attempts > 15 && can_attack(target))
		give_target(target)

	if (eat_attempts < 11 || alone)
		eat_attempts += 1

/mob/living/simple_mob/vore/gryphon/init_vore()
	if(!voremob_loaded)
		return
	if(LAZYLEN(vore_organs))
		return TRUE

	var/obj/belly/B = new /obj/belly/gryphon/beak(src)
	vore_selected = B
	B.affects_vore_sprites = FALSE
	B.emote_lists[DM_HOLD] = list("Test")
	B = new /obj/belly/gryphon/throat(src)
	B.affects_vore_sprites = TRUE
	B.belly_sprite_to_affect = "throat"
	B.emote_lists[DM_HOLD] = list("Test")
	B = new /obj/belly/gryphon/stomach(src)
	B.affects_vore_sprites = TRUE
	B.belly_sprite_to_affect = "stomach"
	B.emote_lists[DM_HOLD] = list("Test")
	B.emote_lists[DM_DIGEST] = list("Test")

/mob/living/simple_mob/vore/gryphon/do_special_attack(atom/A)	//Mostly copied from cryptdrake.dm
	set waitfor = FALSE
	if(!isliving(A))
		return FALSE
	var/mob/living/L = A
	if(!L.devourable || !L.allowmobvore || !L.can_be_drop_prey || !L.throw_vore || L.unacidable)
		return FALSE

	set_AI_busy(TRUE)
	visible_message(span_warning("\The [src] crouches down and wiggles its haunches!"))
	to_chat(L, span_danger("\The [src] is looking right at you!"))
	// Telegraph, since getting stunned suddenly feels bad.
	do_windup_animation(A, leap_warmup)
	sleep(leap_warmup) // For the telegraphing.

	if(L.z != z)	//Make sure you haven't disappeared to somewhere we can't go
		set_AI_busy(FALSE)
		return FALSE

	// Do the actual leap.
	status_flags |= LEAPING // Lets us pass over everything.
	visible_message(span_critical("\The [src] leaps at \the [L]!"))
	throw_at(get_step(L, get_turf(src)), special_attack_max_range+1, 1, src)
	playsound(src, leap_sound, 75, 1)

	sleep(5) // For the throw to complete. It won't hold up the AI ticker due to waitfor being false.

	if(status_flags & LEAPING)
		status_flags &= ~LEAPING // Revert special passage ability.

	set_AI_busy(FALSE)
	if(Adjacent(L))	//We leapt at them but we didn't manage to hit them, let's see if we're next to them
		L.Weaken(2)	//get knocked down, idiot

/mob/living/simple_mob/vore/gryphon/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	add_verb(src,/mob/living/simple_mob/proc/animal_mount) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/proc/toggle_rider_reins) //CHOMPEdit TGPanel
	movement_cooldown = 0

/mob/living/simple_mob/vore/gryphon/MouseDrop_T(mob/living/M, mob/living/user)
	return

/datum/say_list/gryphon
	emote_hear = list("squawks!", "looks around as its stomach growls.")
	emote_see = list("licks its beak.", "looks around.")
	say_maybe_target = list("squawks")
	say_got_target = list("screeches")

/obj/belly/gryphon
	autotransferchance = 50
	autotransferwait = 150
	fancy_vore = TRUE
	contamination_color = "green"
	contamination_flavor = "Wet"
	vore_verb = "chomp"
	belly_fullscreen_color = "#711e1e"

/obj/belly/gryphon/beak
	name = "Beak"
	mode_flags = DM_FLAG_THICKBELLY
	escapable = TRUE
	escapechance = 5
	desc = "Noticing you alone, the gryphon lunges forwards and wraps its beak around your head, forcing you to stare into the dark abyss at the back of the gryphon's throat. It quickly tries to swallow you down, beak closing around your torso and head tilting back, letting gravity help make you disappear before anyone sees."
	struggle_messages_inside = list(
		"You try to push the gryphon's tongue away, instead getting tossed around and savoured by the massive beast",
		"Pressing against the beak around your body, you barely pry them off of your torso, trying to wiggle out-- only for the gryphon to clamp right back down around you and continue swallowing their meal",
		"You try to shy away from the back of the gryphon's maw, desperately avoiding the massive beast's gullet. The gryphon easily counterracts your efforts, pushing you closer and closer towards the fate that throat promises")
	autotransferlocation = "Throat"
	autotransfer_enabled = TRUE
	autotransferchance = 30
	autotransferwait = 5
	belly_fullscreen = "a_tumby"
	vore_sound = "Insertion1"

/obj/belly/gryphon/throat
	name = "Throat"
	mode_flags = DM_FLAG_THICKBELLY
	transferchance = 20
	transferlocation = "Beak"
	escapechance = 0
	desc = "...And that 'very, very soon' rapidly becomes 'now'. The mighty tongue lifts, having collected enough of your flavor, squelching your lower body up to your chest inside it's hot gullet, giving you an ample view of itself slithering up over your body. You get to watch it quiver and clench with a resounding glllk, around you, the tongue's fat bumpy rear lifting behind your head to displace you down and inside the clinging tunnel. Tight, crushing pressure embraces you with each of those deep, liquid-sounding swallows, inching you down little by little each time. The flesh of the tunnel wraps you tightly, leaving you mostly unable to move, given short moments of respite between each swallow, to listen to the thudding heartbeat and the distant glrrrbles deep below. The hot scent of acidity grows stronger, the deeper you plunge..."
	struggle_messages_inside = list(
		"With as much effort as you can muster, you squirm and writhe, trying to swim up the passage of soft flesh. You barely peek out the beast's gullet, before the back of it's tongue squelches into your face, forcing you back down.",
		"You struggle and press outwards firmly against the walls. The beast rumbles out over you, shaking you to your bones. Was that a sound of pleasure from the dragon? Perhaps more of this struggling might appease it...",
		"Bracing your back against a wall, you try to press outwards with all the strength you have, to spread the throat agape. For a moment, it affords you a nice view down your body, towards the sealed muscular entryway to it's stomach. Everything clenches back shut around you shortly after.",
		"More squirming and struggling outwards, trying to hold the throat's muscular walls at bay. Every time you press outwards, the walls press back with twice the strength. Much more of this and it might threaten to crush. Perhaps you should just give in...",
		"You frantically writhe upwards a couple of inches, before the beast swallows with a sloppy-sounding glllggk, sending you back down a foot or so. Each struggle you make only seems to hasten your journey down the hatch. ")
	autotransferlocation = "Stomach"
	autotransfer_enabled = TRUE
	autotransferchance = 50
	autotransferwait = 5
	belly_fullscreen = "another_tumby"
	vore_sound = "Tauric Swallow"

/obj/belly/gryphon/stomach
	name = "Stomach"
	mode_flags = DM_FLAG_THICKBELLY
	escapechance = 0
	transferchance = 10
	transferlocation = "Throat"
	desc = "The final part of your journey arrives, in the form of a tightly squelched, muscular sphincter. Throat pressure crams against you, until abruptly, you find yourself spat into a hot, caustic cauldron of churning doom, the dragon's stomach. After slithering in, the way you entered squelches shut, dissapearing among the folds - impossible for you to find any more. You are trapped, no way out, lounging in a shallow pool of thick sticky juices. endless undulations from thick, pendulous folds of stomach-wall all around continually churn it up into a foamy, bubbling mess, soaking their folds in it to drip in ropes and even shivering sheets of the stuff around you. Clenches gush the digestive slimes all over you from time to time, cradling you in it's noxious embrace. Your ears are filled with such sloppy squelches now, those distant muffled glrrns you heard earlier now sharp, crisp, and thunderous as you nestle in their very source. Settle down for what little time you have left, for your fate rests adding to the powerful beast all around you."
	digest_mode = DM_DIGEST
	digest_brute = 1
	digest_burn = 3
	struggle_messages_inside = list(
		"Eager to try and escape before you lack the strength to do so anymore, you pound firmly against those walls. They clench in twice as hard, the beast letting out a pleased rumble. Seems it wants you to do that again!",
		"You try to stand inside the clinging gut, to force your arms and head upwards towards the way you came in. Searching through each and every fold for the muscled entryway leaves you discovering nothing but caches of goop, soaking over you all the more.",
		"You press all your limbs out firmly into the walls to try and struggle. The softness of the flesh simply envelops over each of them, giving them a close kneading snuggle in hot oily goop.",
		"Each squirm and struggle you try to make just makes the beast rumble deeply in pleasure. It wriggles itself, sloshing and shaking you about, to try goad you into struggling all the more.",
		"Yet more frantic wriggling and squirming from you, pressing and thumping out into walls which themselves greedily devour all the effort you make into them. this deep inside, it doesn't appear to be helping.")
	belly_fullscreen = "anim_belly"
	vore_sound = "Stomach Move"
