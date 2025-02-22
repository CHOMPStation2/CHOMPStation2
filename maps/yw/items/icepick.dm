//Ice pick, mountain axe, or ice axe.YW Creation.
/obj/item/ice_pick
	name = "ice axe"
	desc = "A sharp tool for climbers and hikers to break up ice and keep themselves from slipping on a steep slope."
	icon = 'icons/obj/items_yw.dmi'
	icon_state = "icepick"
	item_state = "icepick"
	matter = list(DEFAULT_WALL_MATERIAL = 12000) //Same as a knife
	force = 15 //increasing force for icepick/axe, cause it's a freaking iceaxe.
	throwforce = 0