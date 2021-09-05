// override the organ icon getting proc
// if digitigrade is set:
// - Save original iconbase and markings vars to temp places
// - set iconbase to digitigrade sprite file
// - nullify markings list
// - run original get_icon proc with changed vars
// - once done, reset icobase & markings to default values from temp storage vars

/obj/item/organ/external/get_icon(var/skeletal)
	var/digitigrade = 0

	// preferentially take digitigrade value from owner if available, THEN DNA.
	// this allows limbs to be set properly when being printed in the bioprinter without an owner
	// this also allows the preview mannequin to update properly because customisation topic calls don't call a DNA check
	if(owner)
		digitigrade = owner.digitigrade
	else
		digitigrade = dna.digitigrade

	if( digitigrade && ( istype(src,/obj/item/organ/external/leg) || istype(src,/obj/item/organ/external/foot) ) )
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