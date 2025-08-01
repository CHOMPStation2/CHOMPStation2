/*
A work in progress, lore will go here later. "Later." // Chompstation snrk, Rykka waz here. *pawstamp*
List of things solar grubs should be able to do:
1. What happened to item 1? Did one of you dorks eat it? :T -Ace
2. have three stages of growth depending on time. (Or energy drained altho that seems like a hard one to code)
3. be capable of eating people that get knocked out. (also be able to shock attackers that don’t wear insulated gloves.)
5. ((potentially use digested people to reproduce))
6. add glow?
*/

/datum/category_item/catalogue/fauna/solargrub		//TODO: VIRGO_LORE_WRITING_WIP
	name = "Solargrub"
	desc = "Some form of mutated space larva, they seem to crop up on space stations wherever there is power. \
	They seem to have the chance to cocoon and mutate if left alone, but no recorded instances of this have happened yet. \
	Therefore, if you see the grubs, kill them while they're small, or things might escalate." // TODO: PORT SOLAR MOTHS - Rykka
	value = CATALOGUER_REWARD_EASY

var/global/moth_amount = 0 // CHOMPEnable, Rykka waz here. *pawstamp*
// Ace was here too. Vorestation doesn't have solar moths yet! Uncomment this if someone else adds them. I don't know if Vorestation will like them.

/mob/living/simple_mob/vore/solargrub
	name = "juvenile solargrub"
	desc = "A young sparkling solargrub"
	catalogue_data = list(/datum/category_item/catalogue/fauna/solargrub)
	icon = 'icons/mob/vore.dmi'
	icon_state = "solargrub"
	icon_living = "solargrub"
	icon_dead = "solargrub-dead"

	var/charge = null // The amount of power we sucked off, in K as in THOUSANDS.
	// CHOMPEdit Start
	var/can_evolve = 1 // To decide whether this subspecies is allowed to become a queen, which Ace has set as 0 because there's no evolution form yet.
	var/adult_forms = "/mob/living/simple_mob/vore/solarmoth" // This decides what mob the queen form is. ex adult_forms = /mob/living/simple_mob/subtypes/vore/solarmoth
	// CHOMPEdit End
	// Don't leave that as null if you add solar moths.

	faction = FACTION_GRUBS
	maxHealth = 50
	health = 50

	melee_damage_lower = 1
	melee_damage_upper = 3 	//low damage, but poison and stuns are strong

	movement_cooldown = 3

	meat_type = /obj/item/reagent_containers/food/snacks/meat/grubmeat
	meat_amount = 6

	response_help = "pokes"
	response_disarm = "pushes"
	response_harm = "roughly pushes"

	ai_holder_type = /datum/ai_holder/simple_mob/retaliate/solargrub
	say_list_type = /datum/say_list/solargrub

	var/poison_per_bite = 5 //grubs cause a shock when they bite someone
	var/poison_type = REAGENT_ID_SHOCKCHEM
	var/poison_chance = 50
	var/datum/powernet/PN            // Our powernet
	var/obj/structure/cable/attached        // the attached cable
	var/shock_chance = 10 // Beware
	var/powerdraw = 100000
	var/tracked = FALSE

	can_be_drop_prey = FALSE //CHOMP Add
	allow_mind_transfer = TRUE
	glow_override = TRUE

/datum/say_list/solargrub
	emote_see = list("squelches", "squishes")

/mob/living/simple_mob/vore/solargrub/Initialize(mapload)
	. = ..()
	GLOB.existing_solargrubs += src

/mob/living/simple_mob/vore/solargrub/Life()
	. = ..()
	if(!.) return

	if(!ai_holder.target)
			//first, check for potential cables nearby to powersink
		var/turf/S = loc
		attached = locate(/obj/structure/cable) in S
		if(attached)
			set_AI_busy(TRUE)
			if(prob(2))
				src.visible_message(span_infoplain(span_bold("\The [src]") + " begins to sink power from the net."))
			if(prob(5))
				var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
				sparks.set_up(5, 0, get_turf(src))
				sparks.start()
			anchored = TRUE
			PN = attached.powernet
			PN.draw_power(powerdraw)
			charge = charge + (powerdraw/1000) //This adds raw powerdraw to charge(Charge is in Ks as in 1 = 1000)
			var/apc_drain_rate = 750 //Going to see if grubs are better as a minimal bother. previous value : 4000
			for(var/obj/machinery/power/terminal/T in PN.nodes)
				if(istype(T.master, /obj/machinery/power/apc))
					var/obj/machinery/power/apc/A = T.master
					if(A.operating && A.cell)
						var/cur_charge = A.cell.charge / CELLRATE
						var/drain_val = min(apc_drain_rate, cur_charge)
						A.cell.use(drain_val * CELLRATE)
		else if(!attached && anchored)
			anchored = FALSE
			PN = null
		//CHOMPEnable Start
		if(prob(1) && charge >= 32000 && can_evolve == 1 && moth_amount < 1) //it's reading from the moth_amount global list to determine if it can evolve. There should only ever be a maxcap of 1 existing solar moth alive at any time. TODO: make the code decrease the list after 1 has spawned this shift.
			anchored = 0
			PN = null
			release_vore_contents()
			if(prey_excludes)
				prey_excludes.Cut()
			moth_amount = moth_amount + 1
			death_star()
		// CHOMPEnable End

