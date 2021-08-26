// override the organ icon getting proc
// if species.digitigrade is set, inject the sprites for digitigrade for appropriate organs

/obj/item/organ/external/get_icon(var/skeletal)
	if( species.digitigrade && ( istype(src,/obj/item/organ/external/leg) || istype(src,/obj/item/organ/external/foot) ) )
		var/IB = species.icobase
		species.icobase = species.icodigi
		. = ..()
		icon_cache_key += "_digi"
		species.icobase = IB
	else
		. = ..()