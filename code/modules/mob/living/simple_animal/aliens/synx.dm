/mob/living/simple_mob/retaliate/synx
	//on inteligence https://synx.fandom.com/wiki/Behavior/Intelligence //keeping this here for player controlled synxes.
	name = "Synx"
	desc = "A cold blooded, genderless, parasitic eel from the more distant and stranger areas of the cosmos. Plain, white, perpetually grinning and possessing a hunger as enthusiastic and endless as humanity's sense of exploration."
	tt_desc = "synxus pergulus"

	 //Synx species belongs to ChimeraSynx , Base sprites by: SpitefulCrow
	icon = 'icons/mob/synx.dmi'//giving synxes their own DMI file!
	icon_state = "synx_living"
	icon_living = "synx_living"
	icon_dead = "synx_dead"

	speak_chance = 10 //MAy have forgotten to readd that.
	//Synx speech code overrides normal speech code but is still a x in 200 chance of triggereing, as all mobs do.
	//VAR$ SETUP
	var/realname = null
	var/poison_per_bite = 5
	var/poison_chance = 99.666
	var/poison_type = "synxchem"//inaprovalin, but evil
	var/transformed_state = "synx_transformed"
	var/transformed = FALSE
	var/memorysize = 50 //Var for how many messages synxes remember if they know speechcode
	var/list/voices = list()
	var/forcefeedchance = 20

	faction = "Synx"
	intelligence_level = SA_ANIMAL

	maxHealth = 150
	health = 150
	turns_per_move = 5 //Should just affect how often it wanders, subject to change.
	speed = 2 //Re enabled custom speed
	see_in_dark = 6
	stop_when_pulled = 0
	armor = list(			// will be determined
				"melee" = 20,
				"bullet" = 0,
				"laser" = 0,
				"energy" = 0,
				"bomb" = 10,
				"bio" = 100,
				"rad" = 100)
	has_hands = 1

	response_help  = "pets the"
	response_disarm = "gently pushes aside the"


	pass_flags = PASSTABLE

	melee_damage_lower = 5 //Massive damage reduction, will be balanced with toxin injection
	melee_damage_upper = 5
	attack_armor_pen = 40			// How much armor pen this attack has.
	attack_sharp = 1
	attack_edge = 1

//Vore stuff
	vore_active = 1
	vore_capacity = 2
	vore_pounce_chance = 50
	vore_bump_chance = 10
	vore_bump_emote = "Slowly wraps its tongue around, and slides its drooling maw over the head of"
	vore_standing_too = 1 //I believe this lets it vore standing people, rather than only resting.
	vore_ignores_undigestable = 0 //Synx don't care if you digest or not, you squirm fine either way.
	vore_default_mode = DM_HOLD
	vore_digest_chance = 45		// Chance to switch to digest mode if resisted
	vore_absorb_chance = 0
	vore_escape_chance = 10
	vore_icons = 0 //no vore icons
	swallowTime = 6 SECONDS //Enter the eel you nerd

//Shouldn't be affected by lack of atmos, it's a space eel.
	min_oxy = 0
	max_oxy = 0 //Maybe add a max
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0 //Maybe add a max
	min_n2 = 0
	max_n2 = 0 //Maybe add a max
	minbodytemp = 0
	// TODO: Set a max temperature of about 20-30 above room temperatures. Synx don't like the heat.

