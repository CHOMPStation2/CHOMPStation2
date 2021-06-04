/*
HARK, YON CODE DIVER.
What lays before you is a lot of spaghetti in order to make a fairly unique boss mob.
Scour its code if you dare.

Here's a summary, however.

This is a 128x64px mob with sprites drawn by Przyjaciel (thanks mate) and some codersprites.

The bigdragon is an 800 health hostile boss mob with three special attacks.
The first (disarm intent) is a charge attack that activates when the target is >5 tiles away and requires line of sight.
While charging, the dragon can run up/down cliffs harmlessly, but will thunk into objects for a brief stun.
Charging requires direct line of sight to start the attack.
Charging directly onto someone deals 50 brute and stuns them, likely with vore to follow.
Charging next to someone will deal 20 brute and send them flying.

The second (grab intent) is a tail sweep attack that activates when 2 or more hostiles are within 2 tiles of it.
The tail sweep deals 20 brute to all targets and throws them back a great distance with a brief stun.
Tail sweeping while ontop of a target will deal 50 brute like the charge above.

The third (harm intent) is a telegraphed flame swathe attack. The inidividual flame pellets deal 30 burn each and set mobs and carbons on fire alike.
This attack is the mobs default attack.

When the big dragon is below 1/2 health, or was previously friendly and was pissed off, it will enrage.
While enraged, the dragon will NOT stop and stand still while telegraphing its attacks.
This is exceptionally dangerous, as it will actively breathe fire whilest pursuing a target.

DO NOT challenge this beast in open fields. You need cover to survive.
Unless you're a tesh or something I guess. Speed.

As a flex, this mob has six vore organs.
It will swap between two variants (heal and digest) depending on if it's friendly or not.
It will eat prey with its maw, which has code in place to automatically push prey deeper over time.
The mob will only get increased "fullness" for prey who have made it to its stomach. Y'know. So the fat sprites make sense.

This mob can be made friendly by supplying it with a gold coin or a gold ingot. I'd make it every gold item, but then you could just raid its hoard for an easy tame. And that's lame.

While friendly, it will actively search for players with <95% health and attempt to vore them into its heal bellies.
On success, the targets are also injected with some helpful chemicals. Just to make sure they don't.. y'know, die while being swallowed.

The mobs icons are modular and interchangeable, there's even a neat verb in the abilities tab when player controlled to pick and choose what you want.
Otherwise, when naturally spawned, their icons are picked from a curated list.

I think I covered everything.
*/

///
///		Main type
///

/mob/living/simple_mob/vore/bigdragon
	name = "large dragon"
	desc = "A large, intimidating creature reminiscent of the traditional idea of medieval fire breathing lizards."
	catalogue_data = list(/datum/category_item/catalogue/fauna/bigdragon)
	tt_desc = "S Draco Ignis"
	icon = 'icons/mob/vore128x64_ch.dmi'
	player_msg = "You can perform a charge attack by disarm intent clicking somewhere. Grab intent clicking will perform a tail sweep and fling any nearby mobs. You can fire breath with harm intent. Your attacks have cooldowns associated with them. Be aware that your default vore organs automatically move prey, too!"
	meat_amount = 40
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	old_x = -48
	old_y = 0
	melee_damage_lower = 35
	melee_damage_upper = 25
	melee_miss_chance = 0
	melee_attack_delay = 0
	friendly = list("nudges", "sniffs on", "rumbles softly at", "slobberlicks")
	default_pixel_x = -48
	pixel_x = -48
	pixel_y = 0
	response_help = "pats"
	response_disarm = "shoves"
	response_harm = "smacks"
	movement_cooldown = 2
	maxHealth = 800
	attacktext = list("slashed")
	see_in_dark = 8
	minbodytemp = 0
	maxbodytemp = 99999
	heat_resist = 1
	ai_holder_type = /datum/ai_holder/simple_mob/intentional/dragon
	max_buckled_mobs = 1
	mount_offset_y = 32
	mount_offset_x = -16
	can_buckle = 1
	buckle_movable = 1
	buckle_lying = 0
	vore_bump_chance = 50
	vore_pounce_chance = 100
	vore_active = 1
	vore_icons = 2
	vore_capacity = 2
	vore_pounce_maxhealth = 125
	vore_bump_emote = "tries to snap up"
	icon_dead = "dragon-dead"
	faction = "dragon"
	glow_range = 7
	glow_intensity = 3
	glow_color = "#ED9200"
	say_list_type = /datum/say_list/bigdragon

	special_attack_min_range = 1
	special_attack_max_range = 10
	special_attack_cooldown = 80

	//For telegraphing
	plane = 7

	var/notame
	var/norange
	var/nospecial
	var/noenrage
	var/enraged
	var/gut1
	var/gut2

	tame_items = list(
	/obj/item/weapon/coin/gold = 100,
	/obj/item/stack/material/gold = 100
	)

	//recycling spider lunge with some modifications
	var/charge_warmup = 2 SECOND
	var/charge_sound = 'sound/weapons/spiderlunge.ogg'

	//Modular icons. Lists are referred to when picking styles.
	//If you add any more, it's as easy as adding the icons to these lists
	var/list/overlay_colors = list(
		"Underbelly" = "#FFFFFF",
		"Body" = "#FFFFFF",
		"Ears" = "#FFFFFF",
		"Mane" = "#FFFFFF",
		"Horns" = "#FFFFFF",
		"Eyes" = "#FFFFFF"
	)
	var/list/underbelly_styles = list(
		"Smooth",
		"Plated"
	)
	var/under
	var/list/body_styles = list(
		"Smooth",
		"Scaled"
	)
	var/body
	var/list/ear_styles = list(
		"Normal"
	)
	var/ears
	var/list/mane_styles = list(
		"None",
		"Shaggy",
		"Dorsalfin"
	)
	var/mane
	var/list/horn_styles = list(
		"Pointy",
		"Curved",
		"Curved2",
		"Jagged",
		"Crown",
		"Skull"
	)
	var/horns
	var/list/eye_styles = list(
		"Normal"
	)
	var/eyes

