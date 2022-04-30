//pasting this into the modularity folder probably isn't the greatest of ideas since the nullrod is already an item, but it's in weaponry.dm so I didn't know how else to approach it lmao

/obj/item/nullrod
	name = "null rod"
	desc = "A rod of pure obsidian, its very presence disrupts and dampens the powers of paranormal phenomenae."
	icon = 'icons/obj/weapons_ch.dmi'
	icon_state = "nullrod"
	item_state = "nullrod"
	slot_flags = SLOT_BELT
	force = 15
	throw_speed = 1
	throw_range = 4
	throwforce = 10
	w_class = ITEMSIZE_SMALL
	drop_sound = 'sound/items/drop/sword.ogg'
	pickup_sound = 'sound/items/pickup/sword.ogg'

	var/reskinned = FALSE
	var/defend_chance = 0	// The base chance for the weapon to parry.
	var/projectile_parry_chance = 0	// The base chance for a projectile to be deflected.

	item_icons = list(
			slot_l_hand_str = 'modular_chomp/icons/mob/items/lefthand_melee_ch.dmi',
			slot_r_hand_str = 'modular_chomp/icons/mob/items/righthand_melee_ch.dmi',
			)

	var/SA_bonus_damage = 35 // 50 total against demons and aberrations.
	var/SA_vulnerability = MOB_CLASS_DEMONIC | MOB_CLASS_ABERRATION

/obj/item/nullrod/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, TRUE, FALSE, null, null, FALSE)

/obj/item/nullrod/afterattack(atom/A, mob/user as mob, proximity)
	if(!proximity)
		return
	if (istype(A, /turf/simulated/floor))
		to_chat(user, "<span class='notice'>You hit the floor with the [src].</span>")
		call(/obj/effect/rune/proc/revealrunes)(src)
	if (isliving(A))
		var/mob/living/tm = A // targeted mob
		if(SA_vulnerability & tm.mob_class)
			tm.apply_damage(SA_bonus_damage) // fuck em

/obj/item/nullrod/attack_self(mob/user)
	if(user && (user.mind.isholy) && !reskinned)
		reskin_holy_weapon(user)

/**
  * reskin_holy_weapon: Shows a user a list of all available nullrod reskins and based on his choice replaces the nullrod with the reskinned version
  *
  * Arguments:
  * * M The mob choosing a nullrod reskin
  */
/obj/item/nullrod/proc/reskin_holy_weapon(mob/living/L)
	if(GLOB.holy_weapon_type)
		return
	var/obj/item/holy_weapon
	var/list/holy_weapons_list = subtypesof(/obj/item/nullrod) + list(HOLY_WEAPONS)
	var/list/display_names = list()
	var/list/nullrod_icons = list()
	for(var/V in holy_weapons_list)
		var/obj/item/nullrod/rodtype = V
		if (V)
			display_names[initial(rodtype.name)] = rodtype
			nullrod_icons += list(initial(rodtype.name) = image(icon = initial(rodtype.icon), icon_state = initial(rodtype.icon_state)))

	nullrod_icons = sortList(nullrod_icons)

	var/choice = show_radial_menu(L, src , nullrod_icons, custom_check = CALLBACK(src, .proc/check_menu, L), radius = 42, require_near = TRUE)
	if(!choice || !check_menu(L))
		return

	var/A = display_names[choice] // This needs to be on a separate var as list member access is not allowed for new
	holy_weapon = new A

	GLOB.holy_weapon_type = holy_weapon.type

	if(holy_weapon)
		reskinned = TRUE
		qdel(src)
		L.put_in_active_hand(holy_weapon)

/**
  * check_menu: Checks if we are allowed to interact with a radial menu
  *
  * Arguments:
  * * user The mob interacting with a menu
  */
/obj/item/nullrod/proc/check_menu(mob/user)
	if(!istype(user))
		return FALSE
	if(QDELETED(src) || reskinned)
		return FALSE
	if(user.incapacitated())
		return FALSE
	return TRUE

/obj/item/nullrod/proc/jedi_spin(mob/living/user)
	for(var/i in list(NORTH,SOUTH,EAST,WEST,EAST,SOUTH,NORTH,SOUTH,EAST,WEST,EAST,SOUTH))
		user.setDir(i)
		if(i == WEST)
			user.emote("flip")
		sleep(1)

/obj/item/nullrod/godhand
	icon_state = "disintegrate"
	item_state = "disintegrate"
	name = "god hand"
	desc = "This hand of yours glows with an awesome power!"
	damtype = BURN
	attack_verb = list("punched", "cross countered", "pummeled")