/mob/living/simple_mob/retaliate/synx/init_vore()
	..()
	var/obj/belly/B = vore_selected
	//B.human_prey_swallow_time = 6 SECONDS //doesnt work
	//B.nonhuman_prey_swallow_time = 3 SECONDS //doesnt work
	B.vore_verb = "swallow"
	B.name = "stomach"
	B.desc	= "You're pulled into the snug stomach of the synx. The walls knead weakly around you, coating you in thick, viscous fluids that cling to your body, that soon starts to tingle and burn..."
	B.digest_burn = 1
	B.digest_brute = 0
	B.emote_lists[DM_HOLD] = list(
	"The walls churn around you, soaking you in thick, smelling fluid as you're kneaded and rolled about in the surprisingly roomy, but still snug, space.",
	"The unusually cool stomach rolls around you slowly and lazily, trying to almost knead you to sleep gently as the synx pulses around you.",
	"The thick, viscous fluids cling to your body soaking in deep, giving you a full bath with the kneading of the walls helping to make sure you'll be smelling like synx stomach for days."
	)
	B.emote_lists[DM_DIGEST] = list(
	"The stomach kneads roughly around you, squishing and molding to your shape, with the thick fluids clinging to your body and tingling, making it hard to breathe.",
	"Firm churns of the stomach roll and knead you around, your body tingling as fur sizzles all around you, your body getting nice and tenderized for the stomach.",
	"Your body tingles and the air smells strongly of acid, as the stomach churns around you firmly and slowly, eager to break you down.",
	"You're jostled in the stomach as the synx lets out what can only described as an alien belch, the space around you getting even more snug as the thick acids rise further up your body."
	)
	B.digest_messages_prey = list(
	"Your eyes grow heavy as the air grows thin in the stomach, the burning of the acids slowly putting you into a final slumber, adding you to the synx's hips and tail.",
	"Slowly, the stinging and burning of the acids, and the constant churning is just too much, and with a few final clenches, your body is broken down into fuel for the synx.",
	"The acids and fluids rise up above your head, quickly putting an end to your squirming and conciousness.. the stomach eager to break you down completely.",
	"The synx lets out an audible belch, the last of your air going with it, and with a few audible crunches from the outside, the stomach claims you as food for the parasite."
	)

/mob/living/simple_mob/retaliate/synx/pet/asteri/init_vore()
	..()
	var/obj/belly/B = vore_selected
	B.desc    = "The synx eagerly swallows you, taking you from its gullet into its long, serpentine stomach. The internals around you greedily press into your from all sides, keeping you coated in a slick coat of numbing fluids..."
	B.digest_burn = 1
	B.digest_brute = 1
	B.emote_lists[DM_HOLD] = list(
	"Your taut prison presses and pads into your body, the synx squeezing around you almost constrictingly tight while the rolling pulses of muscle around you keep your squirms well-contained.",
	"You can feel parts of you sink and press into the squishy stomach walls as the synx's gut seems to relax, the wet ambience of its stomach muffling the parasite's various heartbeats.",
	"You can hear the synx teasingly mimic the sounds you've made while it's eaten you, the stomach walls practically massaging more of numbing fluid into you as its innards do their best to tire you out.",
	)
	B.emote_lists[DM_DIGEST] = list(
	"The stomach gives a crushing squeeze around your frame, its body restraining your movements and pressing digestive fluids deeper into you with overwhelming pressure from all sides..",
	"The synx's insides greedily press into you all over, kneading around your body and softening you up for the slurry of numbing acid that's pooled around your melting frame.",
	"You can hear a cacophony of wet churns and gurgles from the synx's body as it works on breaking you down, the parasite eagerly awaiting your final moments.",
	"The tight, fleshy tunnel constricts around you, making it even harder to breathe the already thin air as the digestive cocktail around you wears you out.",
	)
	B.digest_messages_prey = list(
	"You finally give in to the constricting pressure, softened up enough for the acids around you to turn your entire being into a gooey slop to be pumped through its body.",
	"Slipping past the point of saving, your body gives out on you as the stomach walls grind your goopy remains into a chunky sludge, leaving behind only a few acid-soaked bones for it to stash in the vents.",
	"The constant fatal massage pulls you under, your conciousness fading away as you're drawn into a numb, permanent sleep. The body you leave behind is put to good use as a few extra pounds on the synx's frame, its now-wider hips making it just a little harder to squeeze through the vents it's so fond of.",
	"The synx's body gleefully takes what's left of your life, Asteri's usually-repressed sadism overwhelmed with a sinister satisfaction in snuffing you out as your liquefied remains gush into a bit more heft on the parasite's emaciated frame.",
	)

/mob/living/simple_mob/retaliate/synx/New()
	..()
	verbs |= /mob/living/proc/ventcrawl
	verbs |= /mob/living/simple_mob/proc/contort
	verbs |= /mob/living/simple_mob/retaliate/synx/proc/disguise
	//verbs += /mob/living/simple_mob/retaliate/synx/proc/honk
	verbs |= /mob/living/simple_mob/retaliate/synx/proc/randomspeech
	realname = name
	voices += "Garbled voice"
	voices += "Unidentifiable Voice"
	speak += "Who is there?"
	speak += "What is that thing?!"

