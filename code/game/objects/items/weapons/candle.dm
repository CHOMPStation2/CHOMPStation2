/obj/item/flame/candle // CHOMPEdit - Removal of obj/item/weapon
	name = "red candle"
	desc = "a red pillar candle. Its specially-formulated fuel-oxidizer wax mixture allows continued combustion in airless environments."
	icon = 'icons/obj/candle.dmi'
	icon_state = "candle1"
	drop_sound = 'sound/items/drop/gloves.ogg'
	pickup_sound = 'sound/items/pickup/gloves.ogg'
	w_class = ITEMSIZE_TINY
	light_color = "#E09D37"
	var/wax = 2000
	var/icon_type = "candle"

/obj/item/flame/candle/New() // CHOMPEdit - Removal of obj/item/weapon
	wax -= rand(800, 1000) // Enough for 27-33 minutes. 30 minutes on average.
	..()

/obj/item/flame/candle/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	var/i
	if(wax > 1500)
		i = 1
	else if(wax > 800)
		i = 2
	else i = 3
	icon_state = "[icon_type][i][lit ? "_lit" : ""]"


/obj/item/flame/candle/attackby(obj/item/W as obj, mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	..()
	if(W.has_tool_quality(TOOL_WELDER))
		var/obj/item/weldingtool/WT = W.get_welder() // CHOMPEdit - Removal of obj/item/weapon
		if(WT.isOn()) //Badasses dont get blinded by lighting their candle with a welding tool
			light("<span class='notice'>\The [user] casually lights the [src] with [W].</span>")
	else if(istype(W, /obj/item/flame/lighter)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/flame/lighter/L = W // CHOMPEdit - Removal of obj/item/weapon
		if(L.lit)
			light()
	else if(istype(W, /obj/item/flame/match)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/flame/match/M = W // CHOMPEdit - Removal of obj/item/weapon
		if(M.lit)
			light()
	else if(istype(W, /obj/item/flame/candle)) // CHOMPEdit - Removal of obj/item/weapon
		var/obj/item/flame/candle/C = W // CHOMPEdit - Removal of obj/item/weapon
		if(C.lit)
			light()


/obj/item/flame/candle/proc/light(var/flavor_text = "<span class='notice'>\The [usr] lights the [src].</span>") // CHOMPEdit - Removal of obj/item/weapon
	if(!lit)
		lit = TRUE
		visible_message(flavor_text)
		set_light(CANDLE_LUM)
		START_PROCESSING(SSobj, src)

/obj/item/flame/candle/process() // CHOMPEdit - Removal of obj/item/weapon
	if(!lit)
		return
	wax--
	if(!wax)
		new/obj/item/trash/candle(src.loc)
		if(istype(src.loc, /mob))
			src.dropped()
		qdel(src)
	update_icon()
	if(istype(loc, /turf)) //start a fire if possible
		var/turf/T = loc
		T.hotspot_expose(700, 5)

/obj/item/flame/candle/attack_self(mob/user as mob) // CHOMPEdit - Removal of obj/item/weapon
	if(lit)
		lit = 0
		update_icon()
		set_light(0)

/obj/item/flame/candle/small // CHOMPEdit - Removal of obj/item/weapon
	name = "small red candle"
	desc = "a small red candle, for more intimate candle occasions."
	icon = 'icons/obj/candle.dmi'
	icon_state = "smallcandle"
	icon_type = "smallcandle"
	w_class = ITEMSIZE_SMALL

/obj/item/flame/candle/white // CHOMPEdit - Removal of obj/item/weapon
	name = "white candle"
	desc = "a white pillar candle. Its specially-formulated fuel-oxidizer wax mixture allows continued combustion in airless environments."
	icon = 'icons/obj/candle.dmi'
	icon_state = "whitecandle"
	icon_type = "whitecandle"
	w_class = ITEMSIZE_SMALL

/obj/item/flame/candle/black // CHOMPEdit - Removal of obj/item/weapon
	name = "black candle"
	desc = "a black pillar candle. Ominous."
	icon = 'icons/obj/candle.dmi'
	icon_state = "blackcandle"
	icon_type = "blackcandle"
	w_class = ITEMSIZE_SMALL

/obj/item/flame/candle/candelabra // CHOMPEdit - Removal of obj/item/weapon
	name = "candelabra"
	desc = "a small gold candelabra. The cups that hold the candles save some of the wax from dripping off, allowing the candles to burn longer."
	icon = 'icons/obj/candle.dmi'
	icon_state = "candelabra"
	w_class = ITEMSIZE_SMALL
	wax = 20000

/obj/item/flame/candle/candelabra/update_icon() // CHOMPEdit - Removal of obj/item/weapon
	if(wax == 0)
		icon_state = "candelabra_melted"
	else
		icon_state = "candelabra[lit ? "_lit" : ""]"

/obj/item/flame/candle/everburn // CHOMPEdit - Removal of obj/item/weapon
	wax = 99999

/obj/item/flame/candle/everburn/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	light("<span class='notice'>\The [src] mysteriously lights itself!.</span>")

/obj/item/flame/candle/candelabra/everburn // CHOMPEdit - Removal of obj/item/weapon
	wax = 99999

/obj/item/flame/candle/candelabra/everburn/Initialize() // CHOMPEdit - Removal of obj/item/weapon
	. = ..()
	light("<span class='notice'>\The [src] mysteriously lights itself!.</span>")
