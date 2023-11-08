/*!
 * Copyright (c) 2020 Aleksej Komarov
 * SPDX-License-Identifier: MIT
 */

/**
 * Circumvents the message queue and sends the message
 * to the recipient (target) as soon as possible.
 */
/proc/to_chat_immediate(
	target,
	html,
	type = null,
	text = null,
	avoid_highlighting = FALSE,
	// FIXME: These flags are now pointless and have no effect
	handle_whitespace = TRUE,
	trailing_newline = TRUE,
	confidential = FALSE
)
	// Useful where the integer 0 is the entire message. Use case is enabling to_chat(target, some_boolean) while preventing to_chat(target, "")
	html = "[html]"
	text = "[text]"

	if(!target)
		return
	if(!html && !text)
		CRASH("Empty or null string in to_chat proc call.")
	if(target == world)
		target = GLOB.clients

	// Build a message
	var/message = list()
	if(type) message["type"] = type
	if(text) message["text"] = text
	if(html) message["html"] = html
	if(avoid_highlighting) message["avoidHighlighting"] = avoid_highlighting
	var/message_blob = TGUI_CREATE_MESSAGE("chat/message", message)
	var/message_html = message_to_html(message)
	if(islist(target))
		for(var/_target in target)
			var/client/client = CLIENT_FROM_VAR(_target)
			if(client)
				// Send to tgchat
				client.tgui_panel?.window.send_raw_message(message_blob)
				// Send to old chat
				SEND_TEXT(client, message_html)
		return
	var/client/client = CLIENT_FROM_VAR(target)
	if(client)
		// Send to tgchat
		client.tgui_panel?.window.send_raw_message(message_blob)
		// Send to old chat
		SEND_TEXT(client, message_html)

/**
 * Sends the message to the recipient (target).
 *
 * Recommended way to write to_chat calls:
 * ```
 * to_chat(client,
 *     type = MESSAGE_TYPE_INFO,
 *     html = "You have found <strong>[object]</strong>")
 * ```
 */
/proc/to_chat(
	target,
	html,
	type = null,
	text = null,
	avoid_highlighting = FALSE,
	// FIXME: These flags are now pointless and have no effect
	handle_whitespace = TRUE,
	trailing_newline = TRUE,
	confidential = FALSE
)
	//if(isnull(Master) || !SSchat?.initialized || !MC_RUNNING(SSchat.init_stage))
	if(isnull(Master) || !SSchat?.subsystem_initialized)
		to_chat_immediate(target, html, type, text, avoid_highlighting)
		return

	// Useful where the integer 0 is the entire message. Use case is enabling to_chat(target, some_boolean) while preventing to_chat(target, "")
	html = "[html]"
	text = "[text]"

	if(!target)
		return
	if(!html && !text)
		CRASH("Empty or null string in to_chat proc call.")
	if(target == world)
		target = GLOB.clients

	// Build a message
	var/message = list()
	if(type) message["type"] = type
	if(text) message["text"] = text
	if(html) message["html"] = html
	if(avoid_highlighting) message["avoidHighlighting"] = avoid_highlighting
	SSchat.queue(target, message)

//This is used to convert icons to base64 <image> strings, because byond stores icons in base64 in savefiles.
GLOBAL_DATUM_INIT(iconCache, /savefile, new("data/iconCache.sav")) //Cache of icons for the browser output

//Converts an icon to base64. Operates by putting the icon in the iconCache savefile,
// exporting it as text, and then parsing the base64 from that.
// (This relies on byond automatically storing icons in savefiles as base64)
/proc/icon2base64(var/icon/icon, var/iconKey = "misc")
	if (!isicon(icon)) return FALSE

	GLOB.iconCache[iconKey] << icon
	var/iconData = GLOB.iconCache.ExportText(iconKey)
	var/list/partial = splittext(iconData, "{")
	return replacetext(copytext(partial[2], 3, -5), "\n", "")

/proc/expire_bicon_cache(key)
	if(GLOB.bicon_cache[key])
		GLOB.bicon_cache -= key
		return TRUE
	return FALSE

GLOBAL_LIST_EMPTY(bicon_cache) // Cache of the <img> tag results, not the icons
/proc/bicon(var/obj, var/use_class = 1, var/custom_classes = "")
	var/class = use_class ? "class='icon misc [custom_classes]'" : null
	if(!obj)
		return

	// Try to avoid passing bicon an /icon directly. It is better to pass it an atom so it can cache.
	if(isicon(obj)) // Passed an icon directly, nothing to cache-key on, as icon refs get reused *often*
		return "<img [class] src='data:image/png;base64,[icon2base64(obj)]'>"

	// Either an atom or somebody fucked up and is gonna get a runtime, which I'm fine with.
	var/atom/A = obj
	var/key
	var/changes_often = ishuman(A) || isobserver(A) // If this ends up with more, move it into a proc or var on atom.

	if(changes_often)
		key = "\ref[A]"
	else
		key = "[istype(A.icon, /icon) ? "\ref[A.icon]" : A.icon]:[A.icon_state]"

	var/base64 = GLOB.bicon_cache[key]
	// Non-human atom, no cache
	if(!base64) // Doesn't exist, make it.
		base64 = icon2base64(A.examine_icon(), key)
		GLOB.bicon_cache[key] = base64
		if(changes_often)
			addtimer(CALLBACK(GLOBAL_PROC, PROC_REF(expire_bicon_cache), key), 50 SECONDS, TIMER_UNIQUE)

	// May add a class to the img tag created by bicon
	if(use_class)
		class = "class='icon [A.icon_state] [custom_classes]'"

	return "<IMG [class] src='data:image/png;base64,[base64]'>"
