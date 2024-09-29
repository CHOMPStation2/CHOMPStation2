#define NUTRITION_FRUIT 250 //The amount of nutrition needed to produce a fruit
#define NUTRITION_PITCHER 3 * NUTRITION_FRUIT //The amount of nutrition needed to produce a new pitcher
#define NUTRITION_MEAT 50 //The amount of nutrition provided by slabs of meat
#define PITCHER_SATED 250 //The amount of nutrition needed before the pitcher will attempt to grow fruit.
#define PITCHER_HUNGRY 150 //The nutrition cap under which the pitcher actively attempts to lure prey.

GLOBAL_LIST_INIT(pitcher_plant_lure_messages, list(
	"The pitcher plant smells lovely, beckoning you closer.",
	"The sweet scent wafting from the pitcher plant  makes your mouth water.",
	"You feel an urge to investigate the pitcher plant closely.",
	"You find yourself staring at the pitcher plant without really thinking about it.",
	"Doesn't the pitcher plant smell amazing?")) //Messages sent to nearby players if the pitcher is trying to lure prey. This is global to prevent a new list every time a new pitcher plant spawns.

//Pitcher plants, a passive carnivorous plant mob for xenobio and space vine spawning.
//Consider making immune to space vine entangling. Check entangle_immunity in the old CHOMPstation github for an example.
/mob/living/simple_mob/vore/pitcher_plant
	name = "pitcher plant"
	desc = "A carnivorous pitcher plant, bigger than a man."
	tt_desc = "Sarraceniaceae gigantus"

	icon_state = "pitcher_plant"
	icon_living = "pitcher_plant"
	icon_dead = "pitcher_plant_dead"
	icon = 'modular_chomp/icons/mob/vore_ch.dmi'

	anchored = 1 //Rooted plant. Only killing it will let you move it.
	maxHealth = 200
	health = 200
	a_intent = I_HELP //White this is help by default I'm leaving this here as a reminder thatdisarm will prevent playersfrom swapping places with the pitcher (but interfere with vore bump).
	faction = "plants" //Makes plantbgone deadly.
	ai_holder_type = /datum/ai_holder/simple_mob/passive/pitcher //It's a passive carnivorous plant, it can't detect or interact with people.

	min_oxy = 0 //Immune to atmos because so are space vines. This is arbitrary and can be tweaked if desired.
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	melee_damage_upper = 0 //This shouldn't attack people but if it does (admemes) no damage can be dealt.
	melee_damage_lower = 0

	armor = list(
				"melee" = 0,
				"bullet" = 0,
				"laser" = -50,
				"energy" = 0,
				"bomb" = 0,
				"bio" = 0,
				"rad" = 100)

	var/fruit = FALSE //Has the pitcher produced a fruit?
	var/meat = 0 //How many units of meat is the plant digesting? Separate from actual vore mechanics.
	var/meatspeed = 5 //How many units of meat is converted to nutrition each tick?
	var/pitcher_metabolism = 0.1 //How much nutriment does the pitcher lose every 2 seconds? 0.1 should be around 30 every 10 minutes.
	var/scent_strength = 5 //How much can a hungry pitcher confuse nearby people?
	var/last_lifechecks = 0 //Timing variable to limit vore/hungry proc calls
	var/list/pitcher_plant_lure_messages = null

	can_be_drop_prey = FALSE //CHOMP Add




/mob/living/simple_mob/vore/pitcher_plant //Putting vore variables separately because apparently that's tradition.
	vore_bump_chance = 100
	vore_bump_emote = "slurps up" //Not really a good way to make the grammar work with a passive vore plant.
	vore_active = 1
	vore_icons = 1
	vore_capacity = 1
	vore_pounce_chance = 0 //Plants only eat people who stumble into them.
	swallowTime = 3 //3 deciseconds. This is intended to be nearly instant, e.g. victim trips and falls in.
	vore_ignores_undigestable = 0
	vore_default_mode = DM_DIGEST