///
///		Subtypes
///

/mob/living/simple_mob/vore/bigdragon/friendly
	ai_holder_type = /datum/ai_holder/simple_mob/healbelly/retaliate/dragon
	desc = "A large, intimidating creature reminiscent of the traditional idea of medieval fire breathing lizards. This one seems particularly relaxed and jovial."
	faction = "neutral"
	player_msg = "You're a variant of the large dragon stripped of its firebreath attack (harm intent). This can be re-enabled by switching your norange var to 0."
	norange = 1
	noenrage = 1

// Weakened variant for maintpreds
/mob/living/simple_mob/vore/bigdragon/friendly/maintpred
	name = "lesser dragon"
	desc = "A large, intimidating creature reminiscent of the traditional idea of medieval fire breathing lizards. This one seems weaker than the rest."
	player_msg = "You're a nerfed variant of the large dragon with reduced health, reduced melee damage and your special attacks disabled. Intended for maint pred spawning."
	nospecial = 1
	maxHealth = 200
	melee_damage_lower = 20
	melee_damage_upper = 15

///
///		Misc define stuff
///

/datum/say_list/bigdragon
	speak = list("Rhf.", "Hrff.", "Grph.", "Rhrrr.")
	emote_hear = list("chuffs", "rawrs", "wehs", "roars", "scoffs", "yawns")
	emote_see = list("licks their chops", "stretches", "yawns", "snarls")
	say_maybe_target = list("Hrmph?")
	say_got_target = list("FOOL.", "+INSOLENT+.", "YOU'VE MADE A MISTAKE TODAY.")

/datum/category_item/catalogue/fauna/bigdragon
	name = "Sivian Fauna - Oh fuck dragon"
	desc = "Classification: Big boye\
	<br><br>\
	He do a rer.\
	<br><br>\
	This is a placeholder. You can assume it'll be pretty standard.\
	Something something has a fondness of gold coins and could be tamed if given one."
	value = CATALOGUER_REWARD_SUPERHARD //Scan range is the same as flame breath range. Good luck.

/mob/living/simple_mob/vore/bigdragon/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_mob(src)
	verbs |= /mob/living/simple_mob/proc/animal_mount
	verbs |= /mob/living/proc/toggle_rider_reins
	verbs |= /mob/living/simple_mob/vore/bigdragon/proc/set_style

/mob/living/simple_mob/vore/bigdragon/Initialize()
	..()
	src.adjust_nutrition(src.max_nutrition)
	build_icons(1)
	voremob_loaded = 1

///
///		Icon generation stuff
///

/mob/living/simple_mob/vore/bigdragon/update_icon()
	update_fullness()
	build_icons()

/mob/living/simple_mob/vore/bigdragon/update_fullness()
	var/new_fullness = 0
	// Only count stomachs to fullness
	for(var/obj/belly/B in vore_organs)
		if(B.name == "Stomach" || B.name == "Stomach.")
			for(var/mob/living/M in B)
				new_fullness += M.size_multiplier
	new_fullness /= size_multiplier
	new_fullness = round(new_fullness, 1)
	vore_fullness = min(vore_capacity, new_fullness)