/mob/living/simple_mob/vore/solargrub/proc/death_star()
	visible_message(span_warning("\The [src]'s shell rips open and evolves!"))

/*
//Commenting this bit out. It's unncecessary, especially since we only use one form.
	var/chosen_form = pickweight(adult_forms)
	new chosen_form(get_turf(src))
*/
	new adult_forms(get_turf(src)) //Added this line to spawn the only form because the above is commented out.
	qdel(src)

/mob/living/simple_mob/vore/solargrub //active noms
	vore_bump_chance = 50
	vore_bump_emote = "applies minimal effort to try and slurp up"
	vore_active = 1
	vore_capacity = 1
	vore_pounce_chance = 0 //grubs only eat incapacitated targets
	vore_default_mode = DM_DIGEST

/mob/living/simple_mob/vore/solargrub/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(prob(shock_chance))
			A.emp_act(4) //The weakest strength of EMP
			playsound(src, 'sound/weapons/egloves.ogg', 75, 1)
			L.Weaken(4)
			L.Stun(4)
			L.stuttering = max(L.stuttering, 4)
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(5, 1, L)
			s.start()
			visible_message(span_danger("The grub releases a powerful shock!"))
		else
			if(L.reagents)
				var/target_zone = pick(BP_TORSO,BP_TORSO,BP_TORSO,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_HEAD)
				if(L.can_inject(src, null, target_zone))
					inject_poison(L, target_zone)

// Does actual poison injection, after all checks passed.
/mob/living/simple_mob/vore/solargrub/proc/inject_poison(mob/living/L, target_zone)
	if(prob(poison_chance))
		to_chat(L, span_warning("You feel a small shock rushing through your veins."))
		L.reagents.add_reagent(poison_type, poison_per_bite)

/mob/living/simple_mob/vore/solargrub/death()
	src.anchored = FALSE
	set_light(0)
	..()

/mob/living/simple_mob/vore/solargrub/Destroy()
	GLOB.existing_solargrubs -= src
	. = ..()

/mob/living/simple_mob/vore/solargrub/handle_light()
	. = ..()
	if(. == 0 && !is_dead())
		set_light(2.5, 1, COLOR_YELLOW)
		return 1
	else if(is_dead())
		glow_override = FALSE

/mob/living/simple_mob/vore/solargrub/load_default_bellies()
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "Through either grave error, overwhelming willingness, or some other factor, you find yourself lodged halfway past the solargrub's mandibles. While it had initially hissed and chittered in glee at the prospect of a new meal, it is clearly more versed in suckling on power cables; inch by inch, bit by bit, it undulates forth to slowly, noisily gulp you down its short esophagus... and right into its extra-cramped, surprisingly hot stomach. As the rest of you spills out into the plush-walled chamber, the grub's soft body bulges outwards here and there with your compressed figure. Before long, a thick slime oozes out from the surrounding stomach walls; only time will tell how effective it is on something solid like you..."
	B.vore_sound = "Tauric Swallow"
	B.release_sound = "Pred Escape"
	B.fancy_vore = 1
	B.belly_fullscreen_color = "#baca24"
	B.belly_fullscreen = "VBOanim_belly1"
	B.colorization_enabled = TRUE

	B.emote_lists[DM_HOLD] = list(
		"The air trapped within the solargrub is hot, humid, and tinged with ozone, but otherwise mercifully harmless to you aside from being heavy on the lungs.",
		"Your doughy, squishy surroundings heavily pulse around your body as the solargrub attempts to wriggle elsewhere, its solid prey weighing it down quite a bit.",
		"Suddenly, an arc of electricity harmlessly jumps through the grub's stomach, briefly illuminating your slimy, glistening surroundings in a flash of yellow.",
		"With all the power coursing through the solargrub's body, its inner muscles are in a constant state of vibrating all over you, adding an extra element to your full-body massage.",
		"For a moment, the solargrub's stomach walls clench down even more firmly than before, working its subtle inner vibrations into your muscles, steadily relaxing them down.",
		"The incredible heat trapped within the solargrub helps daze and disorient you, ensuring that its new filling wouldn't interfere in its power-draining.")

	B.emote_lists[DM_DIGEST] = list(
		"Every breath taken inside the solargrub is swelteringly hot, painfully thick, and more than subtly caustic, worsening with every passing moment spent inside!",
		"As the solargrub wriggles off somewhere quiet to digest its meal, the resulting undulations help crush you down into a more compact, easier to handle morsel!",
		"From time to time, additional jolts of electricity unpleasantly course through your body, helping ensure that the solargrub's food was thoroughly paralyzed!",
		"With how incredibly charged the solargrub is, its constant internal vibrating adds an additional layer of processing to its stomach's slow, steady churning, helping break you down faster!",
		"The solargrub chitters in irritation at your continued solidity, followed by a string of crushingly tight stomach clenches that grind its caustic stomach ooze into your body!",
		"The deceptively severe heat trapped within the solargrub works in tandem with its inner muscles and your tingling, prickling stomach juice bath to weaken you!")

/datum/ai_holder/simple_mob/retaliate/solargrub/react_to_attack(atom/movable/attacker)
	holder.anchored = FALSE
	holder.set_AI_busy(FALSE)
	..()
