/obj/item/starcaster_news/after_trash_eaten(var/mob/living/user)
	to_chat(user, span_notice("You can taste the dry flavor of digital garbage, oh wait its just the news."))

/obj/item/newspaper/after_trash_eaten(var/mob/living/user)
	to_chat(user, span_notice("You can taste the dry flavor of garbage, oh wait its just the news."))

/obj/item/cell/after_trash_eaten(var/mob/living/user)
	visible_message(span_warning("[user] sates their electric appetite with a [src]!"))
	to_chat(user, span_notice("You can taste the spicy flavor of electrolytes, yum."))

/obj/item/walkpod/after_trash_eaten(var/mob/living/user)
	visible_message(span_warning("[user] sates their musical appetite with a [src]!"))
	to_chat(user, span_notice("You can taste the jazzy flavor of music."))

/obj/item/mail/junkmail/after_trash_eaten(var/mob/living/user)
	visible_message(span_warning("[user] devours the [src]!"))
	to_chat(user, span_notice("You can taste the flavor of the galactic postal service."))

/obj/item/gun/energy/sizegun/after_trash_eaten(var/mob/living/user)
	visible_message(span_warning("[user] devours the [src]!"))
	to_chat(user, span_notice("You didn't read the warning label, did you?"))

/obj/item/slow_sizegun/after_trash_eaten(var/mob/living/user)
	visible_message(span_warning("[user] devours the [src]!"))
	to_chat(user, span_notice("You taste the flavor of sunday driver bluespace."))

/obj/item/laser_pointer/after_trash_eaten(var/mob/living/user)
	visible_message(span_warning("[user] devours the [src]!"))
	to_chat(user, span_notice("You taste the flavor of a laser."))

/obj/item/canvas/after_trash_eaten(var/mob/living/user)
	visible_message(span_warning("[user] devours the [src]!"))
	to_chat(user, span_notice("You taste the flavor of priceless artwork."))
