/*
	dreams = list(
	"an ID card","a bottle","a familiar face","a crewmember","a toolbox","a Security Officer","the Site Manager",
	"voices from all around","deep space","a doctor","the engine","a traitor","an ally","darkness",
	"light","a scientist","a monkey","a catastrophe","a loved one","a gun","warmth","freezing","the sun",
	"a hat","the Luna","a ruined station","a planet","phoron","air","the medical bay","the bridge","blinking lights",
	"a blue light","an abandoned laboratory","NanoTrasen","mercenaries","blood","healing","power","respect",
	"riches","space","a crash","happiness","pride","a fall","water","flames","ice","melons","flying","the eggs","money",
	"the Head of Personnel","the Head of Security","the Chief Engineer","the Research Director","the Chief Medical Officer",
	"the Detective","the Warden","an Internal Affairs Agent","an Engineer","the Janitor","the Atmospheric Technician",
	"the Quartermaster","a Cargo Technician","the Botanist","a Shaft Miner","the Psychologist","the Chemist","a Geneticist",
	"the Virologist","the Roboticist","the Chef","the Bartender","the Chaplain","the Librarian","a mouse","an ERT member",
	"a beach","the holodeck","a smoky room","a voice","the cold","a mouse","an operating table","the bar","the rain","a Skrell",
	"an Unathi","a Tajaran","the Station Intelligence core","the mining station","the research station","a beaker of strange liquid",
	"a Teshari", "a Diona nymph","the supermatter","Major Bill","a Morpheus ship with a ridiculous name","the Exodus","a star",
	"a Dionaea gestalt","the chapel","a distant scream","endless chittering noises","glowing eyes in the shadows","an empty glass",
	"a disoriented Promethean","towers of plastic","a Gygax","a synthetic","a Man-Machine Interface","maintenance drones",
	"unintelligible writings","a Fleet ship",
	//VOREStation Additions after this
	"slimey surroundings","a sexy squirrel","licking their lips","a gaping maw","an unlikely predator","sinking inside",
	"vulpine assets","more dakka","churning guts","pools of fluid","an exceptional grip","mawing in faces","gaping throat",
	"swallowed whole","a fox","a wolf","a cat","a tiger","a dog","a taur","a xenochimera"
	)
*/

#define DREAMING_SOURCE "dreaming_source"

/**
 * Begins the dreaming process on a sleeping carbon.
 *
 * Checks a 5% chance and whether or not the carbon this is called on is already dreaming. If
 * the prob() passes and there are no dream images left to display, a new dream is constructed.
 */

/mob/living/carbon/proc/handle_dreams()
	if(!HAS_TRAIT(src, TRAIT_DREAMING) && prob(5))
		dream()

/**
 * Generates a dream sequence to be displayed to the sleeper.
 *
 * Generates the "dream" to display to the sleeper. A dream consists of a subject, a verb, and (most of the time) an object, displayed in sequence to the sleeper.
 * Dreams are generated as a list of strings stored inside dream_fragments, which is passed to and displayed in dream_sequence().
 * Bedsheets on the sleeper will provide a custom subject for the dream, pulled from the dream_messages on each bedsheet.
 */

/mob/living/carbon/proc/dream()
	set waitfor = FALSE

	var/datum/dream/chosen_dream = pick_weight(GLOB.dreams)

	ADD_TRAIT(src, TRAIT_DREAMING, DREAMING_SOURCE)
	dream_sequence(chosen_dream.GenerateDream(src), chosen_dream)

/**
 * Displays the passed list of dream fragments to a sleeping carbon.
 *
 * Displays the first string of the passed dream fragments, then either ends the dream sequence
 * or performs a callback on itself depending on if there are any remaining dream fragments to display.
 *
 * Arguments:
 * * dream_fragments - A list of strings, in the order they will be displayed.
 * * current_dream - The dream datum used for the current dream
 */

