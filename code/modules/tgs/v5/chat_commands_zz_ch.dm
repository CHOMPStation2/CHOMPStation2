/datum/tgs_chat_command/sharktest
	name = "flip"
	help_text = "babies first TGS command"
	admin_only = FALSE

/datum/tgs_chat_command/sharktest/Run(datum/tgs_chat_user/sender, params)
	var/x
	if(params != "tails" && params != "heads")
		return "```You need to guess!\n either heads or tails!```"
	if(prob(50))
		if(params == "tails")
			x = "correct"
		else
			x = "wrong"
		return "```Tails. [x]!```"

	if(params == "tails")
		x = "wrong"
	else
		x = "correct"
	return "```Heads. [x]!```"

/datum/tgs_chat_command/sharktest/alias
		name = "coin"