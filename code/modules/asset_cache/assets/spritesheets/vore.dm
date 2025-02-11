/datum/asset/spritesheet/vore
	name = "vore"

/datum/asset/spritesheet/vore/create_spritesheets()
	var/icon/downscaled = icon('modular_chomp/icons/mob/screen_full_vore_ch.dmi') //CHOMPedit: preserving save data
	downscaled.Scale(240, 240)
	InsertAll("", downscaled)

/datum/asset/spritesheet/vore_fixed //This should be getting loaded in the TGUI vore panel but the game refuses to do so, for some reason. It only loads the vore spritesheet. //CHOMPedit
	name = "fixedvore" //CHOMPedit

/datum/asset/spritesheet/vore_fixed/create_spritesheets() //CHOMPedi start: preserving save data
	var/icon/downscaledVF = icon('icons/mob/screen_full_vore.dmi')
	downscaledVF.Scale(240, 240)
	InsertAll("", downscaledVF) //CHOMpedit end
