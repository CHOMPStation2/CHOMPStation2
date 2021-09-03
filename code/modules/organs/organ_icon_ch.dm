// override the organ icon getting proc
// if digitigrade is set:
// - Save original iconbase and markings vars to temp places
// - set iconbase to digitigrade sprite file
// - nullify markings list
// - run original get_icon proc with changed vars
// - once done, reset icobase & markings to default values from temp storage vars

/obj/item/organ/external/get_icon(var/skeletal)
	if( owner.digitigrade && ( istype(src,/obj/item/organ/external/leg) || istype(src,/obj/item/organ/external/foot) ) )
		var/IB = species.icobase
		var/list/markingsTmp = markings

		markings = null
		species.icobase = species.icodigi

		. = ..()
		icon_cache_key += "_digi"

		species.icobase = IB
		markings = markingsTmp
	else
		. = ..()