/obj/item/nullrod/godhand/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)

/obj/item/nullrod/staff
	icon_state = "godstaff-red"
	item_state = "godstaff-red"
	name = "red holy staff"
	desc = "It has a mysterious, protective aura."
	force = 5
	slot_flags = SLOT_BACK
	defend_chance = 50
	var/shield_icon = "shield-red"

/obj/item/nullrod/staff/blue
	name = "blue holy staff"
	icon_state = "godstaff-blue"
	item_state = "godstaff-blue"
	shield_icon = "shield-old"

/obj/item/nullrod/claymore
	icon_state = "claymore"
	item_state = "claymore"
	name = "holy claymore"
	desc = "A weapon fit for a crusade!"
	slot_flags = SLOT_BACK|SLOT_BELT
	projectile_parry_chance = 30
	sharp = 1
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/nullrod/claymore/darkblade
	icon_state = "cultblade"
	item_state = "cultblade"
	name = "dark blade"
	desc = "Spread the glory of the dark gods!"
	slot_flags = SLOT_BELT
	hitsound = 'sound/hallucinations/growl1.ogg'

/obj/item/nullrod/claymore/chainsaw_sword
	icon_state = "chainsword1"
	item_state = "chainsword1"
	name = "sacred chainsaw sword"
	desc = "Suffer not a heretic to live."
	slot_flags = SLOT_BELT
	sharp = 1
	edge = 1
	attack_verb = list("sawed", "torn", "cut", "chopped", "diced")
	hitsound = 'sound/weapons/chainsaw_attack.ogg'

/obj/item/nullrod/claymore/glowing
	icon_state = "swordon"
	item_state = "swordon"
	name = "force weapon"
	desc = "The blade glows with the power of faith. Or possibly a battery."
	slot_flags = SLOT_BELT

/obj/item/nullrod/claymore/katana
	name = "\improper Hanzo steel"
	desc = "Capable of cutting clean through a holy claymore."
	icon_state = "katana"
	item_state = "katana"
	slot_flags = SLOT_BELT | SLOT_BACK

/obj/item/nullrod/claymore/multiverse
	name = "extradimensional blade"
	desc = "Once the harbinger of an interdimensional war, its sharpness fluctuates wildly."
	icon_state = "multiverse"
	item_state = "multiverse"
	slot_flags = SLOT_BELT

/obj/item/nullrod/claymore/multiverse/attack(mob/living/carbon/M, mob/living/carbon/user)
	force = rand(1, 30)
	..()

/obj/item/nullrod/claymore/saber
	name = "light energy sword"
	hitsound = 'sound/weapons/blade1.ogg'
	icon_state = "swordblue"
	item_state = "swordblue"
	desc = "If you strike me down, I shall become more robust than you can possibly imagine."
	slot_flags = SLOT_BELT

/obj/item/nullrod/claymore/saber/red
	name = "dark energy sword"
	icon_state = "swordred"
	item_state = "swordred"
	desc = "Woefully ineffective when used on steep terrain."

/obj/item/nullrod/claymore/saber/pirate
	name = "nautical energy sword"
	icon_state = "cutlass1"
	item_state = "cutlass1"
	desc = "Convincing HR that your religion involved piracy was no mean feat."

/obj/item/nullrod/sord
	name = "\improper UNREAL SORD"
	desc = "This thing is so unspeakably HOLY you are having a hard time even holding it."
	icon_state = "sord"
	item_state = "sord"
	slot_flags = SLOT_BELT
	force = 4.13
	throwforce = 1
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/nullrod/scythe
	icon_state = "rscythe"
	item_state = "rscythe"
	name = "reaper scythe"
	desc = "Ask not for whom the bell tolls..."
	armor_penetration = 35
	slot_flags = SLOT_BACK
	sharp = 1
	edge = 1
	attack_verb = list("chopped", "sliced", "cut", "reaped")

/obj/item/nullrod/scythe/vibro
	icon_state = "hfrequency0"
	item_state = "hfrequency1"
	name = "high frequency blade"
	desc = "Bad references are the DNA of the soul."
	attack_verb = list("chopped", "sliced", "cut", "zandatsu'd")
	hitsound = 'modular_chomp/sound/weapons/rapierhit.ogg'