/mob/living/simple_mob/vore/bigdragon/proc/build_icons(var/random)
	cut_overlays()
	if(stat == DEAD)
		icon_state = "dragon-dead"
		plane = MOB_LAYER
		return
	if(random)
		var/list/bodycolors = list("#1E1E1E","#3F3F3F","#545454","#969696","#DBDBDB","#ABBBD8","#3D0B00","#3A221D","#77554F","#281D1B","#631F00","#964421","#936B24","#381313","#380000","#682121","#700E00","#44525B","#283035","#29353D","#353E44","#281000","#38261A","#302F3D","#322E3A","#262738")
		under = pick(underbelly_styles)
		overlay_colors["Underbelly"] = pick(bodycolors)
		body = pick(body_styles)
		overlay_colors["Body"] = pick(bodycolors)
		ears = pick(ear_styles)
		overlay_colors["Ears"] = "#[get_random_colour(0, 100, 150)]"
		mane = pick(mane_styles)
		overlay_colors["Mane"] = pick(bodycolors)
		horns = pick(horn_styles)
		var/list/horncolors = list("#000000","#151515","#303030","#606060","#808080","#AAAAAA","#CCCCCC","#EEEEEE","#FFFFFF")
		overlay_colors["Horns"] = pick(horncolors)
		eyes = pick(eye_styles)
		overlay_colors["Eyes"] = "#[get_random_colour(1)]"

	var/image/I = image(icon, "dragon_under[under][resting? "-rest" : (vore_fullness? "-[vore_fullness]" : null)]")
	I.color = overlay_colors["Underbelly"]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_LAYER //4
	add_overlay(I)

	I = image(icon, "dragon_body[body][resting? "-rest" : null]")
	I.color = overlay_colors["Body"]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_LAYER
	add_overlay(I)

	I = image(icon, "dragon_ears[ears][resting? "-rest" : null]")
	I.color = overlay_colors["Ears"]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_LAYER
	add_overlay(I)

	I = image(icon, "dragon_mane[mane][resting? "-rest" : null]")
	I.color = overlay_colors["Mane"]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_LAYER
	add_overlay(I)

	I = image(icon, "dragon_horns[horns][resting? "-rest" : null]")
	I.color = overlay_colors["Horns"]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = MOB_LAYER
	add_overlay(I)

	I = image(icon, "dragon_eyes[eyes][resting? "-rest" : null]")
	I.color = overlay_colors["Eyes"]
	I.appearance_flags |= (RESET_COLOR|PIXEL_SCALE)
	I.plane = PLANE_LIGHTING_ABOVE
	add_overlay(I)

	if(enraged)
		I = image(icon, "dragon_rage")
		I.appearance_flags |= PIXEL_SCALE
		I.plane = MOB_LAYER
		add_overlay(I)

/mob/living/simple_mob/vore/bigdragon/proc/set_style()
	set name = "Set Dragon Style"
	set desc = "Customise your icons."
	set category = "Abilities"

	var/list/options = list("Underbelly","Body","Ears","Mane","Horns","Eyes")
	for(var/option in options)
		LAZYSET(options, option, new /image('icons/effects/bigdragon_labels_ch.dmi', option))
	var/choice = show_radial_menu(src, src, options, radius = 60)
	if(!choice || QDELETED(src) || src.incapacitated())
		return FALSE
	. = TRUE
	switch(choice)
		if("Underbelly")
			var/underbelly_pick = input(src, "Pick Underbelly!", "Dragon Customisation") as null|anything in underbelly_styles
			if(!underbelly_pick)
				return
			var/new_color = input("Pick underbelly color:","Underbelly Color", overlay_colors["Underbelly"]) as null|color
			if(!new_color)
				return
			under = underbelly_pick
			overlay_colors["Underbelly"] = new_color
		if("Body")
			var/body_pick = input(src, "Pick Body!", "Dragon Customisation") as null|anything in body_styles
			if(!body_pick)
				return
			var/new_color = input("Pick body color:","Body Color", overlay_colors["Body"]) as null|color
			if(!new_color)
				return
			body = body_pick
			overlay_colors["Body"] = new_color
		if("Ears")
			var/ears_pick = input(src, "Pick Ears!", "Dragon Customisation") as null|anything in ear_styles
			if(!ears_pick)
				return
			var/new_color = input("Pick ear color:","Ear Color", overlay_colors["Ears"]) as null|color
			if(!new_color)
				return
			ears = ears_pick
			overlay_colors["Ears"] = new_color
		if("Mane")
			var/mane_pick = input(src, "Pick Mane!", "Dragon Customisation") as null|anything in mane_styles
			if(!mane_pick)
				return
			var/new_color = input("Pick mane color:","Mane Color", overlay_colors["Mane"]) as null|color
			if(!new_color)
				return
			mane = mane_pick
			overlay_colors["Mane"] = new_color
		if("Horns")
			var/horns_pick = input(src, "Pick Horns!", "Dragon Customisation") as null|anything in horn_styles
			if(!horns_pick)
				return
			var/new_color = input("Pick horn color:","Horn Color", overlay_colors["Horns"]) as null|color
			if(!new_color)
				return
			horns = horns_pick
			overlay_colors["Horns"] = new_color
		if("Eyes")
			var/eyes_pick = input(src, "Pick Eyes!", "Dragon Customisation") as null|anything in eye_styles
			if(!eyes_pick)
				return
			var/new_color = input("Pick eye color:","Eye Color", overlay_colors["Eyes"]) as null|color
			if(!new_color)
				return
			eyes = eyes_pick
			overlay_colors["Eyes"] = new_color
	if(.)
		build_icons()

///
///		Vore stuff
///
//My thanks to Raeschen for the hostile vore organ flavourtexts
//My thanks to [whoever does the heal flavourtexts later]

