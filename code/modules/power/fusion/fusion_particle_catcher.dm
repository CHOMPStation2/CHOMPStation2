/obj/effect/fusion_particle_catcher
	icon = 'icons/effects/effects.dmi'
	density = TRUE
	anchored = TRUE
	invisibility = INVISIBILITY_ABSTRACT
	var/obj/effect/fusion_em_field/parent
	var/mysize = 0

	light_color = COLOR_BLUE

/obj/effect/fusion_particle_catcher/Destroy()
	. =..()
	parent.particle_catchers -= src
	parent = null

/obj/effect/fusion_particle_catcher/proc/SetSize(var/newsize)
	name = "collector [newsize]"
	mysize = newsize
	UpdateSize()

/obj/effect/fusion_particle_catcher/proc/AddParticles(var/name, var/quantity = 1)
	if(parent && parent.size >= mysize)
		parent.AddParticles(name, quantity)
		return 1
	return 0

/obj/effect/fusion_particle_catcher/proc/UpdateSize()
	if(parent.size >= mysize)
		density = TRUE
		name = "collector [mysize] ON"
	else
		density = FALSE
		name = "collector [mysize] OFF"

/obj/effect/fusion_particle_catcher/bullet_act(var/obj/item/projectile/Proj)
	parent.AddEnergy(Proj.damage)
	update_icon()
	return 0

/obj/effect/fusion_particle_catcher/CanPass(atom/movable/mover, turf/target)
	if(istype(mover, /obj/effect/accelerated_particle) || istype(mover, /obj/item/projectile/beam))
		return !density
	return TRUE
