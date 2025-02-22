// These aren't lore but I guess that's part of the typepath forever.
/datum/lore/codex/category/cooking_recipe_list
	name = "Index"
	data = "Greetings, fellow sapient! Within these hallowed scripts rest sacred incantations for the rearrangement \
	of carbon structures into shapes most delectable to those possessing exquisite gustatory senses and requiring \
	nutrituous sustenance. As a reference for Gustomancy of all experience Classes, below explains the form of \
	each component spell. Hark, reader beware! To peruse beyond permission of the mighty Wizard Federation is to \
	be struck with a 10,000 year imprisonment curse of cuboidal containment sphere!\
	<br><br>\
	<hr>" + span_bold("Heat Applicator") + ": A device, commonly of metal, into which component spells are inserted and transmogrified \
	into the Gustomancic Product. Applicators convert Electromancy into heat, and may require heating to an ideal \
	temperature before spellcrafting. Overapplication will result in failure of the spell, and respiratory distress! \
	<br>\
	<hr>" + span_bold("Pure Fluids") + ": A purified substance, typically of liquid form, added to the Applicator from a fluid vessel. \
	Fluids are typically extracted from a bearing object, ground from bulk form, or produced by Chemomancy. \
	<br>\
	<hr>" + span_bold("Material Objects") + ": Any component spell object not created by Botanomancy. Most are created by lesser \
	Gustomancy tools or Gustomancy spells. Others may require creative acquistion methods! \
	<br>\
	<hr>" + span_bold("Grown Produce") + ": A product of the soils and vessels of Botanomancy, typically fruit or vegetable. The \
	methods of Botanomancy lie beyond the scope of this Gustomancy tome! \
	<br>\
	<hr>" + span_bold("Cooked Shell") + ": A coating of specified pure fluid, typically batter, applied to all component spell \
	objects. Traditionally, specified fluid is placed in a glass vessel and each component spell dipped within. \
	<br>\
	<hr>" + span_bold("Temporal Shift") + ": Length of passage through the temporial medium, unaffected by Chronomancy. \
	<br>\
	<hr>" + span_bold("Meal Quantity") + ": Number of uses of the completed spell. \
	<hr><br><br>\
	The segmented fusion of Gustomancy and Chemomancy is currently beyond the scope of this tome, as is the \
	usage of simple Gustomantic techniques such as rolling flat and slicing dough. The Gustomancer is reminded \
	most basic tools and supplies within the Gustomancy study, and most fusion fluids may be created with some \
	combination of flour, milk, water, egg, and enzyme."
	// The joke is none of this is magic, and neither is the Wizard Federation.

/datum/lore/codex/page/cooking_recipe
	name = null

// Algorithmically write all cooking recipes in the game. This should run once per round.
/datum/lore/codex/category/cooking_recipe_list/New()
	..()
	var/list/new_children_list = list()
	var/list/name_repeats = list()
	for(var/Rp in subtypesof(/datum/recipe))
		var/datum/recipe/R = new Rp() // Datums must be initialized to read list vars
		if(!istype(R))
			log_debug("Recipe generation failed, recipe datum is [R].")
			qdel(R)
			continue

		var/datum/lore/codex/page/cooking_recipe/D = new(holder, src)
		var/atom/movable/these = R.result // Result is a typepath, requiring use of initial()
		D.name = capitalize("[initial(these.name)]") // Capitalization on recipe names is inconsistent

		var/n = 1
		while(D.name in name_repeats) // Ensure each name is unique so we have a unique keyword for every recipe
			D.name = "[capitalize("[initial(these.name)]")]-[n]"
			n++
		name_repeats["[D.name]"] = TRUE // The value here doesn't matter, we just need this to be an associative list.
		D.keywords.Add(D.name)

		// Most ingredient names will be capitalized to draw the reader's eye.
		var/text = R.appliance
		switch(text) // These are binary values, so we'll use the defines to convert to a string
			if(MICROWAVE)
				text = "Microwave"
			if(FRYER)
				text = "Deep fryer"
			if(OVEN)
				text = "Oven"
			if(GRILL)
				text = "Grill"
			if(CANDYMAKER)
				text = "Candy maker"
			if(CEREALMAKER)
				text = "Cereal maker"
			else
				text = ""
		D.data = span_bold("Heat Applicator") + ": [text ? text : "none"]<br>"
		text = ""

		if(LAZYLEN(R.reagents))
			var/i = 0 // Comma counter
			for(var/thing in R.reagents) // String
				if(i)
					text += ", "
				text += "[capitalize(thing)]: [R.reagents[thing]] units"
				i++
		D.data += span_bold("Pure Fluids") + ": [text ? text : "none"]<br>"
		text = ""

		if(LAZYLEN(R.items))
			var/i = 0
			for(var/atom/movable/AM as anything in R.items) // Atom typepath
				if(i)
					text += ", "
				text += "[capitalize(initial(AM.name))]"
				i++
		D.data += span_bold("Material Objects") + ": [text ? text : "none"]<br>"
		text = ""

		if(LAZYLEN(R.fruit)) // Inelegant copypasta time
			var/i = 0
			for(var/thing in R.fruit) // String
				if(i)
					text += ", "
				text += "[capitalize(thing)]: [R.fruit[thing]] quantity"
				i++
		D.data += span_bold("Grown Produce") + ": [text ? text : "none"]<br>"
		text = ""

		if(R.coating)
			var/datum/reagent/ooze = initial(R.coating) // Datum typepath
			text = capitalize(initial(ooze.name))
		D.data += span_bold("Cooked Shell") + ": [text ? text : "none"]<br>"
		text = 0

		if(R.time) // Deciseconds
			text = R.time
		D.data += span_bold("Temporal Shift") + ": [text ? text/10 : 0] second\s<br>"
		text = 0

		if(R.result_quantity) // Should never be null.
			text = R.result_quantity
		D.data += span_bold("Meal Quantity") + ": [text ? text : 0] plate\s<br>"

		new_children_list[D.name] = D // We make this an associative list so we can alphabetize later
		qdel(R) // Delete recipe datum after we're done with it

	// This nonsense alphabetizes the list and converts back to array format before handing off to the parent.
	// Array format is necessary for the codex code to work properly.
	new_children_list = sortList(new_children_list)
	var/list/sorted_children[LAZYLEN(new_children_list)]
	for(var/x = 1, x <= LAZYLEN(sorted_children), x++)
		var/key = new_children_list[x]
		sorted_children[x] = new_children_list[key]
	children = sortList(sorted_children)
	src.index_page()