/mob/living/simple_mob/vore/bigdragon/init_vore()
	//Ow my sanity
	if(!voremob_loaded)
		return
	var/obj/belly/B = new /obj/belly/dragon/maw(src)
	B.emote_lists[DM_HOLD] = list(
		"The dragon's breath continues to pant over you rhythmically, each exhale carrying a bone-shivering growl",
		"The thick, heavy tongue lifts, curling around you, cramming you tightly against it's teeth, to squeeze some flavor out of you.",
		"For a moment, you find yourself slipping underneath the tongue, into the plush silky space beneath. After a momentary squirm, the tongue scoops you back atop itself, twice as slimy as before.",
		"The vast tongue quivers, inching you up close to it's gaping gullet. The slick hatch squeezes on a limb of yours, giving it a plush, sloppy, inviting tug...",
		"Nestled atop the muscle, an array of deep, dull muffled glrrrgles echo up the beast's gullet, a gastric siren-song calling out for you.")
	gut1 = B
	vore_selected = B
	B = new /obj/belly/dragon/throat(src)
	B.emote_lists[DM_HOLD] = list(
		"Gggllrrrk! Another loud, squelching swallow rings out in your ears, dragging you a little deeper into the furnace-like humid heat of the dragon's body.",
		"Nestling in a still throat for a moment, you feel the walls quiver and undulate excitedly in tune with the beast's heartbeat.",
		"A particularly lengthy moment between swallows passes. Perhaps the beast has calmed? Perhaps you might be able to squir-Gggglllk. Squelch. Deeper into the abyss you slide. No escape, probably.",
		"The throat closes in tightly, utterly cocooning you with it's silken spongey embrace. Like this it holds, until you feel like you might pass out... eventually, it would shlllrrk agape and loosen up all around you once more, the beast not wanting to lose the wriggly sensation of live prey.",
		"Blrrbles and squelching pops from it's stomach echo out below you. Each swallow brings greater clarity to those digestive sounds, and stronger acidity to the muggy air around you, inching you closer to it's grasp. Not long now.")
	B = new /obj/belly/dragon/stomach(src)
	B.emote_lists[DM_DIGEST] = list(
		"The stomach walls spontaneously contract! Those wavey, fleshy walls binding your body in their embrace for the moment, slathering you with thick, caustic acids.",
		"You hear a soft rumbling as the dragon’s insides churn around your body, the well-used stomach walls shuddering with a growl as you melt down.",
		"The stomach squishes and squelches over your body, the growling and grumbling of those bowels kneading you into submission like a deafening orchestra. Gradually melting you down into something easier to manage",
		"As your body breaks down into this beasts lunch you feel the walls compress tighter and tighter every moment pressing a crushing weight on your form.",
		"The constant, rhythmic kneading and massaging starts to take its toll along with the muggy heat, making you feel weaker and weaker!",
		"The drake happily wanders around while digesting its meal, almost like it is trying to show off the hanging gut you've given it.")
	B = new /obj/belly/dragon/maw/heal(src)
	B.emote_lists[DM_HEAL] = list(
		"Placeholder.")
	gut2 = B
	B = new /obj/belly/dragon/throat/heal(src)
	B.emote_lists[DM_HEAL] = list(
		"Placeholder.")
	B = new /obj/belly/dragon/stomach/heal(src)
	B.emote_lists[DM_HEAL] = list(
		"The drake's idle movement helps its stomach gently churn around you, slimily squelching against your figure.",
		"The draconic predator takes a moment to intentionally clench its gut around you, encapsulating you in a strange, fleshy hug.",
		"Some hot, viscous slime oozes down over your form, helping slicken you up, and heal your injuries during your stay.",
		"During a moment of relative silence, you can hear the beast's soft, relaxed breathing as it casually goes about its day.",
		"The thick, humid atmosphere within the drake's thick hanging belly works in tandem with its steady, metronome-like heartbeat to soothe you.",
		"Your surroundings sway from side to side as the drake wanders about, your form sinking bodily into the doughy, soft gutflesh.")
	.=..()

//Making unique belly subtypes for cleanliness and my sanity
/obj/belly/dragon
	autotransferchance = 50
	autotransferwait = 150
	escapable = 1
	escapechance = 100
	escapetime = 30
	fancy_vore = 1
	contamination_color = "grey"
	contamination_flavor = "Wet"
	vore_verb = "slurp"

/obj/belly/dragon/maw
	name = "Maw"
	desc = "Seizing it's opportunity, the dragon's jaws swoop in to scoop you up off of your feet, giving you a view down your body of the glistening, red interior. Vicious looking jaws hover above you like a guillotine, threatening to sink down into you, though such a thing never arrives. Seems it has a slower fate in store for you, as it guides your body along the bumpy mattress of it's tongue until the lowermost parts of your body press around the entrance of it's wide, quivering throat. The jaws snap shut, trapping you within, though thankfully clear of snagging your body between them. It's vast tongue coming to life, lifting to cram you against the insides of it's teeth and against the cathedral-roof ridges of it's palate - lathering you in hot, oily drool. It's panting, growled breaths gust from that wide, eye-catching hatch at the back, blasting you with murky breath and airborne spittle, presenting itself as a place to get up close and intimate with very, very soon...."
	escapechance = 15
	struggle_messages_inside = list(
		"You wriggle and wrestle for purchase against the tongue. It lifts, cocooning and squeezing you hard between itself and the palate.",
		"Reaching out, you try to pry at the beast's interlocked, mighty teeth. A zig-zag crack of light bleeds in to the maw for a moment, presenting you with your current, slimy state, before clicking shut once more.",
		"You try to wriggle to the very front of the jaws to keep safe from that abyssal gullet. It works for a while, before the tongue scoops you right up close to that slick hatch, presenting you with a view of those dark, undulating, sloppy depths.",
		"You brace your back against the spongey mattress of the tongue, and plant your limbs up against the roof. Straining hard, you try to force the jaws agape. A dull growl increases, blasting you in humid murk and drool the more you strain, your efforts ultimately useless.",
		"Struggling for escape, you find yourself able to slip an arm between the beast's teeth and lips, reaching into the colder outside air. It doesn't take long for the beast's tongue to slither out with it, wrap over the limb, tugging it back inside with a noisy slllrrrp of it's lips.")
	autotransferlocation = "Throat"