/mob/living/simple_mob/vore/pitcher_plant/init_vore()
	if(!voremob_loaded)
		return
	.=..()
	var/obj/belly/B = vore_selected
	B.desc	= "You leaned a little too close to the pitcher plant, stumbling over the lip and splashing into a puddle of liquid filling the bottom of the cramped pitcher. You squirm madly, righting yourself and scrabbling at the walls in vain as the slick surface offers no purchase. The dim light grows dark as the pitcher's cap lowers, silently sealing the exit. With a sinking feeling you realize you won't be able to push the exit open even if you could somehow climb that high, leaving you helplessly trapped in the slick, tingling fluid. ((You can't escape this mob without help but you may use OOC Escape if you wish.))"
	B.digest_burn = 0.5
	B.digest_brute = 0
	B.vore_verb = "trip"
	B.name = "pitcher"
	B.mode_flags = DM_FLAG_THICKBELLY
	B.wet_loop = 0 //As nice as the fancy internal sounds are this is a plant.
	B.digestchance = 0
	B.escapechance = 0
	B.fancy_vore = 1
	B.vore_sound = "Squish2"
	B.release_sound = "Pred Escape"
	B.contamination_color = "purple"
	B.contamination_flavor = "Wet"
//Why is it we have all these customizeable belly options which nobody ever alters for mobs?

	B.emote_lists[DM_HOLD] = list(
		"Slick fluid trickles over you, carrying threads of sweetness.",
		"Everything is still, dark, and quiet. Your breaths echo quietly.",
		"The surrounding air feels thick and humid.")

	B.emote_lists[DM_DIGEST] = list(
		"The slimy puddle stings faintly. It seems the plant has no need to quickly break down victims.",
		"The humid air settles in your lungs, keeping each breath more labored than the last.",
		"Fluid drips onto you, burning faintly as your body heat warms it."
		)

	B.emote_lists[DM_DRAIN] = list(
		"Each bead of slick fluid running down your body leaves you feeling weaker.",
		"It's cramped and dark, the air thick and heavy. Your limbs feel like lead.",
		"Strength drains from your frame. The cramped chamber feels easier to settle into with each passing moment.")

/mob/living/simple_mob/vore/pitcher_plant/Life()
	. = ..()
	if(!.)
		return

	var/lastmeat = meat //If Life procs every 2 seconds that means it takes 20 seconds to digest a steak
	meat = max(0,meat - meatspeed) //Clamp it to zero
	adjust_nutrition(lastmeat - meat) //If there's no meat, this will just be zero.
	if(nutrition >= PITCHER_SATED + NUTRITION_FRUIT)
		if(prob(10)) //Should be about once every 20 seconds.
			grow_fruit()
	var/lastnutrition = nutrition
	adjust_nutrition(-pitcher_metabolism)
	adjustBruteLoss(nutrition - lastnutrition)
	adjustToxLoss((nutrition - lastnutrition) * 3)
	if(nutrition < pitcher_metabolism)
		adjustToxLoss(pitcher_metabolism)
	if(world.time > last_lifechecks + 30 SECONDS)
		last_lifechecks = world.time
		vore_checks()
		handle_hungry()

/mob/living/simple_mob/vore/pitcher_plant/New()
	..()
	pitcher_plant_lure_messages = GLOB.pitcher_plant_lure_messages

/mob/living/simple_mob/vore/pitcher_plant/Initialize()
	..()
	pitcher_plant_lure_messages = GLOB.pitcher_plant_lure_messages


/mob/living/simple_mob/vore/pitcher_plant/death()
	..()
	anchored = 0
	if(fruit)
		new /obj/item/reagent_containers/food/snacks/pitcher_fruit(get_turf(src))
		fruit = FALSE



