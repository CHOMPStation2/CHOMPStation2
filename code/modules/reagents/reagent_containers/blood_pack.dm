/obj/item/storage/box/bloodpacks // CHOMPEdit - Removal of obj/item/weapon
	name = "blood packs bags"
	desc = "This box contains blood packs."
	icon_state = "sterile"

/obj/item/storage/box/bloodpacks/Initialize() // CHOMPEdit - Removal of obj/item/weapon
		. = ..()
		new /obj/item/reagent_containers/blood/empty(src) // CHOMPEdit - Removal of obj/item/weapon
		new /obj/item/reagent_containers/blood/empty(src) // CHOMPEdit - Removal of obj/item/weapon
		new /obj/item/reagent_containers/blood/empty(src) // CHOMPEdit - Removal of obj/item/weapon
		new /obj/item/reagent_containers/blood/empty(src) // CHOMPEdit - Removal of obj/item/weapon
		new /obj/item/reagent_containers/blood/empty(src) // CHOMPEdit - Removal of obj/item/weapon
		new /obj/item/reagent_containers/blood/empty(src) // CHOMPEdit - Removal of obj/item/weapon
		new /obj/item/reagent_containers/blood/empty(src) // CHOMPEdit - Removal of obj/item/weapon

/obj/item/reagent_containers/blood // CHOMPEdit - Removal of obj/item/weapon
	name = "IV pack"
	var/base_name = " "
	desc = "Holds liquids used for transfusion."
	var/base_desc = " "
	icon = 'icons/obj/bloodpack.dmi'
	icon_state = "empty"
	item_state = "bloodpack_empty"
	drop_sound = 'sound/items/drop/food.ogg'
	pickup_sound = 'sound/items/pickup/food.ogg'
	volume = 200
	var/label_text = ""

	var/blood_type = null
	var/reag_id = "blood"

/obj/item/reagent_containers/blood/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	base_name = name
	base_desc = desc
	if(blood_type != null)
		label_text = "[blood_type]"
		update_iv_label()
		reagents.add_reagent(reag_id, 200, list("donor"=null,"viruses"=null,"blood_DNA"=null,"blood_type"=blood_type,"resistances"=null,"trace_chem"=null))
		update_icon()

/obj/item/reagent_containers/blood/on_reagent_change() // CHOMPEdit - Removal of obj/item/weapon
	update_icon()

/obj/item/reagent_containers/blood/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	var/percent = round((reagents.total_volume / volume) * 100)
	if(percent >= 0 && percent <= 9)
		icon_state = "empty"
		item_state = "bloodpack_empty"
	else if(percent >= 10 && percent <= 50)
		icon_state = "half"
		item_state = "bloodpack_half"
	else if(percent >= 51 && percent < INFINITY)
		icon_state = "full"
		item_state = "bloodpack_full"

/obj/item/reagent_containers/blood/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(W, /obj/item/pen) || istype(W, /obj/item/flashlight/pen)) // CHOMPEdit - Removal of obj/item/weapon // CHOMPEdit - Removal of obj/item/device
		var/tmp_label = sanitizeSafe(tgui_input_text(user, "Enter a label for [name]", "Label", label_text, MAX_NAME_LEN), MAX_NAME_LEN)
		if(length(tmp_label) > 50)
			to_chat(user, "<span class='notice'>The label can be at most 50 characters long.</span>")
		else if(length(tmp_label) > 10)
			to_chat(user, "<span class='notice'>You set the label.</span>")
			label_text = tmp_label
			update_iv_label()
		else
			to_chat(user, "<span class='notice'>You set the label to \"[tmp_label]\".</span>")
			label_text = tmp_label
			update_iv_label()

/obj/item/reagent_containers/blood/proc/update_iv_label() // CHOMPEdit - Removal of obj/item/weapon
	if(label_text == "")
		name = base_name
	else if(length(label_text) > 10)
		var/short_label_text = copytext(label_text, 1, 11)
		name = "[base_name] ([short_label_text]...)"
	else
		name = "[base_name] ([label_text])"
	desc = "[base_desc] It is labeled \"[label_text]\"."

/obj/item/reagent_containers/blood/APlus // CHOMPEdit - Removal of obj/item/weapon
	blood_type = "A+"

/obj/item/reagent_containers/blood/AMinus // CHOMPEdit - Removal of obj/item/weapon
	blood_type = "A-"

/obj/item/reagent_containers/blood/BPlus // CHOMPEdit - Removal of obj/item/weapon
	blood_type = "B+"

/obj/item/reagent_containers/blood/BMinus // CHOMPEdit - Removal of obj/item/weapon
	blood_type = "B-"

/obj/item/reagent_containers/blood/OPlus // CHOMPEdit - Removal of obj/item/weapon
	blood_type = "O+"

/obj/item/reagent_containers/blood/OMinus // CHOMPEdit - Removal of obj/item/weapon
	blood_type = "O-"

/obj/item/reagent_containers/blood/synthplas // CHOMPEdit - Removal of obj/item/weapon
	blood_type = "O-"
	reag_id = "synthblood_dilute"

/obj/item/reagent_containers/blood/synthblood // CHOMPEdit - Removal of obj/item/weapon
	blood_type = "O-"
	reag_id = "synthblood"

/obj/item/reagent_containers/blood/empty // CHOMPEdit - Removal of obj/item/weapon
	name = "Empty BloodPack"
	desc = "Seems pretty useless... Maybe if there were a way to fill it?"
	icon_state = "empty"
	item_state = "bloodpack_empty"