/mob/living/carbon/proc/dream_sequence(list/dream_fragments, datum/dream/current_dream)
	//if(stat != UNCONSCIOUS || HAS_TRAIT(src, TRAIT_CRITICAL_CONDITION))
	if(stat != UNCONSCIOUS || stat == DEAD)
		REMOVE_TRAIT(src, TRAIT_DREAMING, DREAMING_SOURCE)
		current_dream.OnDreamEnd(src)
		return
	var/next_message = dream_fragments[1]
	dream_fragments.Cut(1,2)

	if(istype(next_message, /datum/callback))
		var/datum/callback/something_happens = next_message
		next_message = something_happens.InvokeAsync(src)

	to_chat(src, span_notice("<i>... [next_message] ...</i>"))

	if(LAZYLEN(dream_fragments))
		var/next_wait = rand(10, 30)
		if(current_dream.sleep_until_finished)
			AdjustSleeping(next_wait)
		addtimer(CALLBACK(src, PROC_REF(dream_sequence), dream_fragments, current_dream), next_wait)
	else
		REMOVE_TRAIT(src, TRAIT_DREAMING, DREAMING_SOURCE)
		current_dream.OnDreamEnd(src)

//-------------------------
// DREAM DATUMS

GLOBAL_LIST_INIT(dreams, populate_dream_list())

/proc/populate_dream_list()
	var/list/output = list()
	for(var/datum/dream/dream_type as anything in subtypesof(/datum/dream))
		output[new dream_type] = initial(dream_type.weight)
	return output

/**
 * Contains all the behavior needed to play a kind of dream.
 * All dream types get randomly selected from based on weight when an appropriate mobs dreams.
 */
/datum/dream
	/// The relative chance this dream will be randomly selected
	var/weight = 0

	/// Causes the mob to sleep long enough for the dream to finish if begun
	var/sleep_until_finished = FALSE

/**
 * Called when beginning a new dream for the dreamer.
 * Gives back a list of dream events. Events can be text or callbacks that return text.
 */
/datum/dream/proc/GenerateDream(mob/living/carbon/dreamer)
	return list()

/**
 * Called when the dream ends or is interrupted.
 */
/datum/dream/proc/OnDreamEnd(mob/living/carbon/dreamer)
	return

/// The classic random dream of various words that might form a cohesive narrative, but usually wont
/datum/dream/random
	weight = 1000

/datum/dream/random/GenerateDream(mob/living/carbon/dreamer)
	var/list/custom_dream_nouns = list()
	var/fragment = ""

	for(var/obj/item/bedsheet/sheet in dreamer.loc)
		custom_dream_nouns += sheet.dream_messages

	. = list()
	. += "you see"

	//Subject
	if(custom_dream_nouns.len && prob(90))
		fragment += pick(custom_dream_nouns)
	else
		fragment += pick(GLOB.dream_strings)

	if(prob(50)) //Replace the adjective space with an adjective, or just get rid of it
		fragment = replacetext(fragment, "%ADJECTIVE%", pick(GLOB.adjectives))
	else
		fragment = replacetext(fragment, "%ADJECTIVE% ", "")
	if(findtext(fragment, "%A% "))
		fragment = "\a [replacetext(fragment, "%A% ", "")]"
	. += fragment

	//Verb
	fragment = ""
	if(prob(50))
		if(prob(35))
			fragment += "[pick(GLOB.adverbs)] "
		fragment += pick(GLOB.ing_verbs)
	else
		fragment += "will "
		fragment += pick(GLOB.verbs)
	. += fragment

	if(prob(25))
		return

	//Object
	fragment = ""
	fragment += pick(GLOB.dream_strings)
	if(prob(50))
		fragment = replacetext(fragment, "%ADJECTIVE%", pick(GLOB.adjectives))
	else
		fragment = replacetext(fragment, "%ADJECTIVE% ", "")
	if(findtext(fragment, "%A% "))
		fragment = "\a [replacetext(fragment, "%A% ", "")]"
	. += fragment

#undef DREAMING_SOURCE