/mob/living/simple_mob/vore/pitcher_plant/proc/grow_fruit() //This proc handles the pitcher turning nutrition into fruit (and new pitchers).
	if(!fruit)
		if(nutrition >= PITCHER_SATED + NUTRITION_FRUIT)
			fruit = TRUE
			adjust_nutrition(-NUTRITION_FRUIT)
			return
		else
			return
	if(fruit)
		if(nutrition >= PITCHER_SATED + NUTRITION_PITCHER)
			var/turf/T = safepick(circleviewturfs(src, 2))
			if(T.density) //No spawning in walls
				return
			else if(src.loc ==T)
				return
			else
				new /mob/living/simple_mob/vore/pitcher_plant(get_turf(T))
				fruit = FALSE //No admeming this to spawn endless pitchers.
				adjust_nutrition(-NUTRITION_PITCHER)

/mob/living/simple_mob/vore/pitcher_plant/attack_hand(mob/living/user)
	if(user.a_intent == I_HELP)
		if(fruit)
			to_chat(user, "You pick a fruit from \the [src].")
			var/obj/F = new /obj/item/reagent_containers/food/snacks/pitcher_fruit(get_turf(user)) //Drops at the user's feet if put_in_hands fails
			fruit = FALSE
			user.put_in_hands(F)
		else
			to_chat(user, "The [src] hasn't grown any fruit yet!")
	else
		..()

/mob/living/simple_mob/vore/pitcher_plant/examine(mob/user)
	. = ..()
	if(fruit)
		. += "A plump fruit glistens beneath \the [src]'s cap."

/mob/living/simple_mob/vore/pitcher_plant/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/reagent_containers/food/snacks/meat))
		if(meat > NUTRITION_FRUIT - NUTRITION_MEAT) //Can't exceed 250
			to_chat(user, "The [src] is full!")
			return
		else
			meat += NUTRITION_MEAT
			qdel(O)
			return
	if(istype(O, /obj/item/stack/cable_coil)) //How to free people without killing the pitcher. I guess cable is ss13 rope.
		var/mob/living/carbon/human/H
		var/N = 0
		for(H in vore_selected.contents) //Only works for carbons, RIP mice. Should pick the first human the code finds.
			user.visible_message("[user] tries to fish somebody out of \the [src].", "You try to snag somebody trapped in \the [src]...")
			if(do_after(user, rand(3 SECONDS, 7 SECONDS))) //You can just spam click to stack attempts if you feel like abusing it.
				if(prob(15))
					user.visible_message("[user] tugs a sticky [H] free from \the [src].", "You heft [H] free from \the [src].")
					prey_excludes += H
					vore_selected.release_specific_contents(H)
					N = 1
					//addtimer(CALLBACK(src, PROC_REF(removeMobFromPreyExcludes), weakref(H)), 1 MINUTES) //At the time of this PR, removeMobFromPreyExcludes breaks prey_excludes by deleting the list which causes problems with the Crossed() vore override before. This can be commented back in if that gets fixed.
					break
				else
					to_chat(user, "The victim slips from your grasp!")
					N = 1
					break //We need to terminate the loop after each outcome or this could loop through multiple bellies. Of course, there should only be one belly.
		if(!N)
			to_chat(user, "The pitcher is empty.")
	if(istype(O, /obj/item/newspaper))
		return //Can't newspaper people to freedom.
	..()

/mob/living/simple_mob/vore/pitcher_plant/proc/vore_checks()
	if(ckey) //This isn't intended to be a playable mob but skip all of this if it's player-controlled.
		return
	if(vore_selected && vore_selected.contents.len) //Looping through all (potential) vore bellies would be more thorough but probably not worth the processing power if this check happens every 30 seconds.
		var/mob/living/L
		var/N = 0
		var/hasdigestable = 0
		var/hasindigestable = 0
		for(L in vore_selected.contents)
			if(istype(L, /mob/living/carbon/human/monkey))
				L.nutrition = 0 //No stuffing monkeys with protein shakes for massive nutrition.
			if(!L.digestable)
				vore_selected.digest_mode = DM_DRAIN
				N = 1
				hasindigestable = 1
				continue
			else
				vore_selected.digest_mode = DM_DIGEST
				N = 1
				hasdigestable = 1
				continue
		if(hasdigestable && hasindigestable)
			vore_selected.digest_mode = DM_DIGEST //Let's digest until we digest all the digestable prey, then move onto draining indigestable prey.
		if(!N)
			vore_selected.release_all_contents() //If there's no prey, spit out everything.



