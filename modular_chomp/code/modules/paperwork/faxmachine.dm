/proc/get_role_request_channel()
	var/channel_tag = "rolerequest"
	var/datum/tgs_api/v5/api = TGS_READ_GLOBAL(tgs)
	if(istype(api) && channel_tag)
		for(var/datum/tgs_chat_channel/channel in api.chat_channels)
			if(channel.custom_tag == channel_tag)
				return list(channel)
	return 0

/proc/role_request_discord_message(var/message)
	if(!message)
		return
	var/datum/tgs_chat_channel/channel = get_role_request_channel()
	if(channel)
		world.TgsChatBroadcast(message,channel)

/proc/get_fax_channel()
	var/channel_tag = "fax"
	var/datum/tgs_api/v5/api = TGS_READ_GLOBAL(tgs)
	if(istype(api) && channel_tag)
		for(var/datum/tgs_chat_channel/channel in api.chat_channels)
			if(channel.custom_tag == channel_tag)
				return list(channel)
	return 0

/proc/fax_discord_message(var/message)
	if(!message)
		return
	var/datum/tgs_chat_channel/channel = get_fax_channel()
	if(channel)
		world.TgsChatBroadcast(message,channel)



/obj/machinery/photocopier/faxmachine/message_chat_admins(var/mob/sender, var/faxname, var/obj/item/sent, var/faxid, font_colour="#006100")
	fax_discord_message("A fax; '[faxname]' was sent.\nSender: [sender.name]\nFax name:\n[sent.name]\nFax ID: **[faxid]**")


/obj/machinery/photocopier/faxmachine/message_chat_rolerequest(var/font_colour="#006100", var/role_to_ping, var/reason, var/jobname)
	role_request_discord_message("An automated request for crew has been made.\nJob: [jobname]\nReason: [reason]\n\n@[role_to_ping]")