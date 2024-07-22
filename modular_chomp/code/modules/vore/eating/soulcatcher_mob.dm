/mob/living/carbon/brain/caught_soul/vore
	name = "stored soul"
	desc = "A soul stored within the predator."

	var/obj/soulgem/gem

/mob/living/carbon/brain/caught_soul/vore/Destroy()
	if(gem)
		gem.notify_holder("Mind unloaded: [name]")
		gem.brainmobs -= src
		gem = null
	if(eyeobj)
		QDEL_NULL(eyeobj)
		gem.notify_holder("[name] ended AR projection.")
	container = null
	return ..()

/mob/living/carbon/brain/caught_soul/vore/Life()
	. = ..()

	if(!parent_mob && !transient &&(life_tick % 150 == 0) && gem.setting_flags & NIF_SC_BACKUPS)
		SStranscore.m_backup(mind,0) //Passed 0 means "Don't touch the nif fields on the mind record"

/mob/living/carbon/brain/caught_soul/vore/say(var/message, var/datum/language/speaking = null, var/whispering = 0)
	if(silent) return FALSE
	gem.use_speech(message, src, eyeobj)

/mob/living/carbon/brain/caught_soul/vore/custom_emote(var/m_type, var/message)
	if(silent) return FALSE
	gem.use_emote(message,src,eyeobj)

/mob/living/carbon/brain/caught_soul/vore/resist()
	set name = "Resist"
	set category = "IC.Game" //CHOMPEdit

	to_chat(src, span_warning("There's no way out! You're stuck inside your predator."))

/mob/proc/enter_soulcatcher()
	set name = "Enter Soulcatcher"
	set desc = "Enter your own Soulcatcher."
	set category = "IC.Vore"

	if(!soulgem) // Only sanity...
		return
	if(soulgem && soulgem.flag_check(SOULGEM_ACTIVE))
		soulgem.catch_mob(src)

/mob/proc/nsay_vore()
	set name = "NSay Vore"
	set desc = "Speak into your Soulcatcher."
	set category = "IC.Vore"

	src.nsay_vore_act()

/mob/proc/nsay_vore_act()
	if(stat != CONSCIOUS)
		to_chat(src, span_warning("You can't use NSay Vore while unconscious."))
		return
	if(!soulgem) // Only sanity...
		return
	var/obj/soulgem/gem = soulgem
	if(!gem.brainmobs.len)
		to_chat(src, span_warning("You need a devoured soul to use NSay Vore."))
		return
	var/message = tgui_input_text(usr, "Type a message to say.","Speak into Soulcatcher", multiline=TRUE)
	if(message)
		var/sane_message = sanitize(message)
		gem.use_speech(sane_message, src)

/mob/proc/nme_vore()
	set name = "NMe Vore"
	set desc = "Emote into your Soulcatcher."
	set category = "IC.Vore"

	src.nme_vore_act()

/mob/proc/nme_vore_act()
	if(stat != CONSCIOUS)
		to_chat(src, span_warning("You can't use NMe Vore while unconscious."))
		return
	if(!soulgem) // Only sanity...
		return
	var/obj/soulgem/gem = soulgem
	if(!gem.brainmobs.len)
		to_chat(src, span_warning("You need a devoured soul to use NMe Vore."))
		return

	var/message = tgui_input_text(usr, "Type an action to perform.","Emote into Soulcatcher", multiline=TRUE)
	if(message)
		var/sane_message = sanitize(message)
		gem.use_emote(sane_message, src)

/mob/living/carbon/brain/caught_soul/vore/ar_project()
	set name = "AR Project"
	set desc = "Project your form into Augmented Reality for those around your predator with the appearance of your loaded character."
	set category = "Soulcatcher"

	if(eyeobj)
		to_chat(src, span_warning("You're already projecting in AR!"))
		return

	if(!(gem.setting_flags & NIF_SC_PROJECTING))
		to_chat(src, span_warning("Projecting from this NIF has been disabled!"))
		return

	if(!client || !client.prefs)
		return //Um...

	eyeobj = new/mob/observer/eye/ar_soul(src, gem.owner)
	gem.notify_holder("[src] now AR projecting.")
	gem.clear_vore_fx(src)

/mob/living/carbon/brain/caught_soul/vore/jump_to_owner()
	set name = "Jump to Owner"
	set desc = "Jump your projection back to the owner of the soulcatcher you're inside."
	set category = "Soulcatcher"

	if(!eyeobj)
		to_chat(src, span_warning("You're not projecting into AR!"))
		return

	eyeobj.forceMove(get_turf(gem))

/mob/living/carbon/brain/caught_soul/vore/reenter_soulcatcher()
	set name = "Re-enter Soulcatcher"
	set desc = "Leave AR projection and drop back into the soulcatcher."
	set category = "Soulcatcher"

	if(!eyeobj)
		to_chat(src, span_warning("You're not projecting into AR!"))
		return

	QDEL_NULL(eyeobj)
	gem.notify_holder("[src] ended AR projection.")
	gem.show_vore_fx(src, TRUE)

/mob/living/carbon/brain/caught_soul/vore/nsay_brain()
	set name = "NSay"
	set desc = "Speak to your Soulcatcher (circumventing AR speaking)."
	set category = "Soulcatcher"

	var/message = tgui_input_text(usr, "Type a message to say.","Speak into Soulcatcher", multiline=TRUE)
	if(message)
		var/sane_message = sanitize(message)
		gem.use_speech(sane_message, src)

/mob/living/carbon/brain/caught_soul/vore/nme_brain()
	set name = "NMe"
	set desc = "Emote to your Soulcatcher (circumventing AR speaking)."
	set category = "Soulcatcher"

	var/message = tgui_input_text(usr, "Type an action to perform.","Emote into Soulcatcher", multiline=TRUE)
	if(message)
		var/sane_message = sanitize(message)
		gem.use_emote(sane_message, src)

/mob/living/carbon/brain/caught_soul/vore/proc/transfer_self()
	set name = "Transfer Self"
	set desc = "Transfer youself while being in your own soulcatcher into a nearby Sleevemate or MMI."
	set category = "Soulcatcher"

	if(eyeobj)
		to_chat(src, span_warning("You can't do that while AR projecting!"))
		return
	if(gem.own_mind != mind)
		to_chat(src, span_warning("You aren't in your own soulcatcher!"))
		return

	var/list/valid_objects = gem.find_transfer_objects()
	if(!valid_objects || !valid_objects.len)
		return
	var/obj/item/target = tgui_input_list(src, "Select where you want to store your own mind into.", "Mind Transfer Target", valid_objects)
	gem.transfer_mob(src, target)

/mob/living/carbon/brain/caught_soul/vore/proc/reenter_body()
	set name = "Re-enter Body"
	set desc = "Return to your body after self capturing."
	set category = "Soulcatcher"

	if(eyeobj)
		to_chat(src, span_warning("You can't do that while AR projecting!"))
		return
	gem.return_to_body(mind)