/* This literally is just the normal proc, why does this exist wh
mob/living/simple_mob/synx/PunchTarget()
	if(!Adjacent(target_mob))
		return
	custom_emote(1, pick( list("slashes at [target_mob]", "bites [target_mob]") ) )

	var/damage = rand(melee_damage_lower, melee_damage_upper)

	if(ishuman(target_mob))
		var/mob/living/carbon/human/H = target_mob
		var/dam_zone = pick(BP_TORSO, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG)
		var/obj/item/organ/external/affecting = H.get_organ(ran_zone(dam_zone))
		H.apply_damage(damage, BRUTE, affecting, H.run_armor_check(affecting, "melee"), H.get_armor_soak(affecting, "melee"), sharp=1, edge=1)
		return H
	else if(isliving(target_mob))
		var/mob/living/L = target_mob
		L.adjustBruteLoss(damage)
		return L
	else
		..()
*/
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// SPECIAL ITEMS/REAGENTS !!!! ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
/datum/seed/hardlightseed/
	name = "Type NULL Hardlight Generator"
	seed_name = "Biomechanical Hardlight generator seed"
	display_name = "Biomechanical Hardlight stem"
	mutants = null
	can_self_harvest = 1
	has_mob_product = null

/datum/seed/hardlightseed/New()
	..()
	set_trait(TRAIT_IMMUTABLE,1) //Normal genetics wont be able to do much with the mechanical parts, its more a machine than a real plant
	set_trait(TRAIT_MATURATION,1)
	set_trait(TRAIT_PRODUCTION,1)
	set_trait(TRAIT_YIELD,1)
	set_trait(TRAIT_POTENCY,1)
	set_trait(TRAIT_PRODUCT_ICON,"alien4")
	set_trait(TRAIT_PRODUCT_COLOUR,"#00FFFF")
	set_trait(TRAIT_PLANT_COLOUR,"#00FFFF")
	set_trait(TRAIT_PLANT_ICON,"alien4") //spooky pods
	set_trait(TRAIT_IDEAL_HEAT, 283)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0)
	set_trait(TRAIT_WATER_CONSUMPTION, 0)

/datum/seed/hardlightseed/typesx //Respawn mechanism for the synx
	name = "hardlightseedsx"
	seed_name = "hardlightseedsx"
	display_name = "Biomechanical Hardlight Generator SX"//PLant that is part mechanical part biological
	has_mob_product = /mob/living/simple_mob/retaliate/synx/pet/holo

/obj/item/seeds/hardlightseed/typesx
	seed_type = "hardlightseedsx"

/datum/reagent/inaprovaline/synxchem
	name = "Alien nerveinhibitor"
	description = "A toxin that slowly metabolizes damaging the person, but makes them unable to feel pain"
	id = "synxchem"
	metabolism = REM * 0.1 //Slow metabolization to try and mimic permanent nerve damage without actually being too cruel to people
	color = "#FFFFFF"
	overdose = REAGENTS_OVERDOSE * 4 //But takes a lot to OD

/datum/reagent/inaprovaline/synxchem/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		if(prob(5))
			M.custom_pain("You feel no pain despite the clear signs of damage to your body!",60)
		if(prob(2))
			M.custom_pain("You suddenly lose control over your body!",60)
			M.AdjustParalysis(1)
		M.add_chemical_effect(CE_STABLE, 15)
		M.add_chemical_effect(CE_PAINKILLER, 50)
		M.adjustBruteLoss(-0.2)//healing brute
		M.adjustToxLoss(0.4) //Dealing twice of it as tox, even if you have no brute, its not true conversion.
		M.adjustHalLoss(1)

/datum/reagent/inaprovaline/synxchem/holo
	name = "SX type simulation nanomachines" //Educational!
	description = "Type SX nanomachines to simulate what it feels like to come in contact with a synx, minus the damage"
	id = "fakesynxchem"
	metabolism = REM * 1 //ten times faster for convenience of testers.
	color = "#00FFFF"
	overdose = REAGENTS_OVERDOSE * 20 //it's all fake. But having nanomachines move through you is not good at a certain amount.

/datum/reagent/inaprovaline/synxchem/holo/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		if(prob(5))
			M.custom_pain("You feel no pain!",60)
		if(prob(2))
			M.custom_pain("You suddenly lose control over your body!",60)
			M.AdjustParalysis(1)
		M.add_chemical_effect(CE_STABLE, 15)
		M.add_chemical_effect(CE_PAINKILLER, 50)
		M.adjustBruteLoss(-0.2)//Made to simulate combat, also useful as very odd healer.
		M.adjustToxLoss(-0.2) //HELP ITS MAULING ME!
		M.adjustFireLoss(-0.2) //huh this mauling aint so bad
		M.adjustHalLoss(10) //OH MY GOD END MY PAIN NOW WHO MADE THIS SIMULATION

