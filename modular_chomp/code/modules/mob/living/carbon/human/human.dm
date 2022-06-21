/mob/living/carbon/human/update_fullness()
    var/previous_stomach_fullness = vore_fullness_ex["stomach"]
    var/previous_taur_fullness = vore_fullness_ex["taur belly"]
    //update_vore_tail_sprite()
    //update_vore_belly_sprite()
    . = ..()
    if(vore_fullness_ex["stomach"] != previous_stomach_fullness)
        update_vore_belly_sprite()
    if(vore_fullness_ex["taur belly"] != previous_taur_fullness)
        update_vore_tail_sprite()

/mob/living/carbon/human/vs_animate(var/belly_to_animate)
    if(belly_to_animate == "stomach")
        vore_belly_animation()
    else if(belly_to_animate == "taur belly")
        vore_tail_animation()
    else
        return