/mob/living/simple_mob/vore/pitcher_plant/proc/handle_hungry() //Let's run this check every 30 seconds. This is how a hungry pitcher tries to lure prey.
	if(nutrition <= PITCHER_HUNGRY) //Is sanity check another way to say redundancy?
		var/turf/T = get_turf(src)
		var/cardinal_turfs = T.CardinalTurfs()

		for(var/mob/living/carbon/human/H in oview(2, src))
			if(!istype(H) || !isliving(H) || H.stat == DEAD) //Living mobs only
				continue
			if(isSynthetic(H) || !H.species.breath_type || H.internal) //Exclude species which don't breathe or have internals.
				continue
			if(src.Adjacent(H)) //If they can breathe and are next to the pitcher, confuse them.
				to_chat(H,span_red("The sweet, overwhelming scent from \the [src] makes your senses reel!"))
				H.Confuse(scent_strength)
				continue
			else
				to_chat(H, span_red("[pick(pitcher_plant_lure_messages)]"))

		for(var/turf/simulated/TR in cardinal_turfs)
			TR.wet_floor(1) //Same effect as water. Slip into plant, get ate.
	else
		return
/mob/living/simple_mob/vore/pitcher_plant/Crossed(atom/movable/AM as mob|obj) //Yay slipnoms
	if(AM.is_incorporeal())
		return
	if(istype(AM, /mob/living) && will_eat(AM) && !istype(AM, type) && prob(vore_bump_chance) && !ckey)
		animal_nom(AM)
	..()

/datum/ai_holder/simple_mob/passive/pitcher
	wander = 0

/obj/item/reagent_containers/food/snacks/pitcher_fruit //As much as I want to tie hydroponics harvest code to the mob, this is simpler (albeit kinda hacky).
	name = "squishy fruit"
	desc = "A tender, fleshy fruit with a thin skin."
	icon = 'icons/obj/hydroponics_products.dmi'
	icon_state = "treefruit-product"
	color = "#a839a2"
	trash = /obj/item/seeds/pitcherseed
	nutriment_amt = 1
	nutriment_desc = list("pineapple" = 1)
	w_class = ITEMSIZE_SMALL
	var/datum/seed/seed = null
	var/obj/item/seeds/pit = null

/obj/item/reagent_containers/food/snacks/pitcher_fruit/Initialize()
	. = ..()
	reagents.add_reagent("pitcher_nectar", 5)
	bitesize = 4
	pit = new /obj/item/seeds/pitcherseed(src.contents)
	seed = pit.seed

/obj/item/reagent_containers/food/snacks/pitcher_fruit/afterattack(obj/O as obj, mob/user as mob, proximity)
	if(istype(O,/obj/machinery/microwave))
		return ..()
	if(istype (O, /obj/machinery/seed_extractor))
		pit.loc = O.loc //1 seed, perhaps balanced because you can get the reagents and the seed. Can be increased if desirable.
		qdel(src)
	if(!(proximity && O.is_open_container()))
		return
	to_chat(user, "<span class='notice'>You squeeze \the [src], juicing it into \the [O].</span>")
	reagents.trans_to(O, reagents.total_volume)
	user.drop_from_inventory(src)
	pit.loc = user.loc
	qdel(src)

/obj/item/reagent_containers/food/snacks/pitcher_fruit/attack_self(mob/user)
	to_chat(user, "<span class='notice'>You plant the fruit.</span>")
	new /obj/machinery/portable_atmospherics/hydroponics/soil/invisible(get_turf(user),src.seed)
	GLOB.seed_planted_shift_roundstat++
	qdel(src)
	return

#undef NUTRITION_FRUIT
#undef NUTRITION_PITCHER
#undef NUTRITION_MEAT
#undef PITCHER_SATED
#undef PITCHER_HUNGRY