/obj/belly/dragon/maw/heal
	name = "Maw."
	desc = "I havn't written the heal maw flavourtexts yet. Check back when the PR's full merged. Just imagine there's a description about a dragon being gentle here, ok?"
	escapechance = 100
	digest_mode = DM_HEAL
	struggle_messages_inside = list(
		"You gently tap at the roof of the dragon's palate. Indicating to them your wishes of release. The dragon, in a good mood, creeks open their jawline, permitting you easy access to the outside world, to which you clamber out.")
	autotransferlocation = "Throat."

/obj/belly/dragon/throat
	name = "Throat"
	transferchance = 20
	transferlocation = "Maw"
	escapechance = 0
	desc = "...And that 'very, very soon' rapidly becomes 'now'. The mighty tongue lifts, having collected enough of your flavor, squelching your lower body up to your chest inside it's hot gullet, giving you an ample view of itself slithering up over your body. You get to watch it quiver and clench with a resounding glllk, around you, the tongue's fat bumpy rear lifting behind your head to displace you down and inside the clinging tunnel. Tight, crushing pressure embraces you with each of those deep, liquid-sounding swallows, inching you down little by little each time. The flesh of the tunnel wraps you tightly, leaving you mostly unable to move, given short moments of respite between each swallow, to listen to the thudding heartbeat and the distant glrrrbles deep below. The hot scent of acidity grows stronger, the deeper you plunge..."
	struggle_messages_inside = list(
		"With as much effort as you can muster, you squirm and writhe, trying to swim up the passage of soft flesh. You barely peek out the beast's gullet, before the back of it's tongue squelches into your face, forcing you back down.",
		"You struggle and press outwards firmly against the walls. The beast rumbles out over you, shaking you to your bones. Was that a sound of pleasure from the dragon? Perhaps more of this struggling might appease it...",
		"Bracing your back against a wall, you try to press outwards with all the strength you have, to spread the throat agape. For a moment, it affords you a nice view down your body, towards the sealed muscular entryway to it's stomach. Everything clenches back shut around you shortly after.",
		"More squirming and struggling outwards, trying to hold the throat's muscular walls at bay. Every time you press outwards, the walls press back with twice the strength. Much more of this and it might threaten to crush. Perhaps you should just give in...",
		"You frantically writhe upwards a couple of inches, before the beast swallows with a sloppy-sounding glllggk, sending you back down a foot or so. Each struggle you make only seems to hasten your journey down the hatch. ")
	autotransferlocation = "Stomach"

/obj/belly/dragon/throat/heal
	name = "Throat."
	desc = "Say while you're here and sliding down a dragons throat, I figure you must've figured out how to tame this dragon by reading the PR, seeing as these flavourtexts will be gone in less than 12h."
	escapechance = 100
	digest_mode = DM_HEAL
	struggle_messages_inside = list(
		"You outstretch your limbs back up the throat from whence you came, trying to pry yourself back up. A difficult challenge without aid. The dragon, sensing your desire to come back out, is quick to aid. Hurking you back up its gullet, promptly depositing you neatly on the ground below itself.")
	autotransferlocation = "Stomach."

