/*
 *	This file is used as the main file for the mimic.
 *	This is heavily inspired by PREY 2017. Go play it.
 *	Mimics are intended to be able to take the form of objects up to and including medbots/engibots/etc for Greater Mimics.
 *	Mimics generate phantoms from dead people. VERY DANGEROUS.
 *	Codewise: A lot of the code is pulled from the morph for taking forms, because why reinvent the wheel, unless there's a drastic issue?
*/
//TODO: Add special cases for objects where contents might be dumped out, or modified in ways we don't want.
//TODO: Relay attacks to the mob when morphed
//TODO: Probably add a blacklist for morphing, or even a whitelist. NOTE: I had a terrifying daydream while writing this about a mimic turning into the Supermatter Crystal and terrorizing the station. DEFINITELY ADD A BLACKLIST.

/datum/category_item/catalogue/aberration/mimic
	name = "UNKNOWN - Aberration Classification: MIMIC"
	desc = "Classification: ????? \
	<br><br>\
	It is primarily a hunter but may also scavenge, with the capacity to eat and digest skin, bone and other animal waste. \
	The spotted hyena displays greater plasticity in its hunting and foraging behaviour than other similar carnivores; \
	it hunts alone, in small parties of 2–5 individuals or in large groups. \
	During a hunt, spotted hyenas often run through ungulate herds in order to select an individual to attack. \
	Once selected, their prey is chased over a long distance, often several kilometres, at speeds of up to 60 km/h."
	value = CATALOGUER_REWARD_MEDIUM

// You carry this thing on station? You're gonna have a bad day.
/mob/living/simple_mob/nightmare/mimic
	name = "mimic"
	desc = "A shiny, shimmering black substance that skitters on four legs - and seems to flee from direct confrontation unless alone."
	health = 9
	maxHealth = 9
	pass_flags = PASSTABLE
	movement_cooldown = 0 	// VERY FAST CRITTERS.
	mob_bump_flag = SLIME
	has_hands = TRUE		// Required for interacting with stuff. Remove this if unwanted.
	var/atom/movable/form	// Current form. Will be null unless we're currently morphed.
	var/threatened = FALSE	// Are we threatened/in danger right now?
	var/last_shift			// When did we last change forms?
	var/last_reproduction	// When did we last reproduce a Husk or Weaver?
	var/shiftready = TRUE	// Are we ready to assume a new form?
	var/morphed = FALSE		// Are we morphed currently? IE not our base form.
	var/energy = 200		// How much energy we have to move in object + mimic form.
	var/max_energy = 200	// Our maximum energy stores, regenerated over time. Ticks away at a rate of 2 (mimic), 4 (object) per move, allowing 100 tiles of movement in mimic form, 50 tiles as object.
	var/riding_datum_path = /datum/riding/morph
	
/mob/living/simple_mob/nightmare/mimic/Initialize()
	verbs += /mob/living/proc/ventcrawl
	return ..()

/mob/living/simple_mob/nightmare/mimic/Destroy()
	form = null
	return ..()
	
/atom/movable/examine(mob/user, infix, suffix)
	. = ..()
	var/datum/riding/morph/morph_riding = riding_datum
	if(riding_datum && istype(morph_riding)) //This should only be true if we're a mimic's form.
		if(get_dist(user, src) <= 3)
			. += "<span class='warning'>[src] doesn't look quite right...</span>"
			var/mob/living/simple_mob/nightmare/mimic/underlying_mimic = morph_riding.in_control
			if(!user.is_incorporeal() && user != underlying_mimic) //Ghosts shouldn't be able to make us jitter
				underlying_mimic.make_jittery(rand(150,200))

/*/mob/living/simple_mob/nightmare/mimic/examine(mob/user) //This is pointless because when we're morphed, examines aren't passed to us, they're passed to the form. See above code for how we handle it.
	if(morphed)
		. = form.examine(user)
		if(get_dist(user, src) <= 3)
			. += "<span class='warning'>[form] doesn't look quite right...</span>"
			if(!user.is_incorporeal()) //Ghosts shouldn't be able to make us jitter
				make_jittery(rand(150,200))
	else
		. = ..()*/
		
// Mimic Abilities Start Here //
// Morphing into an object //

// De-Morphing (Resuming our Mimic Form)
/mob/living/simple_mob/nightmare/mimic/verb/unmorph()
	set category = "Abilities"
	set name = "Unmorph"
	set desc = "Allows you to return to your original form, unmorphing you from an object."
	if(!morphed)
		to_chat(src,"<span class='warning'>You have to be morphed to unmorph</span>")
		return
	src.forceMove(form.loc)
	qdel(form)
	form = null
	morphed = FALSE

