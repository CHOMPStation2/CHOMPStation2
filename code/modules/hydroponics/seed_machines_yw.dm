
/obj/machinery/botany/precisioneditor
	name = "biochemical manipulator"
	desc = "A machine used to perform more specialized mutations on plant seeds. Careful not to put your face on the glass."
	icon_state = "traitcopier"
	var/obj/item/reagent_containers/glass/loaded_beaker //Currently held beaker
	var/screen_state = "main"
	var/health = 2
	//any other chems that should explicitly not be allowed to be grown from plants
	//should be added here
	var/list/testlist = list()
	var/list/banlist = list(
		"iron",      //Probably isn't a good idea to let plants replace mining (easily)
		"phoron",    //Gold and uranium are ommitted as they can already be obtained with normal xenobotany
		"silver",
		"platinum",
		"mhydrogen",
		"steel",
		"plasteel",
    "hydrophoron",

    "macrocillin",     //ban everything that's already banned in seed.dm except nutriment
    "microcillin",
    "normalcillin",
    "adminordrazine",
    "magicdust"
		)

	var/list/datum/reagent/allowed_reagents = list() //compile the list of reagents we're allowed to splice in


/obj/machinery/botany/precisioneditor/Initialize()
  for(var/R in SSchemistry.chemical_reagents)
    testlist.Add(R)
    var/datum/reagent/current = SSchemistry.chemical_reagents[R]
/*CHOMP Edit: Remove Phorochem code
    if(istype(current, /datum/reagent/phororeagent)) //phorochems are banned from this process, obviously
      continue
*/
    allowed_reagents.Add(R)
  allowed_reagents -= banlist //apparently outright checking if it's in the banlist before it's added doesn't work?

/obj/machinery/botany/precisioneditor/attack_hand(mob/user as mob)
	tgui_interact(user)

/obj/machinery/botany/precisioneditor/attackby(obj/item/W as obj, mob/user as mob)
  //Load a beaker into the machine, ensuring it's a beaker first
  if(istype(W,/obj/item/reagent_containers/glass))
    if(loaded_beaker)
      to_chat(user, "There is already a beaker loaded.")
    else
      user.drop_from_inventory(W)
      W.loc = src
      loaded_beaker = W
      to_chat(user, "You load [W] into [src].")
  if(istype(W,/obj/item/seeds))
    if(seed)
      to_chat(user, "There is already a seed loaded.")
      return
    var/obj/item/seeds/S =W
    if(S.seed && S.seed.get_trait(TRAIT_IMMUTABLE) > 0)
      to_chat(user, "That seed is not compatible with our genetics technology.")
    else
      user.drop_from_inventory(W)
      W.loc = src
      seed = W
      to_chat(user, "You load [W] into [src].")
    return


/obj/machinery/botany/precisioneditor/tgui_interact(mob/user, datum/tgui/ui = null)
  ui = SStgui.try_update_ui(user, src, ui)
  if(!ui)
    ui = new(user, src, "PrecisionEditor", name)
    ui.open()

/obj/machinery/botany/precisioneditor/tgui_data(mob/user)
  var/list/data = list()
  data["screenstate"] = screen_state
  if(loaded_beaker)
    data["beakerchems"] = list()
    for(var/datum/reagent/current in loaded_beaker.reagents.reagent_list)
      data["beakerchems"].Add(list(list("name" = "[current.id]", "displayname" = SSchemistry.chemical_reagents[current.id])))
  if(seed)
    data["seedname"] = seed.seed.display_name
    data["health"] = seed.modified
    data["plantcolor"] = seed.seed.traits["[TRAIT_PLANT_COLOUR]"]
    data["fruitcolor"] = seed.seed.traits["[TRAIT_PRODUCT_COLOUR]"]
    data["chems"] = list()

    for(var/chem_name in seed.seed.chems)
      data["chems"].Add(list(list("name" = "[chem_name]", "displayname" = SSchemistry.chemical_reagents[chem_name])))

  return data

