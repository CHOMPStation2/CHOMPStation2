/**************
* AI-specific *
**************/
/obj/item/camera/siliconcam // CHOMPEdit - Removal of obj/item/device
	var/in_camera_mode = 0
	var/photos_taken = 0
	var/list/obj/item/photo/aipictures = list() // CHOMPEdit - Removal of obj/item/weapon

/obj/item/camera/siliconcam/ai_camera //camera AI can take pictures with // CHOMPEdit - Removal of obj/item/device
	name = "AI photo camera"

/obj/item/camera/siliconcam/robot_camera //camera cyborgs can take pictures with // CHOMPEdit - Removal of obj/item/device
	name = "Cyborg photo camera"

/obj/item/camera/siliconcam/drone_camera //currently doesn't offer the verbs, thus cannot be used // CHOMPEdit - Removal of obj/item/device
	name = "Drone photo camera"

/obj/item/camera/siliconcam/proc/injectaialbum(obj/item/photo/p, var/sufix = "") //stores image information to a list similar to that of the datacore // CHOMPEdit - Removal of obj/item/weapon // CHOMPEdit - Removal of obj/item/device
	p.loc = src
	photos_taken++
	p.name = "Image [photos_taken][sufix]"
	aipictures += p

/obj/item/camera/siliconcam/proc/injectmasteralbum(obj/item/photo/p) //stores image information to a list similar to that of the datacore // CHOMPEdit - Removal of obj/item/weapon // CHOMPEdit - Removal of obj/item/device
	var/mob/living/silicon/robot/C = usr
	if(C.connected_ai)
		C.connected_ai.aiCamera.injectaialbum(p.copy(1), " (synced from [C.name])")
		to_chat(C.connected_ai, "<span class='unconscious'>Image uploaded by [C.name]</span>")
		to_chat(usr, "<span class='unconscious'>Image synced to remote database</span>")	//feedback to the Cyborg player that the picture was taken
	else
		to_chat(usr, "<span class='unconscious'>Image recorded</span>")
	// Always save locally
	injectaialbum(p)

/obj/item/camera/siliconcam/proc/selectpicture(obj/item/camera/siliconcam/cam) // CHOMPEdit - Removal of obj/item/device
	if(!cam)
		cam = getsource()

	var/list/nametemp = list()
	var/find
	if(cam.aipictures.len == 0)
		to_chat(usr, "<span class='userdanger'>No images saved</span>")
		return
	for(var/obj/item/photo/t in cam.aipictures) // CHOMPEdit - Removal of obj/item/weapon
		nametemp += t.name
	find = tgui_input_list(usr, "Select image (numbered in order taken)", "Picture Choice", nametemp)
	if(!find)
		return

	for(var/obj/item/photo/q in cam.aipictures) // CHOMPEdit - Removal of obj/item/weapon
		if(q.name == find)
			return q

/obj/item/camera/siliconcam/proc/viewpictures() // CHOMPEdit - Removal of obj/item/device
	var/obj/item/photo/selection = selectpicture() // CHOMPEdit - Removal of obj/item/weapon

	if(!selection)
		return

	selection.show(usr)
	to_chat(usr,selection.desc)

/obj/item/camera/siliconcam/proc/deletepicture(obj/item/camera/siliconcam/cam) // CHOMPEdit - Removal of obj/item/device
	var/selection = selectpicture(cam)

	if(!selection)
		return

	aipictures -= selection
	to_chat(usr, "<span class='unconscious'>Local image deleted</span>")

/obj/item/camera/siliconcam/ai_camera/can_capture_turf(turf/T, mob/user) // CHOMPEdit - Removal of obj/item/device
	var/mob/living/silicon/ai = user
	return ai.TurfAdjacent(T)

/obj/item/camera/siliconcam/proc/toggle_camera_mode() // CHOMPEdit - Removal of obj/item/device
	if(in_camera_mode)
		camera_mode_off()
	else
		camera_mode_on()

/obj/item/camera/siliconcam/proc/camera_mode_off() // CHOMPEdit - Removal of obj/item/device
	src.in_camera_mode = 0
	to_chat(usr, "<B>Camera Mode deactivated</B>")

/obj/item/camera/siliconcam/proc/camera_mode_on() // CHOMPEdit - Removal of obj/item/device
	src.in_camera_mode = 1
	to_chat(usr, "<B>Camera Mode activated</B>")

/obj/item/camera/siliconcam/ai_camera/printpicture(mob/user, obj/item/photo/p) // CHOMPEdit - Removal of obj/item/weapon // CHOMPEdit - Removal of obj/item/device
	injectaialbum(p)
	to_chat(usr, "<span class='unconscious'>Image recorded</span>")

/obj/item/camera/siliconcam/robot_camera/printpicture(mob/user, obj/item/photo/p) // CHOMPEdit - Removal of obj/item/weapon // CHOMPEdit - Removal of obj/item/device
	injectmasteralbum(p)

/mob/living/silicon/ai/proc/take_image()
	set category = "AI.Commands" //CHOMPEdit
	set name = "Take Image"
	set desc = "Takes an image"

	if(aiCamera)
		aiCamera.toggle_camera_mode()

/mob/living/silicon/ai/proc/view_images()
	set category = "AI.Commands" //CHOMPEdit
	set name = "View Images"
	set desc = "View images"

	if(aiCamera)
		aiCamera.viewpictures()

/mob/living/silicon/ai/proc/delete_images()
	set category = "AI.Commands" //CHOMPEdit
	set name = "Delete Image"
	set desc = "Delete image"

	if(aiCamera)
		aiCamera.deletepicture()

/mob/living/silicon/robot/proc/take_image()
	set category ="Abilities.Silicon" //ChompEDIT - TGPanel
	set name = "Take Image"
	set desc = "Takes an image"

	if(aiCamera)
		aiCamera.toggle_camera_mode()

/mob/living/silicon/robot/proc/view_images()
	set category ="Abilities.Silicon" //ChompEDIT - TGPanel
	set name = "View Images"
	set desc = "View images"

	if(aiCamera)
		aiCamera.viewpictures()

/mob/living/silicon/robot/proc/delete_images()
	set category = "Abilities.Silicon" //ChompEDIT - TGPanel
	set name = "Delete Image"
	set desc = "Delete a local image"

	if(aiCamera)
		aiCamera.deletepicture()

/obj/item/camera/siliconcam/proc/getsource() // CHOMPEdit - Removal of obj/item/device
	if(istype(src.loc, /mob/living/silicon/ai))
		return src

	var/mob/living/silicon/robot/C = usr
	var/obj/item/camera/siliconcam/Cinfo // CHOMPEdit - Removal of obj/item/device
	if(C.connected_ai)
		Cinfo = C.connected_ai.aiCamera
	else
		Cinfo = src
	return Cinfo

/mob/living/silicon/proc/GetPicture()
	if(!aiCamera)
		return
	return aiCamera.selectpicture()