/obj/belly/dragon/stomach
	name = "Stomach"
	desc = "The final part of your journey arrives, in the form of a tightly squelched, muscular sphincter. Throat pressure crams against you, until abruptly, you find yourself spat into a hot, caustic cauldron of churning doom, the dragon's stomach. After slithering in, the way you entered squelches shut, dissapearing among the folds - impossible for you to find any more. You are trapped, no way out, lounging in a shallow pool of thick sticky juices. endless undulations from thick, pendulous folds of stomach-wall all around continually churn it up into a foamy, bubbling mess, soaking their folds in it to drip in ropes and even shivering sheets of the stuff around you. Clenches gush the digestive slimes all over you from time to time, cradling you in it's noxious embrace. Your ears are filled with such sloppy squelches now, those distant muffled glrrns you heard earlier now sharp, crisp, and thunderous as you nestle in their very source. Settle down for what little time you have left, for your fate rests adding to the powerful beast all around you."
	vore_sound = "Tauric Swallow"
	escapable = 0
	//desc = "The dragon's cavernous stomach hungrily pries your figure in through its sphincter, sealing taught behind you. Its meal is hastily subject to the slick, squelching confines of its digestive organ, that hanging gut eagre to churn and ripple over your proportions the moment you've arrived. Caustic waves of slop and chyme wash over you, that acidic tingle setting in upon your flesh. The entire chamber groans and echoes with each of the dragon's prideful steps. Satiated with its most recent meal, slowly being reduced into a nutritious paste to further power its hunt. Your fate definitively sealed within this tomb of swelteringly hot flesh."
	struggle_messages_inside = list(
		"Eager to try and escape before you lack the strength to do so anymore, you pound firmly against those walls. They clench in twice as hard, the beast letting out a pleased rumble. Seems it wants you to do that again!",
		"You try to stand inside the clinging gut, to force your arms and head upwards towards the way you came in. Searching through each and every fold for the muscled entryway leaves you discovering nothing but caches of goop, soaking over you all the more.",
		"You press all your limbs out firmly into the walls to try and struggle. The softness of the flesh simply envelops over each of them, giving them a close kneading snuggle in hot oily goop.",
		"Each squirm and struggle you try to make just makes the beast rumble deeply in pleasure. It wriggles itself, sloshing and shaking you about, to try goad you into struggling all the more.",
		"Yet more frantic wriggling and squirming from you, pressing and thumping out into walls which themselves greedily devour all the effort you make into them. this deep inside, it doesn't appear to be helping.")

/obj/belly/dragon/stomach/heal
	name = "Stomach."
	desc = "I'll come back and finish these after work, ok eagre prey fella'? Or someone who got injured near the dragon, I guess."
	escapable = 0
	escapechance = 100
	digest_mode = DM_HEAL
	struggle_messages_inside = list(
		"You lift yourself upright, and smush up against the fleshy valve denoting the way into the dragon's stomach. The dragon groans in frustration, but understands the motive and intent expressed. Courteous as they are at the moment, that valve unseals before you, as you're quickly squeezed and shuttled back up from whence you came. To soon see the light of day once more.")
	vore_sound = "Tauric Swallow"

///
///		AI handling stuff
///

/datum/ai_holder/simple_mob/intentional/dragon
	intelligence_level = 3
	mauling = 1
	var/yeet_range = 2
	var/yeet_threshold = 2
	var/charge_max = 5

/mob/living/simple_mob/vore/bigdragon/handle_special()
	if(noenrage)
		return
	if(!enraged)
		if(health <= (maxHealth * 0.5))
			enraged = 1
			say("No more games. COME HERE.")

/datum/ai_holder/simple_mob/intentional/dragon/pre_special_attack(atom/A)
	if(isliving(A))
		var/mob/living/target = A
		var/tally = 0
		var/list/potential_targets = list_targets()
		//Spin attack if surrounded
		for(var/atom/movable/AM in potential_targets)
			if(get_dist(holder, AM) > yeet_range)
				continue
			if(!can_attack(AM))
				continue
			tally++
		if(tally >= yeet_threshold)
			holder.a_intent = I_GRAB
			return

		//Charge attack if target is far away, but not if there's no line of sight
		if(get_dist(holder, target) > charge_max)
			if(target in check_trajectory(target, holder, pass_flags = PASSTABLE))
				holder.a_intent = I_DISARM
				return

	//Default to firebreath if we can't charge or yeet
	holder.a_intent = I_HURT

/mob/living/simple_mob/vore/bigdragon/do_special_attack(atom/A)
	. = TRUE
	switch(a_intent)
		if(I_DISARM)
			if(!nospecial)
				chargestart(A)
		if(I_HURT)
			if(!norange)
				firebreathstart(A)
		if(I_GRAB)
			if(!nospecial)
				repulse()

///
///		AI handling stuff
///
// It hurts me a little to make these mob specific procs instead of effects that can be invoked by any mob, but I'm too lazy to go fix mob attacks like that.
/mob/living/simple_mob/vore/bigdragon/proc/repulse(var/range = 2)
	var/list/thrownatoms = list()
	for(var/mob/living/victim in oview(range, src))
		thrownatoms += victim
	src.spin(12,1)
	for(var/am in thrownatoms)
		var/atom/movable/AM = am
		if(AM == src || AM.anchored)
			continue
		addtimer(CALLBACK(src, .proc/yeet, am), 1)
	playsound(src, "sound/weapons/punchmiss.ogg", 50, 1)

//Split repulse into two parts so I can recycle this later
/mob/living/simple_mob/vore/bigdragon/proc/yeet(var/atom/movable/AM, var/gentle = 0)
	var/maxthrow = 7
	var/atom/throwtarget
	var/distfromcaster
	throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(AM, src)))
	distfromcaster = get_dist(src, AM)
	if(distfromcaster == 0)
		if(isliving(AM))
			var/mob/living/M = AM
			M.Weaken(5)
			if(!gentle)
				M.adjustBruteLoss(50)	//A dragon just slammed ontop of you
			to_chat(M, "<span class='userdanger'>You're slammed into the floor by [src]!</span>")
	else
		if(isliving(AM))
			var/mob/living/M = AM
			M.Weaken(1.5)
			if(!gentle)
				M.adjustBruteLoss(20)
			to_chat(M, "<span class='userdanger'>You're thrown back by [src]!</span>")
			playsound(src, get_sfx("punch"), 50, 1)
		AM.throw_at(throwtarget, maxthrow, 3, src)

