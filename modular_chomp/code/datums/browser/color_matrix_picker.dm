/datum/browser/modal/color_matrix_picker
	var/color_matrix

/datum/browser/modal/color_matrix_picker/New(mob/user, message, title, button1 = "Ok", button2, button3, stealfocus = TRUE, timeout = 0, list/values)
	if(!user)
		return
	if(!values)
		values = list(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0)
	if(values.len < 12)
		values.len = 12
	var/list/output = list()
	output += "<form><input type='hidden' name='src' value='[REF(src)]'>"
	output += "[message]"
#define MATRIX_FIELD(field, default) "<b><label for='[##field]'>[##field]</label></b> <input type='number' step='0.001' name='[field]' value='[default]'>"
	output += "<br><br>"
	output += MATRIX_FIELD("rr", values[1])
	output += MATRIX_FIELD("gr", values[4])
	output += MATRIX_FIELD("br", values[7])
	output += "<br><br>"
	output += MATRIX_FIELD("rg", values[2])
	output += MATRIX_FIELD("gg", values[5])
	output += MATRIX_FIELD("bg", values[8])
	output += "<br><br>"
	output += MATRIX_FIELD("rb", values[3])
	output += MATRIX_FIELD("gb", values[6])
	output += MATRIX_FIELD("bb", values[9])
	output += "<br><br>"
	output += MATRIX_FIELD("cr", values[10])
	output += MATRIX_FIELD("cg", values[11])
	output += MATRIX_FIELD("cb", values[12])
	output += "<br><br>"
#undef MATRIX_FIELD

	output += {"</ul><div style="text-align:center">
		<button type="submit" name="button" value="1" style="font-size:large;float:[( button2 ? "left" : "right" )]">[button1]</button>"}

	if (button2)
		output += {"<button type="submit" name="button" value="2" style="font-size:large;[( button3 ? "" : "float:right" )]">[button2]</button>"}

	if (button3)
		output += {"<button type="submit" name="button" value="3" style="font-size:large;float:right">[button3]</button>"}
	output += {"</form></div>"}

	..(user, ckey("[user]-[message]-[title]-[world.time]-[rand(1,10000)]"), title, 800, 400, src, stealfocus, timeout)
	set_content(output.Join(""))

/datum/browser/modal/color_matrix_picker/Topic(href, list/href_list)
	if(href_list["close"] || !user)
		opentime = 0
		return
	if(href_list["button"])
		var/button = text2num(href_list["button"])
		if(ISINRANGE(button, 1, 3))
			selectedbutton = button
	var/list/cm = rgb_construct_color_matrix(
		text2num(href_list["rr"]),
		text2num(href_list["rg"]),
		text2num(href_list["rb"]),
		text2num(href_list["gr"]),
		text2num(href_list["gg"]),
		text2num(href_list["gb"]),
		text2num(href_list["br"]),
		text2num(href_list["bg"]),
		text2num(href_list["bb"]),
		text2num(href_list["cr"]),
		text2num(href_list["cg"]),
		text2num(href_list["cb"])
	)
	if(cm)
		color_matrix = cm
	opentime = 0
	close()

/proc/color_matrix_picker(mob/user, message, title, button1 = "Ok", button2, button3, stealfocus, timeout = 10 MINUTES, list/values)
	if(!istype(user))
		if(istype(user, /client))
			var/client/C = user
			user = C.mob
		else
			return
	var/datum/browser/modal/color_matrix_picker/B = new(user, message, title, button1, button2, button3, stealfocus, timeout, values)
	B.open()
	B.wait()
	return list("button" = B.selectedbutton, "matrix" = B.color_matrix)