/obj/item/nullrod/scythe/spellblade
	icon_state = "spellblade"
	item_state = "spellblade"
	name = "dormant spellblade"
	desc = "The blade grants the wielder nearly limitless power...if they can figure out how to turn it on, that is."
	hitsound = 'modular_chomp/sound/weapons/rapierhit.ogg'

/obj/item/nullrod/hammmer
	icon_state = "hammeron"
	item_state = "hammeron"
	name = "relic war hammer"
	desc = "This war hammer cost the chaplain forty thousand space dollars."
	slot_flags = SLOT_BELT
	attack_verb = list("smashed", "bashed", "hammered", "crunched")

/obj/item/nullrod/chainsaw
	name = "chainsaw hand"
	desc = "Good? Bad? You're the guy with the chainsaw hand."
	icon_state = "chainsaw_on"
	item_state = "mounted_chainsaw"
	sharp = 1
	edge = 1
	attack_verb = list("sawed", "torn", "cut", "chopped", "diced")
	hitsound = 'sound/weapons/chainsaw_attack.ogg'

/obj/item/nullrod/chainsaw/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)

/obj/item/nullrod/clown
	icon = 'icons/obj/wizard.dmi'
	icon_state = "clownrender"
	item_state = "render"
	name = "clown dagger"
	desc = "Used for absolutely hilarious sacrifices."
	hitsound = 'sound/items/bikehorn.ogg'
	sharp = 1
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/nullrod/pride_hammer
	icon_state = "pride"
	item_state = "pride"
	name = "Pride-struck Hammer"
	desc = "It resonates an aura of Pride."
	force = 16
	throwforce = 15
	w_class = 4
	slot_flags = SLOT_BACK
	attack_verb = list("attacked", "smashed", "crushed", "splattered", "cracked")
	hitsound = 'sound/weapons/resonator_blast.ogg'

/obj/item/nullrod/pride_hammer/afterattack(atom/A as mob|obj|turf|area, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(prob(30) && ishuman(A))
		var/mob/living/carbon/human/H = A
		user.reagents.trans_to(H, user.reagents.total_volume, 1, 1, 0)
		to_chat(user, "<span class='notice'>Your pride reflects on [H].</span>")
		to_chat(H, "<span class='userdanger'>You feel insecure, taking on [user]'s burden.</span>")

/obj/item/nullrod/whip
	name = "holy whip"
	desc = "What a terrible night to be on Space Station 13."
	icon_state = "chain"
	item_state = "chain"
	slot_flags = SLOT_BELT
	force = 12
	reach = 2
	attack_verb = list("whipped", "lashed")
	hitsound = 'sound/weapons/towelwhip.ogg'

/obj/item/nullrod/fedora
	name = "atheist's fedora"
	desc = "The brim of the hat is as sharp as your wit. The edge would hurt almost as much as disproving the existence of God."
	icon_state = "trilby"
	item_state = "trilby"
	slot_flags = SLOT_HEAD
	icon = 'icons/inventory/head/item.dmi'
	force = 0
	throw_speed = 4
	throw_range = 7
	throwforce = 30
	sharp = 1
	attack_verb = list("enlightened", "redpilled")

/obj/item/nullrod/armblade
	name = "dark blessing"
	desc = "Particularly twisted deities grant gifts of dubious value."
	icon_state = "arm_blade"
	item_state = "arm_blade"
	sharp = 1
	edge = 1

/obj/item/nullrod/armblade/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)

/obj/item/nullrod/armblade/claw
	name = "profane blessing"
	icon_state = "ling_claw"
	item_state = "ling_claw"

/obj/item/nullrod/armblade/tentacle
	name = "unholy blessing"
	icon_state = "tentacle"
	item_state = "tentacle"

/obj/item/nullrod/carp
	name = "carp-sie plushie"
	desc = "An adorable stuffed toy that resembles the god of all carp. The teeth look pretty sharp. Activate it to receive the blessing of Carp-Sie."
	icon = 'icons/obj/toy.dmi'
	icon_state = "basecarp"
	item_state = "basecarp"
	force = 15
	attack_verb = list("bitten", "eaten", "fin slapped")
	hitsound = 'sound/weapons/bite.ogg'
	var/used_blessing = FALSE

/obj/item/nullrod/carp/attack_self(mob/living/user)
	if(used_blessing)
	else if(user.mind && (user.mind.isholy))
		to_chat(user, "You are blessed by Carp-Sie. Wild space carp will no longer attack you.")
		user.faction |= "carp"
		used_blessing = TRUE

