/datum/language/proc/partial_scramble(var/input)
	if(!syllables || !syllables.len)
		return input

	var/input_size = length(input)
	var/picked = pick(syllables)

	if (length(picked) < input_size)
		var/pos = input_size-length(picked)
		return splicetext(input, pos, pos+length(picked), picked)
	return input