/datum/reagent/inaprovaline/synxchem/clown
	name = "HONK"
	description = "HONK"
	id = "clownsynxchem"
	metabolism = REM * 0.5
	color = "#FFFFFF"
	overdose = REAGENTS_OVERDOSE * 200

/datum/reagent/inaprovaline/synxchem/clown/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustToxLoss(0.01)
	playsound(M.loc, 'sound/items/bikehorn.ogg', 50, 1)
	M.adjustBruteLoss(-2)//healing brute
	if(prob(1))
		M.custom_pain("I have no horn but i must honk!",40)
	if(prob(2))
		var/location = get_turf(M)
		new /obj/item/weapon/bikehorn(location)
		M.custom_pain("You suddenly cough up a bikehorn!",60)

/datum/reagent/inaprovaline/synxchem/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		if(prob(5))
			M.custom_pain("You feel no pain despite the clear signs of damage to your body!",60)
		if(prob(2))
			M.custom_pain("You suddenly lose control over your body!",60)
			M.AdjustParalysis(1)
		M.add_chemical_effect(CE_STABLE, 15)
		M.add_chemical_effect(CE_PAINKILLER, 50)
		M.adjustBruteLoss(-0.2)//healing brute
		M.adjustToxLoss(0.1) //Dealing half of it as tox
		M.adjustHalLoss(1) //dealing 5 times the amount of brute healed as halo, but we cant feel pain yet
		// ^ I have no idea what this might cause, my ideal plan is that once the pain killer wears off you suddenly collapse;
		//Since Halloss is not "real" damage this should not cause death


/datum/reagent/inaprovaline/synxchem/overdose(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien != IS_DIONA)
		M.adjustHalLoss(-3)//im too nice
		M.adjustToxLoss(0.4)
		M.make_dizzy(10)
		if(prob(5))
			M.AdjustStunned(1)
		if(prob(2))
			M.AdjustParalysis(1)

/datum/reagent/inaprovaline/synxchem/holo/overdose(var/mob/living/carbon/M, var/alien, var/removed)
	return

/datum/reagent/inaprovaline/synxchem/clown/overdose(var/mob/living/carbon/M, var/alien, var/removed)
	return

//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// PASSIVE POWERS!!!! /////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
/mob/living/simple_mob/retaliate/synx/DoPunch(var/atom/A)
	. = ..()
	if(.) // If we succeeded in hitting.
		if(isliving(A))
			var/mob/living/L = A
			if(prob(forcefeedchance))//Forcefeeding code
				L.Weaken(5)
				stop_automated_movement = 1
				src.feed_self_to_grabbed(src,L)
				update_icon()
				stop_automated_movement = 0
			if(L.reagents)
				var/target_zone = pick(BP_TORSO,BP_TORSO,BP_TORSO,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_HEAD)
				if(L.can_inject(src, null, target_zone))
					L.reagents.add_reagent(poison_type, poison_per_bite)
					if(prob(poison_chance))
						to_chat(L, "<span class='warning'>You feel a strange substance on you.</span>")
						L.reagents.add_reagent(poison_type, poison_per_bite)

/mob/living/simple_mob/retaliate/synx/hear_say(message,verb,language,fakename,isItalics,var/mob/living/speaker)
	. = ..()
	if(!message)    return
	if (speaker == src) return
	speaker = speaker.GetVoice()
	speak += message
	voices += speaker
	if(voices.len>=memorysize)
		voices -= (pick(voices))//making the list more dynamic
	if(speak.len>=memorysize)
		speak -= (pick(speak))//making the list more dynamic
	if(resting)
		resting = !resting
	if(message=="Honk!")
		bikehorn()

/mob/living/simple_mob/retaliate/synx/pet/clown/Life()
	..()
	if(vore_fullness)
		size_multiplier = 1+(0.5*vore_fullness)
		update_icons()
	if(!vore_fullness && size_multiplier != 1)
		size_multiplier = 1
		update_icons()

/mob/living/simple_mob/retaliate/synx/handle_idle_speaking()
	if(voices && prob(speak_chance/2))
		randomspeech()

//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////// POWERS!!!! /////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

