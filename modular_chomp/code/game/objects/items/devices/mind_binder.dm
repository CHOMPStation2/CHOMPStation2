// Another illegal hack of the sleevemate similar to the Body Snatcher. This one lets you store and bind minds to items.
/obj/item/mindbinder
	name = "\improper Mind Binder"
	desc = "An extremely illegal tool modified from a SleeveMate. It allows the storing and transfer of minds, but can bind them to objects instead of just humanoids."
	icon = 'icons/obj/device_alt.dmi'
	icon_state = "sleevemate"
	item_state = "healthanalyzer"
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_SMALL
	matter = list(MAT_STEEL = 200)
	origin_tech = list(TECH_MAGNET = 2, TECH_BIO = 2, TECH_ILLEGAL = 1)
	possessed_voice = list()
	var/self_bind = FALSE

/obj/item/mindbinder/New()
	..()
	flags |= NOBLUDGEON //So borgs don't spark.

/obj/item/mindbinder/attack(mob/living/M, mob/living/user)
	usr.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	return

/obj/item/mindbinder/attack_self(mob/living/user)
	return

/obj/item/mindbinder/proc/toggle_self_bind()
	if(possessed_voice.len == 1)
		to_chat(usr,"<span class='warning'>The device beeps a warning that there is already a mind loaded!</span>")
		return
	self_bind = !self_bind
	if(self_bind)
		to_chat(usr,"<span class='notice'>You prepare the device to use your own mind!</span>")
	else
		to_chat(usr,"<span class='notice'>You disable the device from using your mind.</span>")
	update_icon()

/obj/item/mindbinder/pre_attack(atom/A)
	if(istype(A, /obj/structure/gargoyle))
		var/obj/structure/gargoyle/G = A
		A = G.gargoyle
	if(istype(A, /obj/item/holder))
		var/obj/item/holder/H = A
		A = H.held_mob
	if(istype(A, /mob/living))
		var/mob/living/M = A
		if(!M.allow_mind_transfer)
			to_chat(usr,"<span class='danger'>The target's mind is too complex to be affected!</span>")
			return
		if(usr == M)
			toggle_self_bind()
			return
		if(possessed_voice.len == 1 || self_bind)
			bind_mob(M)
		else
			store_mob(M)
		return
	if(istype(A, /obj/item))
		var/obj/item/I = A
		if(possessed_voice.len == 1 || self_bind)
			bind_item(I)
		else
			store_item(I)
		return
	return

// Handle placing a mind into a mob
/obj/item/mindbinder/proc/bind_mob(mob/living/target)
	if(possessed_voice.len == 0 && !self_bind)
		to_chat(usr,"<span class='warning'>The device beeps a warning that it doesn't contain a mind to bind!</span>")
		return

	if(target.ckey)
		to_chat(usr,"<span class='warning'>The device beeps a warning that the target is already sentient!</span>")
		return

	if(self_bind)
		var/choice = tgui_alert(usr,"This will bind YOUR mind to the target! You may not be able to go back without help. Continue?","Confirmation",list("Continue","Cancel"))
		if(!choice || choice == "Cancel") return
		choice = tgui_alert(usr,"No really. You cannot OOC Escape this. Are you sure?","Confirmation",list("Yes I'm sure","Cancel"))
		if(choice == "Yes I'm sure" && usr.get_active_hand() == src && usr.Adjacent(target))
			usr.visible_message("<span class='warning'>[usr] presses [src] against [target]. The device beginning to let out a series of beeps!</span>","<span class='notice'>You begin to bind yourself into [target]!</span>")
			log_and_message_admins("attempted to bind themselves to \an [target] with a Mind Binder.")
			if(do_after(usr,30 SECONDS,target))
				if(!target.ckey)
					usr.mind.transfer_to(target)
				self_bind = !self_bind
				update_icon()
				to_chat(usr,"<span class='notice'>Your mind as been bound to [target].</span>")
		return

	usr.visible_message("<span class='warning'>[usr] presses [src] against [target]. The device beginning to let out a series of beeps!</span>","<span class='notice'>You begin to bind someone's mind into [target]!</span>")
	log_and_message_admins("attempted to bind [key_name(src.possessed_voice[1])] to \an [target] with a Mind Binder.")
	var/doTime = 30 SECONDS
	if(ishuman(target) || issilicon(target) || isanimal(target))
		doTime = 5 SECONDS
	if(do_after(usr,doTime,target))
		if(possessed_voice.len == 1 && !target.ckey)
			var/mob/living/voice/V = possessed_voice[1]
			V.mind.transfer_to(target)
			V.Destroy()
			possessed_voice = list()
			to_chat(usr,"<span class='notice'>Mind bound to [target].</span>")

	update_icon()

