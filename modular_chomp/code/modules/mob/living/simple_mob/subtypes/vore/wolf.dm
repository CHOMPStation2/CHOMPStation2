/mob/living/simple_mob/vore/wolf/direwolf/Initialize(mapload)
	. = ..()
	add_verb(src,/mob/living/simple_mob/proc/pick_color) //CHOMPEdit TGPanel
/* Combat refactor walkback. 100 old
/mob/living/simple_mob/vore/wolf/direwolf
	maxHealth = 50
	health = 50
*/

/mob/living/simple_mob/vore/wolf/direwolf/andrews
	name = "andrewsarchus"
	desc = "That's one massive mean-looking piece of long extinct megafauna."
	tt_desc = "Andrewsarchus mongoliensis"

	icon_dead = "andrews-dead"
	icon_living = "andrews"
	icon_state = "andrews"
	icon_rest = "andrews_rest"

	mount_offset_y = 17
