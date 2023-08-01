#define SCRAMBLE_CACHE_LEN 40
//basically, how many words can it store that it remembers to use? Upped from 20 to 40, because 20 is very s m a l l

/datum/language/proc/partial_scramble(var/input, var/capitalize = FALSE)
	if(!syllables || !syllables.len)
		return capitalize ? capitalize(input) : input

	var/static/regex/punctuation = new/regex(@"([.,?!-]+)$")
	var/static/regex/prefixpunct = new/regex(@"^([.,?!-]+)")
	var/found = punctuation.Find(input)
	var/input_ending = ""
	if (found)
		input_ending = punctuation.match
		input = copytext_char(input, 1, found)
	var/foundprefix = prefixpunct.Find(input)
	var/input_start = ""
	if (foundprefix)
		input_start = prefixpunct.match
		input = copytext_char(input, 1+length(prefixpunct.match))

	var/input_size = length(input)
	var/picked = pick(syllables)

	if (length(picked) < input_size)
		var/pos = rand(1, input_size-length(picked))
		input = splicetext_char(input, pos, pos+length(picked), picked)

	if (capitalize)
		input = capitalize(input)

	return input_start + input + input_ending

/datum/language/proc/scramble(var/input, var/list/known_languages)
	var/understand_chance = 0
	for(var/datum/language/L in known_languages)
		if(partial_understanding && partial_understanding[L.name])
			understand_chance += partial_understanding[L.name]
		if(L.partial_understanding && L.partial_understanding[name])
			understand_chance += L.partial_understanding[name] * 0.5
	var/scrambled_text = ""
	var/list/words = splittext(input, " ")
	for(var/w in words)
		if(w == "") continue
		var/nword = w
		var/ending = copytext(scrambled_text, length(scrambled_text)-1)
		var/capitalize = FALSE
		if(findtext(ending,".") || findtext(ending,"!") || findtext(ending,"?"))
			capitalize = TRUE
		if(prob(understand_chance))
			if (prob(100-(understand_chance*1.5)))
				nword = partial_scramble(w, capitalize)
		else
			nword = scramble_word(w, capitalize)
		scrambled_text += " " + nword
	var/static/regex/commadrift = new/regex(@"(\w) +([,?!.]+[^\w]*)", "g") //basically captures two groups- the last letter of a word, and any punctuation that comes after [one or more] grammatically incorrect spaces. Such as "Once  ?", it captures "e" and "?"
	var/static/regex/multispace = new/regex(@" +", "g")
	scrambled_text = multispace.Replace(scrambled_text, " ")
	scrambled_text = trim(scrambled_text)
	scrambled_text = capitalize(scrambled_text)
	scrambled_text = commadrift.Replace(scrambled_text, "$1$2") //with the above example, "Once  ?" will be turned into "Once?" with this replacement - this is here because of weird issues that happen when scrambling sometimes

	return scrambled_text

/datum/language/proc/scramble_word(var/input, var/capitalize = FALSE)
	if(!syllables || !syllables.len)
		return capitalize ? capitalize(stars(input)) : stars(input)

	var/static/regex/punctuation = new/regex(@"([.,?!-]+)$")
	var/static/regex/prefixpunct = new/regex(@"^([.,?!-]+)")
	var/found = punctuation.Find(input)
	var/input_ending = ""
	if (found)
		input_ending = punctuation.match
		input = copytext_char(input, 1, found)
	var/foundprefix = prefixpunct.Find(input)
	var/input_start = ""
	if (foundprefix)
		input_start = prefixpunct.match
		input = copytext_char(input, 1+length(prefixpunct.match))

	// If the input is cached already, move it to the end of the cache and return it
	var/k = lowertext(input)
	if(k in scramble_cache)
		var/n = scramble_cache[k]
		scramble_cache -= input
		scramble_cache[k] = n
		if (capitalize)
			n = capitalize(n)
		return input_start + n + input_ending

	var/input_size = length(input)
	var/scrambled_text = ""

	while(length(scrambled_text) < input_size)
		var/next = pick(syllables)
		scrambled_text += next
		if(rand(1,100) <= space_chance && length(scrambled_text) + 1 < input_size)
			scrambled_text += " "

	// Add it to cache, cutting old entries if the list is too long
	scramble_cache[k] = scrambled_text
	if(scramble_cache.len > SCRAMBLE_CACHE_LEN)
		scramble_cache.Cut(1, scramble_cache.len-SCRAMBLE_CACHE_LEN+1)

	if (capitalize)
		scrambled_text = capitalize(scrambled_text)

	return input_start + scrambled_text + input_ending

#undef SCRAMBLE_CACHE_LEN
