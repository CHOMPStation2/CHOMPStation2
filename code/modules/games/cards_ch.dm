/datum/playingcard/casino
	name = "playing card"
	card_icon = "card_back"
	back_icon = "card_back"

/obj/item/deck/casino
	w_class = ITEMSIZE_SMALL
	icon = 'icons/obj/playing_cards_ch.dmi'
	cooldown = 0 // to prevent spam shuffle

/obj/item/deck/holder/casino //WIP In future do a cool holder
	name = "card box"
	desc = "A small leather case to show how classy you are compared to everyone else."
	icon = 'icons/obj/playing_cards_ch.dmi'
	icon_state = "card_holder"

/obj/item/deck/cards/casino
	name = "deck of casino cards"
	desc = "A deck of playing cards from the golden goose casino, comes without a joker card!"
	icon = 'icons/obj/playing_cards_ch.dmi'
	icon_state = "casino_deck"

/obj/item/deck/cards/casino/New()
	var/datum/playingcard/casino/P
	for(var/suit in list("spades","clubs","diamonds","hearts"))

		var/colour
		if(suit == "spades" || suit == "clubs")
			colour = "black_"
		else
			colour = "red_"

		for(var/number in list("ace","two","three","four","five","six","seven","eight","nine","ten"))
			P = new()
			P.name = "[number] of [suit]"
			P.card_icon = "casino_[colour]num"
			P.back_icon = "casino_card_back"
			cards += P

		for(var/number in list("jack","queen","king"))
			P = new()
			P.name = "[number] of [suit]"
			P.card_icon = "casino_[colour]col"
			P.back_icon = "casino_card_back"
			cards += P
