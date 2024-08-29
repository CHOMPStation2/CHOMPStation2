/obj/item/dnainjector // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector"
	desc = "This injects the person with DNA."
	icon = 'icons/obj/items.dmi'
	icon_state = "dnainjector"
	var/block=0
	var/datum/dna2/record/buf=null
	var/s_time = 10.0
	throw_speed = 1
	throw_range = 5
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_EARS
	var/uses = 1
	var/nofail
	var/is_bullet = 0
	var/inuse = 0

	// USE ONLY IN PREMADE SYRINGES.  WILL NOT WORK OTHERWISE.
	var/datatype=0
	var/value=0

/obj/item/dnainjector/New() // CHOMPEdit - Removal of obj/item/weapon
	if(datatype && block)
		buf=new
		buf.dna=new
		buf.types = datatype
		buf.dna.ResetSE()
		//testing("[name]: DNA2 SE blocks prior to SetValue: [english_list(buf.dna.SE)]")
		SetValue(src.value)
		//testing("[name]: DNA2 SE blocks after SetValue: [english_list(buf.dna.SE)]")

/obj/item/dnainjector/proc/GetRealBlock(var/selblock) // CHOMPEdit - Removal of obj/item/weapon
	if(selblock==0)
		return block
	else
		return selblock

/obj/item/dnainjector/proc/GetState(var/selblock=0) // CHOMPEdit - Removal of obj/item/weapon
	var/real_block=GetRealBlock(selblock)
	if(buf.types&DNA2_BUF_SE)
		return buf.dna.GetSEState(real_block)
	else
		return buf.dna.GetUIState(real_block)

/obj/item/dnainjector/proc/SetState(var/on, var/selblock=0) // CHOMPEdit - Removal of obj/item/weapon
	var/real_block=GetRealBlock(selblock)
	if(buf.types&DNA2_BUF_SE)
		return buf.dna.SetSEState(real_block,on)
	else
		return buf.dna.SetUIState(real_block,on)

/obj/item/dnainjector/proc/GetValue(var/selblock=0) // CHOMPEdit - Removal of obj/item/weapon
	var/real_block=GetRealBlock(selblock)
	if(buf.types&DNA2_BUF_SE)
		return buf.dna.GetSEValue(real_block)
	else
		return buf.dna.GetUIValue(real_block)

/obj/item/dnainjector/proc/SetValue(var/val,var/selblock=0) // CHOMPEdit - Removal of obj/item/weapon
	var/real_block=GetRealBlock(selblock)
	if(buf.types&DNA2_BUF_SE)
		return buf.dna.SetSEValue(real_block,val)
	else
		return buf.dna.SetUIValue(real_block,val)

/obj/item/dnainjector/proc/inject(mob/M as mob, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(istype(M,/mob/living))
		var/mob/living/L = M
		L.apply_effect(rand(5,20), IRRADIATE, check_protection = 0)
		L.apply_damage(max(2,L.getCloneLoss()), CLONE)

	if (!(NOCLONE in M.mutations)) // prevents drained people from having their DNA changed
		if (buf.types & DNA2_BUF_UI)
			if (!block) //isolated block?
				M.UpdateAppearance(buf.dna.UI.Copy())
				if (buf.types & DNA2_BUF_UE) //unique enzymes? yes
					M.real_name = buf.dna.real_name
					M.name = buf.dna.real_name
				uses--
			else
				M.dna.SetUIValue(block,src.GetValue())
				M.UpdateAppearance()
				uses--
		if (buf.types & DNA2_BUF_SE)
			if (!block) //isolated block?
				M.dna.SE = buf.dna.SE.Copy()
				M.dna.UpdateSE()
			else
				M.dna.SetSEValue(block,src.GetValue())
			domutcheck(M, null, block!=null)
			uses--
			if(prob(5))
				trigger_side_effect(M)

	spawn(0)//this prevents the collapse of space-time continuum
		if (user)
			user.drop_from_inventory(src)
		qdel(src)
	return uses

/obj/item/dnainjector/attack(mob/M as mob, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if (!istype(M, /mob))
		return
	if (!usr.IsAdvancedToolUser())
		return
	if(inuse)
		return 0

	user.visible_message("<span class='danger'>\The [user] is trying to inject \the [M] with \the [src]!</span>")
	inuse = 1
	s_time = world.time
	spawn(50)
		inuse = 0

	if(!do_after(user,50))
		return

	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	user.do_attack_animation(M)

	M.visible_message("<span class='danger'>\The [M] has been injected with \the [src] by \the [user].</span>")

	var/mob/living/carbon/human/H = M
	if(!istype(H))
		to_chat(user, "<span class='warning'>Apparently it didn't work...</span>")
		return

	// Used by admin log.
	var/injected_with_monkey = ""
	if((buf.types & DNA2_BUF_SE) && (block ? (GetState() && block == MONKEYBLOCK) : GetState(MONKEYBLOCK)))
		injected_with_monkey = " <span class='danger'>(MONKEY)</span>"

	add_attack_logs(user,M,"[injected_with_monkey] used the [name] on")

	// Apply the DNA shit.
	inject(M, user)
	return

/obj/item/dnainjector/hulkmut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Hulk)"
	desc = "This will make you big and strong, but give you a bad skin condition."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/hulkmut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = HULKBLOCK
	..()

/obj/item/dnainjector/antihulk // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Hulk)"
	desc = "Cures green skin."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antihulk/New() // CHOMPEdit - Removal of obj/item/weapon
	block = HULKBLOCK
	..()

/obj/item/dnainjector/xraymut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Xray)"
	desc = "Finally you can see what the Site Manager does."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/xraymut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = XRAYBLOCK
	..()