/mob/living/simple_mob/vore/bigdragon/proc/chargestart(var/atom/A)
	if(!enraged)
		set_AI_busy(TRUE)

	do_windup_animation(A, charge_warmup)
	//callbacks are more reliable than byond's process scheduler
	addtimer(CALLBACK(src, .proc/chargeend, A), charge_warmup)


/mob/living/simple_mob/vore/bigdragon/proc/chargeend(var/atom/A, var/explicit = 0, var/gentle = 0)
	status_flags |= LEAPING
	flying  = 1		//So we can thunk into things
	hovering = 1	// So we don't hurt ourselves running off cliffs
	visible_message(span("danger","\The [src] charges at \the [A]!"))
	throw_at(A, 7, 2)
	playsound(src, charge_sound, 75, 1)
	if(status_flags & LEAPING)
		status_flags &= ~LEAPING
	flying = 0
	hovering = 0

	var/mob/living/target = null
	if(explicit)	//Allows specific targetting
		if(Adjacent(A))
			target = A
	if(!target)
		for(var/mob/living/victim in orange(1, src))
			target = victim
			break	//take the first target in range
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.check_shields(0, src, src, null, "the charge"))
			return // We were blocked.
	if(target)
		yeet(target, gentle)
	set_AI_busy(FALSE)

/mob/living/simple_mob/vore/bigdragon/proc/firebreathstart(var/atom/A)
	glow_toggle = 1
	set_light(glow_range, glow_intensity, glow_color) //Setting it here so the light starts immediately
	if(!enraged)
		set_AI_busy(TRUE)
	addtimer(CALLBACK(src, .proc/firebreathend, A), charge_warmup)
	playsound(src, "sound/magic/Fireball.ogg", 50, 1)
	flick("dragon_flame", src)

/mob/living/simple_mob/vore/bigdragon/proc/firebreathend(var/atom/A)
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/dragon(get_turf(src))
	src.visible_message("<span class='danger'>\The [src] spews fire at \the [A]!</span>")
	playsound(src, "sound/weapons/Flamer.ogg", 50, 1)
	P.launch_projectile(A, BP_TORSO, src)
	set_AI_busy(FALSE)
	glow_toggle = 0

/obj/item/projectile/bullet/dragon
	use_submunitions = 1
	only_submunitions = 1 	//lmao this var doesn't even do anything
	range = 0				//so instead we circumvent it with this :^)
	submunition_spread_max = 300
	submunition_spread_min = 150
	submunitions = list(/obj/item/projectile/bullet/incendiary/dragonflame = 5)

/obj/item/projectile/bullet/dragon/on_range()
	qdel(src)

/obj/item/projectile/bullet/incendiary/dragonflame
	name = "dragon flame"
	icon_state = null
	damage = 30
	accuracy = 100	//This is a bullet facading as a swathe of fire, how's a wall of fire gonna miss huh?
	speed = 2
	incendiary = 2
	flammability = 2
	range = 12
	var/fire_stacks = 1

/obj/item/projectile/bullet/incendiary/dragonflame/on_range()
	qdel(src)

/obj/item/projectile/bullet/incendiary/dragonflame/Move()
	. = ..()
	var/turf/T = get_turf(src)
	if(T)
		new /obj/effect/decal/cleanable/liquid_fuel(T,0.2,1)
		T.hotspot_expose(500, 50, 1)
		T.create_fire(700)

//Snowflake on_hit so the bullet can set both mobs and carbons on fire, but still let carbons stop drop and roll out the fire stacks.
/obj/item/projectile/bullet/incendiary/dragonflame/on_hit(atom/target, blocked = 0, def_zone)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()
	else
		. = ..()

/mob/living/simple_mob/vore/bigdragon/do_tame(var/obj/O, var/mob/user)
	if(!user)
		return
	if(faction == "neutral")
		return	//We're already friendly
	if(enraged || notame)
		say("NO FORGIVENESS")
		return //No talk me I angy

	handle_tame_item(O, user)

	qdel(ai_holder)	//Dragon goes to therapy
	faction = "neutral"
	norange = 1		//Don't start fires while friendly
	ai_holder = new /datum/ai_holder/simple_mob/healbelly/retaliate/dragon(src)

/datum/ai_holder/simple_mob/healbelly
	intelligence_level = 3
	can_breakthrough = 0
	var/vocal = 1
	var/last_speak

/datum/ai_holder/simple_mob/healbelly/retaliate
	retaliate = 1

//dragon variant that'll swap back to hostile if pissed off
/datum/ai_holder/simple_mob/healbelly/retaliate/dragon
	var/warnings = 0
	var/last_warning

