/mob/living/simple_mob/vore/bigdragon/Login()
	. = ..()
	add_verb(src,/mob/living/simple_mob/vore/bigdragon/proc/export_style) //CHOMPEdit TGPanel
	add_verb(src,/mob/living/simple_mob/vore/bigdragon/proc/import_style) //CHOMPEdit TGPanel

/mob/living/simple_mob/vore/bigdragon/proc/export_style()
	set name = "Export style string"
	set desc = "Export a string of text that can be used to instantly get the current style back using the import style verb"
	set category = "Abilities.Settings"
	var/output_style = jointext(list(
		overlay_colors["Underbelly"],
		under,
		overlay_colors["Body"],
		body,
		overlay_colors["Ears"],
		ears,
		overlay_colors["Mane"],
		mane,
		overlay_colors["Horns"],
		horns,
		overlay_colors["Eyes"],
		eyes), ";")
	to_chat(src, span_notice("Exported style string is \" [output_style] \". Use this to get the same style in the future with import style"))

/mob/living/simple_mob/vore/bigdragon/proc/import_style()
	set name = "Import style string"
	set desc = "Import a string of text that was made using the import style verb to get back that style"
	set category = "Abilities.Settings"
	var/input_style
	input_style = sanitizeSafe(input(src,"Paste the style string you exported with Export Style.", "Style loading","") as text, MAX_MESSAGE_LEN)
	if(input_style)
		var/list/input_style_list = splittext(input_style, ";")
		if((LAZYLEN(input_style_list) == 12) && (input_style_list[2] in underbelly_styles) && (input_style_list[4] in body_styles) && (input_style_list[6] in ear_styles) && (input_style_list[8] in mane_styles) && (input_style_list[10] in horn_styles) && (input_style_list[12] in ear_styles))
			try
				if(rgb2num(input_style_list[1]))
					overlay_colors["Underbelly"] = input_style_list[1]
			catch
			under = input_style_list[2]
			try
				if(rgb2num(input_style_list[3]))
					overlay_colors["Body"] = input_style_list[3]
			catch
			body = input_style_list[4]
			try
				if(rgb2num(input_style_list[5]))
					overlay_colors["Ears"] = input_style_list[5]
			catch
			ears = input_style_list[6]
			try
				if(rgb2num(input_style_list[7]))
					overlay_colors["Mane"] = input_style_list[7]
			catch
			mane = input_style_list[8]
			try
				if(rgb2num(input_style_list[9]))
					overlay_colors["Horns"] = input_style_list[9]
			catch
			horns = input_style_list[10]
			try
				if(rgb2num(input_style_list[11]))
					overlay_colors["Eyes"] = input_style_list[11]
			catch
			eyes = input_style_list[12]
			build_icons()

//Most intresting set of OG melee damages
/* Combat refactor walkback
/mob/living/simple_mob/vore/bigdragon
	melee_damage_lower = 12
	melee_damage_upper = 17
	maxHealth = 400
*/