/obj/item/dnainjector/antixray // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Xray)"
	desc = "It will make you see harder."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antixray/New() // CHOMPEdit - Removal of obj/item/weapon
	block = XRAYBLOCK
	..()

/obj/item/dnainjector/firemut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Fire)"
	desc = "Gives you fire."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/firemut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = FIREBLOCK
	..()

/obj/item/dnainjector/antifire // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Fire)"
	desc = "Cures fire."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antifire/New() // CHOMPEdit - Removal of obj/item/weapon
	block = FIREBLOCK
	..()

/obj/item/dnainjector/telemut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Tele.)"
	desc = "Super brain man!"
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/telemut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = TELEBLOCK
	..()

/obj/item/dnainjector/antitele // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Tele.)"
	desc = "Will make you not able to control your mind."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antitele/New() // CHOMPEdit - Removal of obj/item/weapon
	block = TELEBLOCK
	..()

/obj/item/dnainjector/nobreath // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (No Breath)"
	desc = "Hold your breath and count to infinity."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/nobreath/New() // CHOMPEdit - Removal of obj/item/weapon
	block = NOBREATHBLOCK
	..()

/obj/item/dnainjector/antinobreath // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-No Breath)"
	desc = "Hold your breath and count to 100."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antinobreath/New() // CHOMPEdit - Removal of obj/item/weapon
	block = NOBREATHBLOCK
	..()

/obj/item/dnainjector/remoteview // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Remote View)"
	desc = "Stare into the distance for a reason."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/remoteview/New() // CHOMPEdit - Removal of obj/item/weapon
	block = REMOTEVIEWBLOCK
	..()

/obj/item/dnainjector/antiremoteview // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Remote View)"
	desc = "Cures green skin."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antiremoteview/New() // CHOMPEdit - Removal of obj/item/weapon
	block = REMOTEVIEWBLOCK
	..()

/obj/item/dnainjector/regenerate // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Regeneration)"
	desc = "Healthy but hungry."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/regenerate/New() // CHOMPEdit - Removal of obj/item/weapon
	block = REGENERATEBLOCK
	..()

/obj/item/dnainjector/antiregenerate // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Regeneration)"
	desc = "Sickly but sated."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antiregenerate/New() // CHOMPEdit - Removal of obj/item/weapon
	block = REGENERATEBLOCK
	..()

/obj/item/dnainjector/runfast // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Increase Run)"
	desc = "Running Man."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/runfast/New() // CHOMPEdit - Removal of obj/item/weapon
	block = INCREASERUNBLOCK
	..()

/obj/item/dnainjector/antirunfast // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Increase Run)"
	desc = "Walking Man."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antirunfast/New() // CHOMPEdit - Removal of obj/item/weapon
	block = INCREASERUNBLOCK
	..()

/obj/item/dnainjector/morph // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Morph)"
	desc = "A total makeover."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/morph/New() // CHOMPEdit - Removal of obj/item/weapon
	block = MORPHBLOCK
	..()

/obj/item/dnainjector/antimorph // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Morph)"
	desc = "Cures identity crisis."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antimorph/New() // CHOMPEdit - Removal of obj/item/weapon
	block = MORPHBLOCK
	..()

/obj/item/dnainjector/noprints // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (No Prints)"
	desc = "Better than a pair of budget insulated gloves."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/noprints/New() // CHOMPEdit - Removal of obj/item/weapon
	block = NOPRINTSBLOCK
	..()

/obj/item/dnainjector/antinoprints // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-No Prints)"
	desc = "Not quite as good as a pair of budget insulated gloves."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antinoprints/New() // CHOMPEdit - Removal of obj/item/weapon
	block = NOPRINTSBLOCK
	..()

/obj/item/dnainjector/insulation // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Shock Immunity)"
	desc = "Better than a pair of real insulated gloves."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/insulation/New() // CHOMPEdit - Removal of obj/item/weapon
	block = SHOCKIMMUNITYBLOCK
	..()

/obj/item/dnainjector/antiinsulation // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Shock Immunity)"
	desc = "Not quite as good as a pair of real insulated gloves."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antiinsulation/New() // CHOMPEdit - Removal of obj/item/weapon
	block = SHOCKIMMUNITYBLOCK
	..()