// Morph Ability - Transforms us into an object. Pass through the object we've selected as an arg, such as: morph(sodacan)
/mob/living/simple_mob/nightmare/mimic/verb/morph(atom/A as mob|obj in _validate_atom(A))
	set name = "Morph into Object"
	set desc = "Allows you to transform into an object, taking on it's properties, able to observe and move. A word of warning - observers WILL see you jitter if they examine you, or periodically at random intervals."
	set category = "Abilities"

	if(A == src)
		to_chat(src,"<span class='warning'>You can't morph into yourself!</span>")
		return
	if(morphed)
		to_chat(src,"<span class='warning'>You can't morph while you're already morphed!</span>")
		return
	
	form = new A.type(loc) //Create new identical copy of object at our loc
	if(form) //Sanity check
		src.forceMove(form) //Put ourselves into the contents of the new object
		form.riding_datum = new riding_datum_path(form,src) //This allows the mimic to move the object they're inside of. See explanation below with definition of /datum/riding/morph
		morphed = TRUE

//Code copied from code/_onclick/click.dm line 341 and modified to work with morphing
/mob/living/simple_mob/nightmare/mimic/face_atom(var/atom/A)
	var/dx
	var/dy
	if(morphed)
		if(!A || !form.x || !form.y || !A.x || !A.y) return
		dx = A.x - form.x
		dy = A.y - form.y
	else
		if(!A || !x || !y || !A.x || !A.y) return
		dx = A.x - x
		dy = A.y - y
	
	if(!dx && !dy) return

	var/current_dir = morphed ? form.dir : dir //Are we changing our own direction, or forms direction?
	var/direction
	if(abs(dx) < abs(dy))
		if(dy > 0)	direction = NORTH
		else		direction = SOUTH
	else
		if(dx > 0)	direction = EAST
		else		direction = WEST
	if(direction != current_dir)
		facedir(direction)

/mob/living/simple_mob/nightmare/mimic/facedir(var/ndir) //Relay changing directions to our forms as well
	. = ..()
	if(. && morphed)
		form.set_dir(ndir)

//Copied from code/modules/mob/animations.dm line 48, with the human check removed
/mob/living/simple_mob/nightmare/mimic/make_jittery(var/amount)
	jitteriness = min(1000, jitteriness + amount)	// store what will be new value
													// clamped to max 1000
	if(jitteriness > 100 && !is_jittery)
		spawn(0)
			jittery_process()

//Copied from code/modules/mob/animations.dm line 60 and modified to be able to make morphed form jitter as well
/mob/living/simple_mob/nightmare/mimic/jittery_process() //Should be able to handle transformations mid-jitter
	is_jittery = 1
	var/form_old_x
	var/form_old_y
	while(jitteriness > 100)
		var/amplitude = min(4, jitteriness / 100)
		if(morphed)
			if(isnull(form_old_x))
				form_old_x = form.pixel_x
				form_old_y = form.pixel_y
			form.pixel_x = form_old_x + rand(-amplitude, amplitude)
			form.pixel_y = form_old_y + rand(-amplitude/3, amplitude/3)
		else
			pixel_x = old_x + rand(-amplitude, amplitude)
			pixel_y = old_y + rand(-amplitude/3, amplitude/3)

		sleep(1)
	//endwhile - reset the pixel offsets to zero
	is_jittery = 0
	pixel_x = old_x
	pixel_y = old_y
	if(morphed && !isnull(form_old_x))
		form.pixel_x = form_old_x
		form.pixel_y = form_old_y

//So, the riding datum here is mostly just being used as it's convenient and already does what we need it to do. 
//Movements are relayed to it starting with (at the time of writing) code/modules/mob/mob_movement.dm line 216, under client/Move()
//which relays to code/game/atoms_movable.dm line 246 under /atom/movable/relaymove()
//which then relays to code/datums/riding.dm line 106 under handle_ride()
//which finally relays the movement to the ridden object.
/datum/riding/morph
	vehicle_move_delay = 0
	var/mob/in_control

/datum/riding/morph/New(atom/movable/_ridden,mob/morph)
	ridden = _ridden
	in_control = morph

//This makes sure that the mimic is the one doing the movement. You could add some additional checks here if you wanted to prevent movement under certain circumstances.
/datum/riding/morph/handle_ride(mob/user, direction)
	if(user != in_control)
		return
	. = ..()