/mob/living/simple_mob/proc/contort()
	set name = "contort"
	set desc = "Allows to hide beneath tables or certain items. Toggled on or off."
	set category = "Abilities"

	if(stat == DEAD || paralysis || weakened || stunned || restrained())
		return

	if(status_flags & HIDING)
		status_flags &= ~HIDING
		reset_plane_and_layer()
		to_chat(src,"<span class='notice'>You have stopped hiding.</span>")
		speed = 2
	else
		status_flags |= HIDING
		layer = HIDING_LAYER //Just above cables with their 2.44
		plane = OBJ_PLANE
		to_chat(src,"<span class='notice'>You are now hiding.</span>")
		speed = 4

/mob/living/simple_mob/retaliate/synx/proc/disguise()
	set name = "Toggle Form"
	set desc = "Switch between amorphous and humanoid forms."
	set category = "Abilities"

	if(stat == DEAD || paralysis || weakened || stunned || restrained())
		return

	// If transform isn't true
	if(!transformed)
		to_chat(src,"<span class='warning'>you changed back into your disguise.</span>")
		icon_living = transformed_state //Switch state to transformed state
	else // If transformed is true.
		to_chat(src,"<span class='warning'>now they see your true form.</span>")
		icon_living = initial(icon_living) //Switch state to what it was originally defined.


	transformed = !transformed
	update_icons()

/mob/living/simple_mob/retaliate/synx/proc/randomspeech()
	set name = "speak"
	set desc = "Takes a sentence you heard and says it"
	set category = "Abilities"
	if(speak && voices)
		handle_mimic()
	else
		usr << "<span class='warning'>YOU NEED TO HEAR THINGS FIRST, try using Ventcrawl to eevesdrop on nerds</span>"

/mob/living/simple_mob/retaliate/synx/proc/handle_mimic()
	name = pick(voices)
	spawn(2)
		src.say(pick(speak))
	spawn(5)
		name = realname

////////////////////////////////////////
////////////////PET VERSION/////////////
////////////////////////////////////////
/mob/living/simple_mob/retaliate/synx/pet
	faction = "Cargonia" //Should not share a faction with those pesky non station synxes.//This is so newspaper has a failchance
	name = "Bob"
	desc = "A very regular pet."
	tt_desc = "synxus pergulus"
	glow_range = 4
	glow_toggle = 1
	player_msg = "You aren't supposed to be in this. Wrong mob."

/mob/living/simple_mob/retaliate/synx/pet/init_vore()
    ..()
    var/obj/belly/B = vore_selected
    B.vore_verb = "swallow"
    B.digest_burn = 1
    B.digest_brute = 0

/mob/living/simple_mob/retaliate/synx/pet/holo/init_vore()
	..()
	var/obj/belly/B = vore_selected
	B.vore_verb = "swallow"
	B.digest_burn = 5
	B.digest_brute = 5

/mob/living/simple_mob/retaliate/synx/pet
	speak_chance = 2.0666
	speak = list()

//HONKMOTHER Code.
/*/mob/living/simple_mob/retaliate/synx/proc/honk()
	set name = "HONK"
	set desc = "TAAA RAINBOW"
	set category = "Abilities"
	icon_state = "synx_pet_rainbow"
	icon_living = "synx_pet_rainbow"
	playsound(src.loc, 'sound/items/bikehorn.ogg', 50, 1)
*/
/mob/living/simple_mob/retaliate/synx/proc/bikehorn()
	playsound(src.loc, 'sound/items/bikehorn.ogg', 50, 1)

//HOLOSEEDSPAWNCODE
/mob/living/simple_mob/retaliate/synx/pet/holo/death()
	..()
	visible_message("<span class='notice'>\The [src] fades away!</span>")
	var/location = get_turf(src)
	new /obj/item/seeds/hardlightseed/typesx(location)
	qdel(src)

/mob/living/simple_mob/retaliate/synx/pet/holo/gib()
	visible_message("<span class='notice'>\The [src] fades away!</span>")
	var/location = get_turf(src)
	new /obj/item/seeds/hardlightseed/typesx(location)
	qdel(src)