// Handle placing a mind into an item
/obj/item/mindbinder/proc/bind_item(obj/item/item)
	if(possessed_voice.len == 0 && !self_bind)
		to_chat(usr,"<span class='warning'>The device beeps a warning that it doesn't contain a mind to bind!</span>")
		return

	if(item.possessed_voice && item.possessed_voice.len)
		to_chat(usr,"<span class='warning'>The device beeps a warning that the target is already sentient!</span>")
		return

	if(is_type_in_list(item, item_vore_blacklist))
		to_chat(usr,"<span class='danger'>The item resists your transfer attempt!</span>")
		return

	if(self_bind)
		var/choice = tgui_alert(usr,"This will bind YOUR mind to the target! You will not be able to go back without help. Continue?","Confirmation",list("Continue","Cancel"))
		if(!choice || choice == "Cancel") return
		choice = tgui_alert(usr,"No really. You cannot OOC Escape this. Are you sure?","Confirmation",list("Yes I'm sure","Cancel"))
		if(choice == "Yes I'm sure" && usr.get_active_hand() == src && usr.Adjacent(item))
			log_and_message_admins("attempted to bind themselves to \an [item] with a Mind Binder.")
			usr.visible_message("<span class='warning'>[usr] presses [src] against [item]. The device beginning to let out a series of beeps!</span>","<span class='notice'>You begin to bind yourself into [item]!</span>")
			if(do_after(usr,30 SECONDS,item))
				item.inhabit_item(usr, null, null, TRUE)
				self_bind = !self_bind
				update_icon()
				to_chat(usr,"<span class='notice'>Your mind as been bound to [item].</span>")
		return

	log_and_message_admins("attempted to bind [key_name(src.possessed_voice[1])] to \an [item] with a Mind Binder.")
	usr.visible_message("<span class='warning'>[usr] presses [src] against [item]. The device beginning to let out a series of beeps!</span>","<span class='notice'>You begin to bind someone's mind into [item]!</span>")
	if(do_after(usr,5 SECONDS,item))
		if(possessed_voice.len == 1)
			var/mob/living/voice/V = possessed_voice[1]
			item.inhabit_item(V, null, V.tf_mob_holder, TRUE)
			V.Destroy()
			possessed_voice = list()
			to_chat(usr,"<span class='notice'>Mind bound to [item].</span>")

	update_icon()

// Handle taking a mind out of a mob
/obj/item/mindbinder/proc/store_mob(mob/living/target)
	if(possessed_voice.len != 0)
		to_chat(usr,"<span class='warning'>The device beeps a warning that there is already a mind loaded!</span>")
		return

	if(!target.mind || (target.mind.name in prevent_respawns))
		to_chat(usr,"<span class='warning'>The device beeps a warning that the target isn't sentient.</span>")
		return

	var/choice = tgui_alert(usr,"This will download the target's mind into the device. Once their mind is loaded you can then bind it into an item. This will result in the target being stuck until you put them back in their original body. Please make sure OOC prefs align! Continue?","Confirmation",list("Continue","Cancel"))
	if(choice == "Continue" && usr.get_active_hand() == src && usr.Adjacent(target))
		if(target.ckey && !target.client)
			log_and_message_admins("attempted to take [key_name(target)]'s mind with a Mind Binder while they were SSD!")
		else
			log_and_message_admins("attempted to take [key_name(target)]'s mind with a Mind Binder.")
		usr.visible_message("<span class='warning'>[usr] presses [src] against [target]'s head. The device beginning to let out a series of beeps!</span>","<span class='notice'>You begin to download [target]'s mind!</span>")
		if(do_after(usr,30 SECONDS,target))
			if(possessed_voice.len == 0 && target.mind)
				inhabit_item(target, target.real_name, null)
				to_chat(usr,"<span class='notice'>Mind successfully stored!</span>")

	update_icon()

// Handle taking a mind out of an item
/obj/item/mindbinder/proc/store_item(obj/item/item)
	if(possessed_voice.len != 0)
		to_chat(usr,"<span class='warning'>The device beeps a warning that there is already a mind loaded!</span>")
		return

	if(!(item.possessed_voice && item.possessed_voice.len))
		return

	var/mob/living/voice/target = item.possessed_voice[1]

	log_and_message_admins("attempted to take [key_name(target)]'s mind out of \an [item] with a Mind Binder.")
	usr.visible_message("<span class='warning'>[usr] presses [src] against [item]. The device beginning to let out a series of beeps!</span>","<span class='notice'>You begin to download someone's mind from [item]!</span>")
	if(do_after(usr,5 SECONDS,item))
		if(possessed_voice.len == 0 && item.possessed_voice.Find(target))
			inhabit_item(target, target.real_name, target.tf_mob_holder)
			target.Destroy()
			item.possessed_voice.Remove(target)
			to_chat(usr,"<span class='notice'>Mind successfully stored!</span>")

	update_icon()

/obj/item/mindbinder/update_icon()
	if((possessed_voice && possessed_voice.len > 0) || self_bind)
		icon_state = "[initial(icon_state)]_on"
	else
		icon_state = initial(icon_state)