/obj/item/dnainjector/midgit // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Small Size)"
	desc = "Makes you shrink."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/midgit/New() // CHOMPEdit - Removal of obj/item/weapon
	block = SMALLSIZEBLOCK
	..()

/obj/item/dnainjector/antimidgit // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Small Size)"
	desc = "Makes you grow. But not too much."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antimidgit/New() // CHOMPEdit - Removal of obj/item/weapon
	block = SMALLSIZEBLOCK
	..()

/////////////////////////////////////
/obj/item/dnainjector/antiglasses // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Glasses)"
	desc = "Toss away those glasses!"
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antiglasses/New() // CHOMPEdit - Removal of obj/item/weapon
	block = GLASSESBLOCK
	..()

/obj/item/dnainjector/glassesmut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Glasses)"
	desc = "Will make you need dorkish glasses."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/glassesmut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = GLASSESBLOCK
	..()

/obj/item/dnainjector/epimut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Epi.)"
	desc = "Shake shake shake the room!"
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/epimut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = HEADACHEBLOCK
	..()

/obj/item/dnainjector/antiepi // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Epi.)"
	desc = "Will fix you up from shaking the room."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antiepi/New() // CHOMPEdit - Removal of obj/item/weapon
	block = HEADACHEBLOCK
	..()

/obj/item/dnainjector/anticough // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Cough)"
	desc = "Will stop that awful noise."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/anticough/New() // CHOMPEdit - Removal of obj/item/weapon
	block = COUGHBLOCK
	..()

/obj/item/dnainjector/coughmut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Cough)"
	desc = "Will bring forth a sound of horror from your throat."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/coughmut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = COUGHBLOCK
	..()

/obj/item/dnainjector/clumsymut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Clumsy)"
	desc = "Makes clumsy minions."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/clumsymut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = CLUMSYBLOCK
	..()

/obj/item/dnainjector/anticlumsy // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Clumy)"
	desc = "Cleans up confusion."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/anticlumsy/New() // CHOMPEdit - Removal of obj/item/weapon
	block = CLUMSYBLOCK
	..()

/obj/item/dnainjector/antitour // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Tour.)"
	desc = "Will cure tourrets."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antitour/New() // CHOMPEdit - Removal of obj/item/weapon
	block = TWITCHBLOCK
	..()

/obj/item/dnainjector/tourmut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Tour.)"
	desc = "Gives you a nasty case off tourrets."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/tourmut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = TWITCHBLOCK
	..()

/obj/item/dnainjector/stuttmut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Stutt.)"
	desc = "Makes you s-s-stuttterrr"
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/stuttmut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = NERVOUSBLOCK
	..()

/obj/item/dnainjector/antistutt // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Stutt.)"
	desc = "Fixes that speaking impairment."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antistutt/New() // CHOMPEdit - Removal of obj/item/weapon
	block = NERVOUSBLOCK
	..()

/obj/item/dnainjector/blindmut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Blind)"
	desc = "Makes you not see anything."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/blindmut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = BLINDBLOCK
	..()

/obj/item/dnainjector/antiblind // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Blind)"
	desc = "ITS A MIRACLE!!!"
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antiblind/New() // CHOMPEdit - Removal of obj/item/weapon
	block = BLINDBLOCK
	..()

/obj/item/dnainjector/deafmut // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Deaf)"
	desc = "Sorry, what did you say?"
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/deafmut/New() // CHOMPEdit - Removal of obj/item/weapon
	block = DEAFBLOCK
	..()

/obj/item/dnainjector/antideaf // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Deaf)"
	desc = "Will make you hear once more."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antideaf/New() // CHOMPEdit - Removal of obj/item/weapon
	block = DEAFBLOCK
	..()

/obj/item/dnainjector/hallucination // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Halluctination)"
	desc = "What you see isn't always what you get."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/hallucination/New() // CHOMPEdit - Removal of obj/item/weapon
	block = HALLUCINATIONBLOCK
	..()

/obj/item/dnainjector/antihallucination // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Anti-Hallucination)"
	desc = "What you see is what you get."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/antihallucination/New() // CHOMPEdit - Removal of obj/item/weapon
	block = HALLUCINATIONBLOCK
	..()

/obj/item/dnainjector/h2m // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Human > Monkey)"
	desc = "Will make you a flea bag."
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/h2m/New() // CHOMPEdit - Removal of obj/item/weapon
	block = MONKEYBLOCK
	..()

/obj/item/dnainjector/m2h // CHOMPEdit - Removal of obj/item/weapon
	name = "\improper DNA injector (Monkey > Human)"
	desc = "Will make you...less hairy."
	datatype = DNA2_BUF_SE
	value = 0x001

/obj/item/dnainjector/m2h/New() // CHOMPEdit - Removal of obj/item/weapon
	block = MONKEYBLOCK
	..()