////////////////////////////////////////
////////////////SYNX VARIATIONS/////////
////////////////////////////////////////
/mob/living/simple_mob/retaliate/synx/pet/holo
	poison_chance = 100
	poison_type = "fakesynxchem" //unlike synxchem this one heals!
	name = "Hardlight synx"
	desc = "A cold blooded, genderless, space eel.. or a hologram of one. Guess the current synx are undergoing re-training? Either way this one is probably infinitely more friendly.. and less deadly."
	icon_state = "synx_hardlight_living"
	icon_living = "synx_hardlight_living"
	icon_dead = "synx_hardlight_dead"
	icon_gib = null
	alpha = 127
	speak = list("SX System Online")
	faction = "neutral"//Can be safely bapped with newspaper.
	melee_damage_lower = 0 //Holos do no damage
	melee_damage_upper = 0
	meat_amount = 0
	meat_type = null
	//Vore Section
	vore_default_mode = DM_HEAL
	vore_capacity = 2
	vore_digest_chance = 0    //Holos cannot digest
	vore_pounce_chance = 40 //Shouldn't fight
	vore_bump_chance = 0 //lowered bump chance
	vore_escape_chance = 30 //Much higher escape chance.. it's a hologram.
	swallowTime = 10 SECONDS //Much more time to run

/mob/living/simple_mob/retaliate/synx/pet/greed
	name = "Greed"
	desc = "A cold blooded, genderless, parasitic eel from the more distant and stranger areas of the cosmos. black, perpetually grinning and possessing a hunger as enthusiastic and endless as humanity's sense of exploration.. This one has the name Greed burnt into its back, the burnt in name seems to be luminescent making it harder for it to blend into the dark."
	//icon= //icon= would just set what DMI we are using, we already have our special one set.
	icon_state = "synx_greed_living"
	icon_living = "synx_greed_living"
	icon_dead = "synx_greed_dead"
	speak = list("Who is there?")//preset unique words Greed remembers, to be defined more
	player_msg = "You Hunger."
	health = 100//Slightly lower health due to being damaged permanently.
	speak_chance = 5
	//Vore Section
	vore_capacity = 4 //What a fat noodle.
	vore_digest_chance = 1	//Multivore but lower digest chance
	vore_pounce_chance = 90 //Fighting is effort, engulf them whole.
	vore_bump_chance = 2 //lowered bump chance
	vore_escape_chance = 5 //Multivore allows for people to shove eachother out so lower normal escape chance.

/mob/living/simple_mob/retaliate/synx/pet/greed/synth
/*
▓███▓     ▓▓▓     ▓▓▓     ▓▓▓     ▓▓▓     ▓███▓   
 ▓▓   ▓▓▓█ ▓▓  ▓▓█ ▓▓  ▓▓█ ▓▓  ▓▓█ ▓▓  ▓▓█ ▓▓   ▓▓▓█ 
▓      ▓▓▓▓     ▓▓▓     ▓▓▓     ▓▓▓     ▓▓▓      ▓▓▓▓
▓      █▓▓▓     █▓▓     █▓▓     █▓▓     █▓▓      █▓▓▓
▓      █▓▓▓▓█  █▓▓ ▓█  █▓▓ ▓█  █▓▓█▓█  █▓▓▓      █▓▓▓
▓      █▓▓▓  ▓█▓    █▓█▓█   █▓█▓█   ▓▓█   ▓█     █▓▓▓
▓█     █▓▓▓          ▓▓▓     ▓▓▓          ▓▓     █▓▓▓
▓▓     █▓▓            ▓       ▓            ▓     █▓▓▓
 ▓     █▓▓                                 ▓█    █▓▓ 
  ▓    ▓▓▓                                 ▓▓   █▓▓  
   █\   ▓▓      ▓▓                   ▓█      ▓  █▓▓  
   ▓█\   ▓█    ▓█▓                   ▓▓▓    █▓ █▓▓   
    ▓▓▓█  ▓   ▓▓▓▓                   ▓ ▓▓   ▓ █▓▓    
        ▓█▓  ▓▓█▓▓                   ▓  ▓▓  ▓▓▓      
            ▓▓ █▓▓█                 █▓  █▓▓          
           ▓▓   ▓▓▓                 ▓▓   █▓▓         
           ▓    ▓▓▓                 ▓    █▓▓         
         ▓▓    █▓▓█               █▓    █▓▓▓         
         ▓     █▓▓▓  ▓▓█     █▓█  ▓▓    █▓▓▓         
         ▓     █▓▓▓▓▓  ▓▓█ ▓▓  ▓▓█▓     █▓▓▓         
         ▓     █▓▓▓     ▓▓▓     ▓▓▓     █▓▓▓         
         ▓     █▓▓▓     ▓▓▓     ▓▓▓     █▓▓▓         
           ▓█▓██▓▓▓█▓█▓█▓▓▓█▓█▓█▓▓▓█▓█▓██▓▓▓         
*/
	icon_state = "synx_C_living"
	icon_living = "synx_C_living"
	icon_dead = "synx_C_dead"
	hostile = 1
	name = "SYN-KinC"
	desc = "A robotic recreation of a an Alien parasite. The metal plates seem quite thick."
	humanoid_hands = 1
	health = 200 //Metally
	player_msg = "All systems nominal."
	/////////////////////ARMOR
	armor = list(
			"melee" = 50,
			"bullet" = 50,
			"laser" = -50,
			"energy" = -50,
			"bomb" = 50,
			"bio" = 100,
			"rad" = 100)
	////////////////////////////MED INJECTOR
	poison_type = "oxycodone" //OD effects, eye_blurry | Confuse + for slimes | stuttering
	poison_chance = 77 //high but not guranteed.
	poison_per_bite = 9 //OD for oxyc is 20
	//////////////////////////////////////////////FACTION
	faction = "SYN"
	
	
	New()
		..()
		name = "SYN-KinC-([rand(100,999)])"
	
