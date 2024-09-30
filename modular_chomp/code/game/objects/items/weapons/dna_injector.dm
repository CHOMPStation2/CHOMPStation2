//Same as regular injector, but without the radiation
//Using for events, set the block to the desired gene
//Note, genetics code is incredibly scuffed, sometimes blocks just won't activate unless you do it multiple times????
/obj/item/dnainjector/safe
	desc = "A slightly safer DNA injector"
	datatype = DNA2_BUF_SE
	value = 0xFFF

/obj/item/dnainjector/safe/New(var/block_type)
	block = block_type
	..()

/obj/item/dnainjector/safe/inject(mob/M as mob, mob/user as mob)
	/*
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
	*/
	M.dna.SetSEState(block,1)
	domutcheck(M,null,MUTCHK_FORCED)
	M.update_mutations()

	spawn(0)//this prevents the collapse of space-time continuum
		if (user)
			user.drop_from_inventory(src)
		qdel(src)
	return uses