/datum/ai_holder/simple_mob/healbelly/proc/confirmPatient(var/mob/living/P)
	if(istype(holder,/mob/living/simple_mob))
		var/mob/living/simple_mob/H = holder
		if(H.will_eat(P))
			if(!H.CanPounceTarget(P))
				return		//Don't chase someone if we can't
			if(issilicon(P))
				return
			if(iscarbon(P))
				if(P.isSynthetic()) //Sorry robits
					return
			else
				if(!P.client)	//Don't target simple mobs that aren't player controlled
					return
			if(P.stat == DEAD)
				return
			if(P.suiciding)
				return
			if(P.health <= (P.maxHealth * 0.95))	//Nom em'
				if(vocal)
					if(last_speak + 30 SECONDS < world.time)
						var/message_options = list(
							"Hey, [P.name]! You are injured, hold still.",
							"[P.name]! Come here, let me help.",
							"[P.name], you need help."
							)
						var/message = pick(message_options)
						H.say(message)
						last_speak = world.time
				return 1

//Attack overrides to let us """Attack""" allies and heal them
/datum/ai_holder/simple_mob/healbelly/can_attack(atom/movable/the_target, vision_required = 1)
	if(!can_see_target(the_target) && vision_required)
		return

	if(istype(the_target, /mob/zshadow))
		return // no

	if(isliving(the_target))
		var/mob/living/L = the_target
		if(ishuman(L) || issilicon(L))
			if(!L.client)	// SSD players get a pass
				return
		if(L.stat)
			if(L.stat == DEAD && !handle_corpse) // Leave dead things alone
				return
		if(holder.IIsAlly(L))
			if(confirmPatient(L))
				holder.a_intent = I_HELP
				return 1
			else
				return
	holder.a_intent = I_HURT
	return 1

/datum/ai_holder/simple_mob/healbelly/retaliate/dragon/can_attack(atom/movable/the_target)
	if(istype(holder,/mob/living/simple_mob/vore/bigdragon))
		var/mob/living/simple_mob/vore/bigdragon/BG = holder
		if(holder.IIsAlly(the_target))
			BG.vore_selected = BG.gut2	//Nom them into the heal guts
		else
			BG.vore_selected = BG.gut1	//Gurgle them if not
	return .=..()

/datum/ai_holder/simple_mob/healbelly/melee_attack(atom/A)
	if(isliving(A))
		if(holder.a_intent == I_HELP)
			if(istype(holder,/mob/living/simple_mob))
				var/mob/living/simple_mob/H = holder
				if(H.CanPounceTarget(A))
					H.PounceTarget(A)
					//The following is some reagent injections to cover our bases, since being swallowed and dying from internal injuries sucks
					//If this ends up being op because medbay gets replaced by a voremob buckled to a chair, feel free to remove some.
					//Alternatively bully a coder (me) to make a unique digest_mode for mob healbellies that prevents death, or something.
					if(istype(A, /mob/living/carbon/human))
						var/mob/living/carbon/human/P = A
						var/list/to_inject = list("myelamine","osteodaxon","spaceacillin","peridaxon")
						//Lets not OD them...
						for(var/RG in to_inject)
							if(!P.reagents.has_reagent(RG))
								P.reagents.add_reagent(RG, 10)
			return //Don't attack people if we're on help intent
	return .=..()


/datum/ai_holder/simple_mob/healbelly/retaliate/dragon/handle_special_strategical()
	if(last_warning + 1 MINUTE < world.time)
		warnings = 0	//calm down

/datum/ai_holder/simple_mob/healbelly/retaliate/dragon/react_to_attack(atom/movable/attacker)
	if(holder.stat)
		return
	if(istype(holder,/mob/living/simple_mob/vore/bigdragon))
		var/mob/living/simple_mob/vore/bigdragon/H = holder
		if(!H.noenrage)
			if(H.IIsAlly(attacker))
				if(!H.enraged)
					switch(warnings)
						if(0)
							H.say("Stop that.")
						if(1)
							H.say("I'm warning you here.")
						if(2)
							H.say("You do that again, and you'll regret it.")
						if(3)
							enrage(attacker)
							return
					last_warning = world.time
					warnings += 1
					dissuade(attacker)
					return
				else
					enrage(attacker)
					return
	return .=..()

/datum/ai_holder/simple_mob/healbelly/retaliate/dragon/proc/enrage(var/atom/movable/attacker)
	var/mob/living/simple_mob/vore/bigdragon/H = holder
	H.enraged = 1
	H.norange = 0
	H.faction = "dragon"
	H.say("HAVE IT YOUR WAY THEN")
	var/datum/ai_holder/simple_mob/intentional/dragon/D = new /datum/ai_holder/simple_mob/intentional/dragon(holder)
	D.give_target(attacker)
	qdel(src)

//Smack people it warns
/datum/ai_holder/simple_mob/healbelly/retaliate/dragon/proc/dissuade(var/chump)
	if(chump in check_trajectory(chump, holder, pass_flags = PASSTABLE))
		if(istype(holder,/mob/living/simple_mob/vore/bigdragon))
			var/mob/living/simple_mob/vore/bigdragon/H = holder
			H.chargeend(chump,1,1)