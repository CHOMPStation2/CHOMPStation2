//Adminspawn item for hunters who're doing kidnaps during events
/obj/item/pen/autostun
	desc = "A well made and expensive fountain pen. This one has gold accents."
	icon_state = "blueg_fountain"
	var/stun_duration = 10

/obj/item/pen/autostun/attack(mob/living/M as mob, mob/user as mob)

	if(!istype(M))
		return
	M.Stun(stun_duration)

/obj/item/pen/autostun/paralyse
	desc = "A well made and expensive fountain pen. This one has gold accents."

/obj/item/pen/autostun/paralyse/attack(mob/living/M as mob, mob/user as mob)

	if(!istype(M))
		return
	M.Paralyse(stun_duration)


/obj/item/pen/autostun/weaken
	desc = "A well made and expensive fountain pen. This one has gold accents."

/obj/item/pen/autostun/weaken/attack(mob/living/M as mob, mob/user as mob)

	if(!istype(M))
		return
	M.Weaken(stun_duration)