/obj/machinery/botany/precisioneditor/tgui_act(action, params)
  if(..())
    return TRUE

  switch(action)
    if("eject")
      if(!seed)
        return

      seed.loc = get_turf(src)
      if(seed.seed.name == "new line" || isnull(SSplants.seeds[seed.seed.name]))
        seed.seed.uid = SSplants.seeds.len + 1
        seed.seed.name = "[seed.seed.uid]"
        SSplants.seeds[seed.seed.name] = seed.seed
      seed.update_seed()
      visible_message("[icon2html(src,viewers(src))] [src] beeps and spits out [seed].")

      seed = null
      screen_state = "main"
      . = TRUE
    if("eject_beaker")
      if(!loaded_beaker)
        return
      loaded_beaker.loc = get_turf(src)
      visible_message("[icon2html(src,viewers(src))] [src] beeps and politely sets out [loaded_beaker].")
      loaded_beaker = null
      . = TRUE

    //change the current screen we're looking at
    if("change_focus")
      screen_state = params["window"]
      . = TRUE

    //Remove the chosen chem from the plant's product
    //TODO: this will be a cheaper operation the fewer chems the plant already
    //produces
    if("prune")
      if(!isnull(SSplants.seeds[seed.seed.name]))
        seed.seed = seed.seed.diverge(1)
        seed.seed_type = seed.seed.name
        seed.update_seed()
        seed.seed.chems.Remove(params["gene_name"])
      . = TRUE

    //Change either the color of the plant or fruit. Requires hex input
    //TODO: additionally allow for changing the plant's glow color, if applicable
    if("change_color")
      var/newcolor = uppertext(input(usr, "Choose the desired color for the plant in hex:", "Color preference", rgb(128,128,128)))
      if(is_valid_hex(newcolor))
        if(!isnull(SSplants.seeds[seed.seed.name]))
          seed.seed = seed.seed.diverge(1)
          seed.seed_type = seed.seed.name
          seed.update_seed()
        switch(params["option"])
          if(0)
            seed.seed.traits["[TRAIT_PLANT_COLOUR]"] = newcolor
          if(1)
            seed.seed.traits["[TRAIT_PRODUCT_COLOUR]"] = newcolor
          else
      else
        visible_message("[icon2html(src,viewers(src))] Error: Invalid input detected.")
      . = TRUE
    if("add_chem")
      add_chem_to_seed(params["target_chem"])
      . = TRUE
    else
      . = TRUE

  update_icon()

//nobody's made a helper function for this, so if you want to use it
//elsewhere, feel free to copy it/make it more easily accessible
//Verifies that input is valid hex input (#AAAAAA, where A is 0-F)
/obj/machinery/botany/precisioneditor/proc/is_valid_hex(var/input)
  var/safety_check = 1
  if(!(length(input) == 7))
    return FALSE       //input is either too short or too long

  var/char = copytext(input, 1, 2)
  if(char != "#")
    return FALSE       //ensure that the first character is a #

  while(safety_check <= 6) //For hex values with alpha, could repeat 8 times instead of 6
    char = copytext(input, safety_check+1, safety_check+2) //the character we're currently checking
    if(!(char in list("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F")))
      return FALSE
    safety_check++

  return TRUE

/obj/machinery/botany/precisioneditor/proc/add_chem_to_seed(var/chem_name)
  if(!loaded_beaker)
    return
  var/chem_amount = loaded_beaker.reagents.get_reagent_amount(chem_name)
  if(!(chem_name in allowed_reagents))
    visible_message("[icon2html(src,viewers(src))] Error: The chosen compound is too complex to synthesize biologically.")
    return
  if(chem_amount < 100)
    visible_message("[icon2html(src,viewers(src))] Error: A minimum of 100 [SSchemistry.chemical_reagents[chem_name]] is required to perform this action.")
    return
  else
    if(!isnull(SSplants.seeds[seed.seed.name])) //diverge the seed into a new species
      seed.seed = seed.seed.diverge(1)
      seed.seed_type = seed.seed.name
      seed.update_seed()
    var/product_amount = 1 + round((chem_amount - 100) / 25) //would rather that it round down, but no proc for that
    //low base value, but scales decently well with higher potency
    seed.seed.chems.Add(list("[chem_name]" = list(product_amount, 12 - product_amount)))
    seed.modified += rand(15,25)
    if(prob(seed.modified))
      seed.modified = 101
      visible_message("[icon2html(src,viewers(src))] [src] pings unhappily, flashing a red warning light.")
    loaded_beaker.reagents.remove_reagent(chem_name, chem_amount) //remove ALL of the reagent from the beaker
    visible_message("[icon2html(src,viewers(src))] The [src] beeps, indicating genetic synthesis was successful.")
  return
