/obj/item/reagent_containers/food/drinks/cup
	name = "coffee cup"
	desc = "The container of oriental luxuries."
	icon_state = "cup_empty"
	amount_per_transfer_from_this = 5
	volume = 30
<<<<<<< HEAD
	center_of_mass_x = 16 //CHOMPEdit
	center_of_mass_y= 16 //CHOMPEdit
=======
	center_of_mass_x = 16
	center_of_mass_y = 16
>>>>>>> 3d9113eae3 (removes center of mass list (#17064))

/obj/item/reagent_containers/food/drinks/cup/on_reagent_change()
	..()
	if (reagents.reagent_list.len > 0)
		var/datum/reagent/R = reagents.get_master_reagent()

		if(R.cup_icon_state)
			icon_state = R.cup_icon_state
		else
			icon_state = "cup_brown"

		if(R.cup_name)
			var/prefix = " "
			for(var/datum/reagent/S in reagents.reagent_list)
				if(S.cup_prefix)
					var/current_prefix = prefix
					prefix = "[current_prefix][S.cup_prefix] "
			name = "cup of[prefix][R.cup_name]"
		else
			name = "Cup of.. what?"

		if(R.cup_desc)
			desc = R.cup_desc
		else
			desc = "You can't really tell what this is."

<<<<<<< HEAD
		if(R.cup_center_of_mass)
			center_of_mass_x = R.cup_center_of_mass["x"] //CHOMPEdit
			center_of_mass_y = R.cup_center_of_mass["y"] //CHOMPEdit
		else
			center_of_mass_x = 16 //CHOMPEdit
			center_of_mass_y= 16 //CHOMPEdit
=======
		if(R.cup_center_of_mass_x || R.cup_center_of_mass_y)
			center_of_mass_x = R.cup_center_of_mass_x
			center_of_mass_y = R.cup_center_of_mass_y
		else
			center_of_mass_x = 16
			center_of_mass_y = 16
>>>>>>> 3d9113eae3 (removes center of mass list (#17064))

	else
		icon_state = "cup_empty"
		name = "coffee cup"
		desc = "The container of oriental luxuries."
<<<<<<< HEAD
		center_of_mass_x = 16 //CHOMPEdit
		center_of_mass_y= 16 //CHOMPEdit
=======
		center_of_mass_x = 16
		center_of_mass_y = 16
>>>>>>> 3d9113eae3 (removes center of mass list (#17064))
		return