/obj/item/nullrod/claymore/bostaff //May as well make it a "claymore" and inherit the blocking
	name = "monk's staff"
	desc = "A long, tall staff made of polished wood. Traditionally used in ancient old-Earth martial arts, it is now used to harass the clown."
	force = 15
	defend_chance = 40
	slot_flags = SLOT_BACK
	sharp = 1
	hitsound = "swing_hit"
	attack_verb = list("smashed", "slammed", "whacked", "thwacked")
	icon_state = "bostaff0"
	item_state = "bostaff0"

/obj/item/nullrod/claymore/bostaff/attack(mob/target, mob/living/user)
	add_fingerprint(user)
	if(!issilicon(target))
		return ..()
	if(!isliving(target))
		return ..()
	if(user.a_intent == INTENT_DISARM)
		if(!ishuman(target))
			return ..()
		var/mob/living/carbon/human/H = target
		var/list/fluffmessages = list("[user] clubs [H] with [src]!", \
									  "[user] smacks [H] with the butt of [src]!", \
									  "[user] broadsides [H] with [src]!", \
									  "[user] smashes [H]'s head with [src]!", \
									  "[user] beats [H] with front of [src]!", \
									  "[user] twirls and slams [H] with [src]!")
		H.visible_message("<span class='warning'>[pick(fluffmessages)]</span>", \
							   "<span class='userdanger'>[pick(fluffmessages)]</span>")
		playsound(get_turf(user), 'sound/effects/woodhit.ogg', 75, 1, -1)
		if(prob(25))
			(INVOKE_ASYNC(src, .proc/jedi_spin, user))
	else
		return ..()

/obj/item/nullrod/tribal_knife
	icon_state = "crysknife"
	item_state = "crysknife"
	name = "arrhythmic knife"
	desc = "They say fear is the true mind killer, but stabbing them in the head works too. Honour compels you to not sheathe it once drawn."
	sharp = 1
	edge = 1
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/nullrod/tribal_knife/process(delta_time)
	slowdown = rand(-2, 2)

/obj/item/nullrod/pitchfork
	icon_state = "pitchfork0"
	name = "unholy pitchfork"
	desc = "Holding this makes you look absolutely devilish."
	attack_verb = list("poked", "impaled", "pierced", "jabbed")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharp = 1

/obj/item/nullrod/egyptian
	name = "egyptian staff"
	desc = "A tutorial in mummification is carved into the staff. You could probably craft the wraps if you had some cloth."
	icon_state = "pharaoh_sceptre"
	item_state = "pharaoh_sceptre"
	attack_verb = list("bashes", "smacks", "whacks")

/obj/item/nullrod/rosary
	icon_state = "rosary"
	item_state = null
	name = "prayer beads"
	desc = "A set of prayer beads used by many of the more traditional religions in space"
	force = 4
	throwforce = 0
	attack_verb = list("whipped", "repented", "lashed", "flagellated")
	drop_sound = 'sound/items/drop/card.ogg'
	pickup_sound = 'sound/items/pickup/card.ogg'
	var/praying = FALSE
	var/deity_name = "Coderbus" //This is the default, hopefully won't actually appear if the religion subsystem is running properly

/obj/item/nullrod/rosary/Initialize(mapload)
	.=..()
	if(GLOB.deity)
		deity_name = GLOB.deity

/obj/item/nullrod/rosary/attack(mob/living/M, mob/living/user)
	if(user.a_intent == INTENT_HARM)
		return ..()

	if(!user.mind || user.mind.assigned_role != "Chaplain")
		to_chat(user, "<span class='notice'>You are not close enough with [deity_name] to use [src].</span>")
		return

	if(praying)
		to_chat(user, "<span class='notice'>You are already using [src].</span>")
		return

	user.visible_message("<span class='info'>[user] kneels[M == user ? null : " next to [M]"] and begins to utter a prayer to [deity_name].</span>", \
		"<span class='info'>You kneel[M == user ? null : " next to [M]"] and begin a prayer to [deity_name].</span>")

	praying = TRUE
	if(do_after(user, 20, target = M))
		M.reagents?.add_reagent(/datum/reagent/water/holywater, 5)
		to_chat(M, "<span class='notice'>[user]'s prayer to [deity_name] has eased your pain!</span>")
		M.adjustToxLoss(-5, TRUE, TRUE)
		M.adjustOxyLoss(-5)
		M.adjustBruteLoss(-5)
		M.adjustFireLoss(-5)
		praying = FALSE
	else
		to_chat(user, "<span class='notice'>Your prayer to [deity_name] was interrupted.</span>")
		praying = FALSE

