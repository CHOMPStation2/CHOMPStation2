/obj/item/modkit_conversion/fluff/sheri_rig_kit
    name = "Sheri's modkit"
    desc = "A kit containing all the needed tools and parts to modify a Research Director rig suit. It has a snake painted on it."
    owner_ckey = "esperkin"

    icon = 'icons/vore/custom_items_vr.dmi'
    icon_state = "modkit"

    from_suit = /obj/item/rig/hazmat
    to_suit = /obj/item/rig/hazmat/fluff/sheri

/obj/item/rig/hazmat/fluff/sheri
    name = "AHS-VPR Control Module"
    desc = "This is the control module for a prototype hazardous environment suit, designed to protect the wearer from radiation, pressure, and hostile aliens alike. This particular suit was designed to fit a naga, and is labeled as the model 'Viper'. A small tag on it marks it as belonging to a 'Sheri Calen'"
    icon = 'icons/vore/rig_yw/rigs_module.dmi'
    icon_state = "sheririg"
    icon_override = 'icons/vore/rig_yw/rigs_module_onmob.dmi'
    preserve_item = 0

    chest_type = /obj/item/clothing/suit/space/rig/fluff/sheri
    helm_type =  /obj/item/clothing/head/helmet/space/rig/hazmat/fluff/sheri
    boot_type =  /obj/item/clothing/shoes/magboots/rig/fluff/sheri
    glove_type = /obj/item/clothing/gloves/gauntlets/rig/fluff/sheri

/obj/item/clothing/suit/space/rig/fluff/sheri
    icon = 'icons/vore/rigs_taur_yw.dmi'
    icon_override = 'icons/vore/rigs_taur_yw.dmi'
    body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
    flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER|HIDESHOES
    species_restricted = null //Species restricted since all it cares about is a taur half

/obj/item/clothing/suit/space/rig/fluff/sheri/mob_can_equip(var/mob/living/carbon/human/H, slot, disable_warning = 0)
	item_state = icon_state
	pixel_x = -16
	update_icon()
	return 1

/obj/item/clothing/suit/space/rig/fluff/sheri/make_worn_icon(var/body_type,var/slot_name,var/inhands,var/default_icon,var/default_layer = 0,var/icon/clip_mask = null)
	var/image/result = ..()
	result.pixel_x = -16
	result.layer = BODY_LAYER + 15
	return result

/obj/item/clothing/head/helmet/space/rig/hazmat/fluff/sheri
    icon = 'icons/vore/rig_yw/rigs_head.dmi'
    icon_override = 'icons/vore/rig_yw/rigs_head_onmob.dmi'

/obj/item/clothing/shoes/magboots/rig/fluff/sheri
    icon = 'icons/vore/rig_yw/rigs_shoes.dmi'
    icon_override = 'icons/vore/rig_yw/rigs_shoes_onmob.dmi'
    item_state = null

/obj/item/clothing/gloves/gauntlets/rig/fluff/sheri
    icon = 'icons/vore/rig_yw/rigs_gauntlets.dmi'
    icon_override = 'icons/vore/rig_yw/rigs_gauntlets_onmob.dmi'
    item_state = null



/obj/item/rig/medical/equipped/fluff/saur
    name = "AMR-DRGN"
    desc = "This seems to be a highly customized Medical RIG suit, coloured black and purple, and with an added extendable plating to include a pair of wings and a tail comfortably within the suits protection. There's a nametag on the chest piece, and on the control module itself, with the name 'Saur Darastrix' on it."
    icon = 'icons/vore/rig_yw/rigs_module.dmi'
    icon_state = "saurrig"
    icon_override = 'icons/vore/rig_yw/rigs_module_onmob.dmi'
    preserve_item = 0

    chest_type = /obj/item/clothing/suit/space/rig/fluff/saur
    helm_type =  /obj/item/clothing/head/helmet/space/rig/medical/fluff/saur
    boot_type =  /obj/item/clothing/shoes/magboots/rig/fluff/saur
    glove_type = /obj/item/clothing/gloves/gauntlets/rig/fluff/saur


/obj/item/clothing/suit/space/rig/fluff/saur
	icon = 'icons/vore/rig_yw/rigs_chest.dmi'
	icon_override = 'icons/vore/rig_yw/rigs_chest_onmob.dmi'

/obj/item/clothing/head/helmet/space/rig/medical/fluff/saur
	icon = 'icons/vore/rig_yw/rigs_head.dmi'
	icon_override = 'icons/vore/rig_yw/rigs_head_onmob.dmi'

/obj/item/clothing/shoes/magboots/rig/fluff/saur
	icon = 'icons/vore/rig_yw/rigs_shoes.dmi'
	icon_override = 'icons/vore/rig_yw/rigs_shoes_onmob.dmi'

/obj/item/clothing/gloves/gauntlets/rig/fluff/saur
	icon = 'icons/vore/rig_yw/rigs_gauntlets.dmi'
	icon_override = 'icons/vore/rig_yw/rigs_gauntlets_onmob.dmi'