/mob/living/simple_mob/retaliate/synx/pet/greed/synth/goodboy
	hostile = 0
	faction = "neutral"

/mob/living/simple_mob/retaliate/synx/pet/diablo
	//var/diablo_LIVING = "synx_diablo_living"
	//var/diablo_DEAD = "synx_diablo_dead"
	name = "diablo"
	desc = "A cold blooded, genderless, parasitic eel from the more distant and stranger areas of the cosmos. grey, perpetually grinning and possessing a hunger as enthusiastic and endless as humanity's sense of exploration.. This one has a small shock collar on it that reads 'diablo'."
	icon_state = "synx_diablo_living"
	icon_living = "synx_diablo_living"
	icon_dead = "synx_diablo_dead"
	speak = list( )
	//Vore Section
	vore_capacity = 2

/mob/living/simple_mob/retaliate/synx/pet/asteri
	name = "Asteri"
	desc = "A cold blooded, genderless, parasitic eel from the more distant and stranger areas of the cosmos. Bleak white, perpetually grinning and possessing a hunger as enthusiastic and endless as humanity's sense of exploration.. This one has distinctive markings over its face forming the shape of a star, and its back holds a sizeable scar leading up to a small implanted device just above its waist, the name 'Asteri' scribed across the metal."
	//icon= //icon= would just set what DMI we are using, we already have our special one set.
	icon_state = "synx_asteri_living"
	icon_living = "synx_asteri_living"
	icon_dead = "synx_asteri_dead"
	speak = list("Who is there?")//preset unique words Asteri remembers, to be defined more
	player_msg = "SCREAMING NOISES."
	health = 100//Slightly lower health due to being damaged permanently.
	speak_chance = 5
	//Vore Section
	vore_icons = SA_ICON_LIVING
	vore_capacity = 2
	vore_digest_chance = 50
	vore_pounce_chance = 40
	vore_bump_chance = 2
	vore_escape_chance = 5

/mob/living/simple_mob/retaliate/synx/pet/clown
	hostile = 1
	poison_chance = 100
	poison_type = "clownsynxchem" //unlike synxchem this one HONKS
	name = "Inflatable Clown Synx"
	desc = "Honk!, made this here with all the fun on in the booth. At the gate outside, when they pull up, they get me loose. Yeah, Jump Out Clowns, that's Clown gang, hoppin' out tiny cars. This shit way too funny, when we pull up give them the honk hard!"
	icon_state = "synx_pet_rainbow"
	icon_living = "synx_pet_rainbow"
	//icon_dead = "synx_hardlight_dead"
	icon_gib = null
	faction = "clown"
	melee_damage_lower = 1
	melee_damage_upper = 1
	environment_smash = 0
	destroy_surroundings = 0
	//Vore Section
	vore_default_mode = DM_HEAL
	vore_capacity = 10
	vore_digest_chance = 0
	vore_pounce_chance = 1 //MAKE THEM HONK
	vore_bump_chance = 0 //lowered bump chance
	vore_escape_chance = 100

////////////////////////////////////////
////////////////SYNX DEBUG//////////////
////////////////////////////////////////
/mob/living/simple_mob/retaliate/synx/pet/debug
	name = "Syntox"
	desc = "ERROR Connection to translation server could not be established!"

