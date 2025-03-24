//VOREStation Note: TRAITGENETICS - Originally, these were in negative_genes.dm
//However, given their more RP centric nature, they have been moved to neutral_traits.
//If desire is wanted to move them back to negative traits, change the 'neutral' to 'negative'
/datum/trait/negative/disability_censored //CHOMPStation Edit - neutral -> negative
	name = "Censored"
	desc = "You are unable to speak profanity. To an excessive degree..."
	cost = -1 // TRAITGENETICS - Originally was -1 //CHOMPStation Edit - 0 -> -1
	custom_only = FALSE

	is_genetrait = TRUE
	hidden = FALSE

	disability=CENSORED
	activation_message="You feel less rude..."
	primitive_expression_messages=list("BEEPS!")

/datum/trait/negative/disability_nervousness //CHOMPStation Edit - neutral -> negative
	name = "Nervousness"
	desc = "You are generally nervous natured, often stuttering words."
	cost = -1 // TRAITGENETICS - Originally was -1 //CHOMPStation Edit - 0 -> -1
	custom_only = FALSE

	is_genetrait = TRUE
	hidden = FALSE

	disability=NERVOUS
	activation_message="You feel nervous."
	primitive_expression_messages=list("nervously chitters.")