/mob/living/simple_mob/retaliate/synx/pet/debug/proc/rename()
	set name = "rename"
	set desc = "Renames the synx"
	set category = "DEBUG"
	name = input(usr, "What would you like to change name to?", "Renaming", null)

/mob/living/simple_mob/retaliate/synx/pet/debug/proc/redesc()
	set name = "redesc"
	set desc = "Redescribes the synx"
	set category = "DEBUG"
	desc = input(usr, "What would you like to change desc to?", "Redescribing", null)

/mob/living/simple_mob/retaliate/synx/pet/debug/proc/resprite()
	set name = "resprite"
	set desc = "Resprite the synx"
	set category = "DEBUG"
	icon_state = input(usr, "What would you like to change icon_state to?", "Respriting", null)

/mob/living/simple_mob/retaliate/synx/pet/debug/New()
	verbs |= /mob/living/simple_mob/retaliate/synx/pet/debug/proc/rename
	verbs |= /mob/living/simple_mob/retaliate/synx/pet/debug/proc/resprite
	verbs |= /mob/living/simple_mob/retaliate/synx/pet/debug/proc/redesc

////////////////////////////////////////
////////////////SYNX SPAWNER////////////
////////////////////////////////////////
/obj/random/mob/synx
	name = "This is synxes"

/obj/random/mob/synx/item_to_spawn()
	if(Holiday == "April Fool's Day") //WE WISH YOU A MERRY CLOWNMAS
		return /mob/living/simple_mob/retaliate/synx/pet/clown
	else return pick(prob(70);/mob/living/simple_mob/retaliate/synx/pet/greed,
		prob(50);/mob/living/simple_mob/retaliate/synx/pet/asteri,
		prob(20);/mob/living/simple_mob/retaliate/synx/pet/holo,)

////////////////////////////////////////////////////////////////////////////
//////////////////////////NOT A SYNX///////but looks kinda like one/////////
////////////////////////////////////////////////////////////////////////////
//So we got base synxes pretty much done, how about some special variants
/mob/living/simple_mob/retaliate/synx/pet/weepinggamblers
	name = "Synx?"
	desc = "A cold blooded, genderless, parasitic eel? Is it crying?"
	tt_desc = "Synxus?"
	forcefeedchance = 99 //You have a stomach? yeah they go in.
	poison_per_bite = 0 //no poison
	
	hostile = 1
	
	faction = "synx?"
	melee_damage_lower = 1
	melee_damage_upper = 1
	environment_smash = 1
	destroy_surroundings = 1

/mob/living/simple_mob/retaliate/synx/pet/weepinggamblers/New()
	..()
	faction = rand(1,5)
	switch(faction)
		if(1 , 2)
			voices |= "Unidentifiable Weeping"
			name = "Weeper"
			melee_damage_upper = 4
		if(3)
			voices |= "Radio Static"
			name = "Whistler"
			melee_damage_upper = 20
		if(4 , 5)
			voices |= "Unidentifiable Wailing"
			name= "Wailer"
			melee_damage_upper = 10
	speak |= "No one"
	
	voices -= "Garbled voice"
	voices -= "Unidentifiable Voice"
	speak -= "Who is there?"
	speak -= "What is that thing?!"

/mob/living/simple_mob/retaliate/synx/pet/weepinggamblers/MoveToTarget()
	var/mob/living/speaker
	if(target_mob)
		speaker = target_mob
		speak |= speaker.GetVoice()
	..()

/mob/living/simple_mob/retaliate/synx/pet/weepinggamblers/Life()
	..()
	if(prob(1) && faction <= 5)
		handlemutations(rand(1,5))

/mob/living/simple_mob/retaliate/synx/pet/weepinggamblers/proc/handlemutations(faction)
	switch(faction)
		if(1 , 2 , 11 , 12)
			voices = "Unidentifiable Weeping"
			name = "Weeper"
			melee_damage_upper = 4
		if(3 , 13) 
			voices = "Radio Static"
			name = "Whistler"
			melee_damage_upper = 20
		if(4 , 5 , 14 , 15) 
			voices = "Unidentifiable Wailing"
			name= "Wailer"
			melee_damage_upper = 10
		if(6 to 10 , 16 to 20)
			voices = "Breathing"
			name= "Silent"
		else return

//WEEPING END
