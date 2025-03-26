/obj/item/book/codex/casino
	name = "A Dummy Guide To Losing Your Thalers"
	desc = "A pristine book with the detailed and golden framed card on the front of the leather covers. \ It's written by an an author you have never heard of before, 'Sleazy Serpent Saren' does sound pretty trustworthy!"
	icon = 'icons/obj/casino_ch.dmi'
	icon_state = "casinomanual"
	item_state = "casinomanual"
	unique = TRUE
	w_class = 2 // To allow it to be stuffed away into wallets for easy readings during events
	root_type = /datum/lore/codex/category/casinomanual
	libcategory = "Reference"

/datum/lore/codex/category/casinomanual
	name = "Foreword"
	data = "It's not about winning, it's about having fun!\
	<br><br>\
	In this book I'll teach you all about how to gamble your money away or at least get lucky and win some at The Golden Space Goose!\
	This book also has a handy little overview of the prizes one can earn and the limitations of what can do with the living and breathing ones.\
	(This book will also contain out of character information to help people be aware of how touchy subjects like sentient prizes are to be handled."

	children = list(
		/datum/lore/codex/category/casinomanual_games,
		/datum/lore/codex/category/casinomanual_casinoactivites,
		/datum/lore/codex/category/casinomanual_prizes,
		/datum/lore/codex/page/casinomanual_sentientprizes
		)

		//datum/lore/codex/page/casinomanual_history
		//datum/lore/codex/page/casinomanual_managementguide

/datum/lore/codex/page/casinomanual_history/add_content()
	name = "Golden Space Goose History"
	keywords += list("Casino History")
	data = "WIP"

/datum/lore/codex/category/casinomanual_games
	name = "Casino Games"
	data = "Currently the Golden Space Goose offers Blackjack, Poker and Roulette for crew aside from the other more sociable and non-gambling activities.\
	The information presented in these topics sets the standards of rules for a default game as well as help you get an idea of how the games work.\
	Individual dealers can decide to alter the rules at their table but are required to inform all players of the non-default conditions."

	children = list(
		/datum/lore/codex/page/casinomanual_blackjack,
		/datum/lore/codex/page/casinomanual_poker,
		/datum/lore/codex/page/casinomanual_roulette
		)

/datum/lore/codex/page/casinomanual_blackjack/add_content()
	name = "Blackjack"
	keywords += list("Gambling", "Blackjack", "Games")
	data = "First up is the classic sport of blackjack, blackjack is played normally between a gambler and a dealer, the goal is to have the higher number than the opponent but not go above 21 or it will be a bust and one loses automatically.<br>\
			The values of cards are as follow:<br>\
			Ace - 1 or 11, can be freely decided at any moment<br>\
			2 - 10 - value coresponding to their number<br>\
			All face cards excluding joker - Value of 10<br><br>\
			A game of blackjack begins with the dealer giving the gambler two cards, in normal blackjack all cards dealt to gambler and dealer are always shown. The two cards dealt have their values put together, the gambler has three choices, stand, hit, or double down.<br><br>\
			Stand - Gambler or dealer decides not to draw any more cards and it becomes the dealers turn or ends.<br>\
			Hit - 10 - The dealer draws a new card, adding to the existing hand, if its a bust the game will end and they will lose.<br>\
			Double down - A risky move the gambler can do, the dealer draws one more card and the bet is doubled, but no more cards can be drawn and it becomes the dealer's turn.<br><br>\
			When it becomes the dealer's turn they do the same as the gambler, though their only goal is to get a higher or equal value to gambler.<br>\
			The dealer cant double down, and the large majority of casino's has the rule that a dealer cant draw anymore cards once they reach or go above a value. The most common value is 17, and there are two variants to that rule, soft and hard 17.<br>\
			Soft 17 - If the gambler gets 17 or above, they can draw another card unless they value has been reached by an ace counting as 11.<br>\
			Hard 17 - They dealer must stop if they get a value of 17. No matter what value ace represents.<br><br>\
			The casino who supplies this version of the manual follows the rule of hard 17 as well as revealing the first card the dealer gets before the gambler can begin hit, stand and doubling down.<br>\
			The game ends when the gambler or dealer busts, dealer reaches the threshold of what they are allowed to draw, or if they get a higher value than the gambler.<br>\
			Again, the one who has the highest value that isnt higher than 21 wins, but if both has the same value no one wins and the bet goes back to the gambler.<br>\
			And thats it! Now go out there and gamble your savings away! This casino allows bets between 10 and 100 by default with individual dealer free to decide highher betting roof."

/datum/lore/codex/page/casinomanual_poker/add_content()
	name = "Poker"
	keywords += list("Gambling", "Poker", "Games")
	data = "Aaah yes, good old poker. This casino runs by the rules of texas hold em, though the might be a little modified to be simpler for the average joe. In a game of poker it can be a single gambler and a dealer against each other,<br>\
			but most often its the dealer making the game proceed while several gamblers fights tooth and nail to steal each others chips, but the dealer can still join in on the free for all if they so wish!<br>\
			To simply explain the game, people gamble with each other, a game of trying to get the best hand and raise bets or back out depending on what the outcome may be. The game starts with everyone betting a certain amount,<br>\
			it can be 5 to 50 chips depending on dealer, but if one wants to join, there needs to be chips on that table! Once everyone has made their initial bet, everyone gets two cards face down, these are kept hidden, <br>\
			no one not even dealer gets to see players cards until the end, not even folded cards are to be shown unless wanted to, sometimes its better making people unsure if you dropped out with bad cards or if you have other motives, deception is a large part of this game!<br>\
			With everyone having cards dealt, its time for the dealer to lay three on the table face up, these cards are 3 of 5 cards in the community pool, everyone can use these cards to make sets like pairs and such,<br>\
			this doesnt mean they are taken, multiple people can use the same community card for their own sets!<br><br>\
			With the community having three we enter the second betting stage, here people have two options, standing or raising. Standing means you dont want to raise, raising explains itself, though if someone bets, people have three options,<br>\
			commit putting the chips in to risk as much as the raised bet, but if one doesnt have enough, then they can still go all in with their remaining chips, one can also drop out if its too risky, the chips bet will remain on the table, but at least you wont lose more eh?<br>\
			Final one is to raise further, sometimes people can dare each other to raise more, but its not allowed for someone to raise, then raise further if no one else raises after them!<br>\
			As said earlier, we got like a community pool of 5 cards total, this time another card is revealed and we enter a new betting phase, then the final fifth card is revealed and final bets are made, and then the cards are revealed so it can be determined who has the best hand!<br>\
			If two or more have equally good sets, then the chips are split evenly between them. But notice, if someone is left because everyone else didnt dare to raise with their bet, they can decide to not reveal their hand,<br>\
			they might have had a winning hand, or maybe its terrible and they just bluffed their way to victory, only they know and can decide if they want to expose their cards to gloat or confuse their opponents. So in summary, the game can be simple, but hard to master!<br>\
			And here is the order of winning hands folks!<br><br>\
			Royal flush - The big and best one, this is a set of a 10, Ace, Knave/Jack, Queen and King of the same suit.<br>\
			Straight flush - This one is also definently a winner, though can be easier to get as it just needs to be five cards making a sraight of the same suit, an example being black 3 to 7.<br>\
			Four of a kind - Nice one, if you get this then you got a good chance to win. The value of the cards determine who wins, so ace is the best followed by king, queen and jack, then the peasant number cards!<br>\
			Full House - This one is good, but it requires you have three of a kind and a two of a kind, obviously value is part of the house, so the best roof is made of Ace with king making a strong foundation!<br>\
			Flush - This one requires the gambler to have 5 cards of a suit, not in any order, but the highest value card determines worth, so hope you got an Ace in your combo!<br>\
			Straight - Its like the royal flush, but can be any suits in combo, Ace can be lowest from Ace to 5 or highest from 10 to Ace!<br>\
			Three of a kind - Explains itself well enough, get three together and you got something going, lets hope you can build a house!<br>\
			Two pairs - You almost got yourself a house! But at least at this point its something!<br>\
			A pair - The worst set you can get, but you might be extremely lucky and have this while others have an inferior pair or the worst possible hand ever which is...<br>\
			High card - The absolute worst, if you cant get any of those sets, then you got this sad case, if a game mananages to end with no one getting a set, then the one with the highest value cards wins<br><br>\
			Wew, what a long lesson, but thats how one does the Texas hold em here at this casino, hope you guys have fun winning and losing your hard earned cash with this one!"

/datum/lore/codex/page/casinomanual_roulette/add_content()
	name = "Roulette"
	keywords += list("Gambling", "Roulette", "Games")
	data = "So this game of roulette is all about chance! what happens is that people bet on different odds and hope for the best as the dealer rolls the ball and makes that roulette thingy make than fun addicting spin!<br>\
			Once it lands on a number between 0 and 36 its either bust or payout! Pretty simple, right?<br>\
			Everyone starts by putting their bets down, people can bet more than once before the ball goes rolling, the odds and their payoffs are these:<br><br>\
			Single number - 35/1 payoff - The most unlikely one to get, but if the ball lands on your number, then youre loaded!<br>\
			Split Number - 17/1 - Choose an interval of 2, not very likely and therefore big reward!<br>\
			Row - 11/1 - Choose an interval of 3, more likely so not the biggest outcome!<br>\
			Split - 8/1 - Choose an interval of 4, not gonna win big time.<br>\
			Split row - 5/1 - Choose an interval of 6, getting to the safer bets.<br>\
			Column - 2/1 - Choose an interval of 12, boring, but likely.<br>\
			Red/Black - 1/1 - Red are odd numbers while black are even, simple stuff. These are the safest bets there are!<br><br>\
			Theres not much more to it! Bets made, ball rolls, number announced, people win, people lose! Bets allowed here are from 5 to 50 per bet.<br>\
			Oh, im also being told this casino has the fancy rule that if ball lands on 0, one wins at least one bet no matter what it is! So lets hope you got that big bet on a single number!"

/datum/lore/codex/category/casinomanual_casinoactivites
	name = "Social Casino Games"
	data = "While the Golden Space Goose constantly moves and visits new places, it also arranges activities if it lands somewhere on the surface of planets.\
	Some crew might be down on their luck or prefering obtaining chips in a manner that doesn't take from others or gamble their current funds.\
	As explained in the history of the casino, crew have socially strengthening and teambuilding activities to gain chips by the generous and benevolent funding from NanoTransen.\
	So far the casino always offer to endorse Cards Against The Galaxy and toy Mech battles with crews participating and winning gaining chips risk free and having a laugh with fellow crew!"

	children = list(
		/datum/lore/codex/page/casinomanual_cog,
		/datum/lore/codex/page/casinomanual_mechbattle
		)

/datum/lore/codex/page/casinomanual_cog/add_content()
	name = "Cards Against The Galaxy"
	keywords += list("Social", "Cards Against The Galaxy", "Games")
	data = "The idea with Cards Against The Galaxy is that 3 or more players, preferably 4 to 5 players sits with 7 white cards on their hands with random words on them.<br>\
	One player each round is the 'Card Czar' and draws a black card with a question or phrase, there are one or more blank lines and each player draws cards and lays out secretly for the Czar to read.<br>\
	The Czar reads them and chooses the combination of the black and white cards that they like best, and the player who put those cards down wins the round and the black card as a point.<br><br>\
	It's a simple and fun game, far more focused on crew having fun and a good laugh together. Best part is that if a casino staffmember verifies you all played a round, everyone gets 25 chips with the winner of the round getting an additional 25!"

/datum/lore/codex/page/casinomanual_mechbattle/add_content()	//WIP, in future events set up proper mech toy fighting if feature isnt broken
	name = "Mech Battle Showdown"
	keywords += list("Gambling", "Mech toys", "Games")
	data = "At the current date The Golden Space Goose isn't officially hosting toy mech showdowns where crew fights each other with their toy mechs, with winner gaining more chips than loser if a casino crewmember is around to verify a proper fight. Please visit both to see if there is informational documents about mech showdowns being hosted or not."

/datum/lore/codex/category/casinomanual_prizes
	name = "Prizes"
	data = "Hey folks, welcome to the prize section! First off I wanna tell you some great news! Nanotransen has gone along with a nice deal that allows crew to occasionally keep their hard earned rewards on station for a limited time,<br>\
	now you can enjoy your new fancy toolbelt or bluespace beaker for more than just the shift where the casino comes around!<br>\
	(Be aware, there can be limitations on how many rewards you get to keep after the shift, it might be unfair if some shows up and wins one thing, while they watch as command staff crew with high background income as well as hyperactive miners walks home with 20 prizes they get to enjoy while having almost done no gambling at all.))<br><br>\
	Lets get to the prizes and exchange rate before we get started on the stuff specifically for the booth operators, so heres the current prizes one can win and their costs! Be aware there might be new prizes or absent ones from time to time!<br>\

	EXCHANGE RATE<br>\
	FROM	=	TO<br>\
	5 Thalers = 1 casino chip<br>\
	1 casino chip = 2.5 Thalers (rounded down)"

	children = list(
		/datum/lore/codex/page/casinomanual_weapons,
		/datum/lore/codex/page/casinomanual_gear,
		/datum/lore/codex/page/casinomanual_clothing,
		/datum/lore/codex/page/casinomanual_miscellaneous,
		/datum/lore/codex/page/casinomanual_drinks,
		/datum/lore/codex/page/casinomanual_pets,
		/datum/lore/codex/page/casinomanual_mechs,
		/datum/lore/codex/page/casinomanual_implants
		)

/datum/lore/codex/page/casinomanual_weapons/add_content()
	name = "Prizes: Weapons"
	keywords += list("Prizes", "Weapons")
	data = "(disclaimer, giving out guns will mean you get a weapons license as well with the shifts you have it, abusing these weapons will quickly get them removed!)\
	<br><br> Scepter	500 <br>Chain of command 250 <br>Sizegun 100 <br>Advanced anti particle rifle 500 <br>Temperature gun 250 <br>Alien pistol 1000 <br>Floral somatoray 250 <br>Net gun 500"

/datum/lore/codex/page/casinomanual_gear/add_content()
	name = "Prizes: Gear"
	keywords += list("Prizes", "Gear")
	data = "experimental welder 500 <br>alien belt 750 <br>alien enhancement vest 750 <br>The monocoole 1000 <br>Chameleon black tie 250 <br>Cryostasis beaker 200 <br>Bluespace beaker 200 <br>Chem sprayer 250"

/datum/lore/codex/page/casinomanual_clothing/add_content()
	name = "Prizes: Clothing"
	keywords += list("Prizes", "Clothing")
	data = "Masks and hats - All masks and hats are 50 except chameleon!<br>\
		Costumes - All costumes are 100 except the hoodies which are 50!<br><br>\
		Assistant hat <br>Shark mask <br>Pig mask <br>Luchador mask <br>Horse mask <br>Goblin mask <br>Fake moustache <br>Dolphin mask <br>Demon mask <br>Chameleon gas mask 250\
		<br><br>Black bunny girl outfit (black suit and rabbit ears) <br>White bunny girl outfit (white suit and rabbit ears) <br>Corgi hoodie <br>Sexy clown <br>Nyan girl <br>Wizard <br>Chicken\
		<br>Carp hoodie <br>Sexy mime <br>Pirate <br>Commie <br>Plague doctor <br>Imperium monk <br>Cute witch <br>Gladiator"


/datum/lore/codex/page/casinomanual_miscellaneous/add_content()
	name = "Prizes: Miscellaneous"
	keywords += list("Prizes", "Miscellaneous")
	data = "Toys and misc - Everything that isn't instruments are 50, instruments are 100 with few excecptions!<br><br>\
		Toy sword <br>Water flower <br>Stick horse <br>Replica katana <br>Magic conch <br>Magic 8-ball <br>Foam sword <br>Foam crossbow (with 5 bolts) <br>Bosun's whistle <br>Golden cup\
		<br>Havana cigar case <br>Casino wallet (to keep after shift) <br>Casino card deck (to keep after shift) <br>Casino Sentient Prize Collar (to keep after shift)<br>\
		Accordion<br>Banjo<br>Musical Bikehorn<br>Electric Guitar<br>Glockenspiel<br>Guitar<br>Harmonica<br>Keytar<br>Musical Moth (Illegal in multiple systems for obvious reasons.. You monster..)<br>\
		Synthethic Piano<br>Recorder<br>Saxophone<br>Haunted Saxophone 200<br>Trombone<br>Haunted Trombone 200<br>Trumpet<br>Haunted Trumpet 200<br>Violin<br>Golden Fiddle 250<br>Xylophone"

/datum/lore/codex/page/casinomanual_drinks/add_content()
	name = "Prizes: Drinks"
	keywords += list("Prizes", "Drinks")
	data = "All is 50!<br><br>\
		Redeemer brew <br>Warlock velvet <br>Wrapp artiste patron <br>Flask of holy water <br>College girl goldschlager <br>Gilthari luxury champagne <br>Bottle of nothing <br>Special blend whiskey <br>Akvavit"

/datum/lore/codex/page/casinomanual_pets/add_content()
	name = "Prizes: Pets"
	keywords += list("Prizes", "Pets")
	data = "Armadillo 150 <br>Cat 150 <br>Goat 150 <br>Fox 150 <br>Lizard 150 <br>Penguin 150 <br>Goose 200	<br>Chicken 200	<br>Cow 200	<br>Corgi 200 <br>Yithian 200 <br>Tindalos 200 <br>Fennec 300 <br>Red Panda 300\
		<br>Horse 300 <br>Otie 500 <br>Chonker Otie 500 <br>Zorgoia 500"

/datum/lore/codex/page/casinomanual_mechs/add_content()
	name = "Prizes: Mechs and Rigs"
	keywords += list("Prizes", "Mechs", "Rigs")
	data = "Mining Ripley 1000 <br>\
		Mech: Firefighter Ripley 750 <br>\
		Mech: Serenity 1500	<br>\
		Mech: Odysseus 1250 <br>\
		Mech: Phazon Scuttlebug 2000 <br>\
		Mech: Phazon Janus 2500 <br>\
		Mech: Scarab 500 <br>\
		Mech: Shuttlepod 250 <br>\
		Mech: Shuttlecraft 500<br>\
		Rig: Solgov engineering hardsuit control module 500 <br>\
		Rig: Solgov medical hardsuit control module 500 <br>\
		Rig: Advanced hardsuit control module 500 <br>\
		Rig: Pursuit hardsuit control module 750 <br>\
		Rig: Combat hardsuit control module 750 <br>\
		Rig: ERT-J suit control module (Elite Janitor NT approved) 250 <br>\
		Rig: Augmented tie (Elite Paper-Pusher NT approved) 250 <br>\
		Rig: Industrial suit control module 300 <br>\
		Rig: Rescue suit control module 300"

/datum/lore/codex/page/casinomanual_implants/add_content()
	name = "Prizes: Implants and Genemods"
	keywords += list("Prizes", "Implants", "Genemods")
	data = "Implanter 100 (A basic empty implanter, you are going to need this to implant yourself with cyberntic augments)<br>\
		Implant: Tazer 1000 (A cybernetic implant that allows one to spawn a personal defense taser)<br>\
		Implant: Medkit 500 (A cybernetic implant that allows you to spawn all the tools needed for surgery)<br>\
		Implant: Shades 750 (A cybernetic implant that will spawn protective thermoshades upon your eyes, AR included!)<br>\
		Implant: Sprinter 1500 (A cybernetic implant that will give you that extra kick of energy to run faster!)<br>\
		Implant: Toolkit 500 (A cybernetic implant that allows you to spawn all the tools needed for engineering)<br>\
		Implant: Language 500 (A cybernetic implant that allows you to understand almost all languages)<br>\
		Implant: Analyzer 500 (A cybernetic implant that allows one to spawn a Portable Resonant Analyzer for any science needs)<br>\
		Implant: Size Control 500 (A cybernetic implant that allows one to change the size of others via specific voice commands)<br>\
		Implant: Adrenalin 500 (Subjects injected with implant can activate a massive injection of adrenalin)<br>\
		Implant: Armblade 1000 (Nanite fabricator capeable of making a large blade on arm)<br>\
		Implant: Wrist dartgun 1000 (Nanite fabricator capeable of making a dart gun on arm)<br>\
		Implant: Freedom 500 (Use this to escape from those evil Red Shirts.)<br>\
		Implant: Handblade 1000 (Nanite fabricator capeable of making a small blade on wrist)<br>\
		Implant: Armlaser 1000 (Nanite fabricator capeable of making a laser on arm)<br>\
		Implant: Loyalty 500 (Makes you loyal or such.)<br>\
		Implant: Arm restraining bolt 1000 (Nanite fabricator capeable of making a restraining bolt gun on arm)<br>\
		Implant: Surge 500 (A muscle overclocker, for when you need to punch extra hard!)<br>\
		Implant: Sword arm 1000 (Nanite fabricator capeable of making a large sword attached to arm)<br>\
		Genemod: No breath:  1000 (No need to breath)<br>\
		Genemod: Regenerate:  1000 (Regeration conveniently packaged in a syringe)<br>\
		Genemod: Remote view:  1000 (See further than ever before!)<br>\
		Genemod: Sprinter:  1000 (You run faster)<br>\
		Genemod: Telepathy:  1000 (Mysterious telepathic powers are within your grasp!)<br>\
		Genemod: X-ray:  1000 (A genetic shoot that allows for view through matter)"

/datum/lore/codex/page/casinomanual_sentientprizes/add_content()
	name = "Sentient Prizes"
	keywords += list("Sentient Prizes", "Prizes")
	data = "Goodness me this is quite the casino huh? Who would have thought one could win other people as a prize? <br>\
	Well you can do just about anything you want with them! Be it just company, some less children friendly company, heck you can even eat them or make them eat you! <br>\
	The options and possibilities are quite frankly limitless! Now you might ask, how does one get these fancy prizes? <br>\
	Well they can be obtained by checking in at and see the list the Sentient Prize Automatic Sales Machinery (SPASM). There might be none, there might be many, it depends on volunteers and losers! <br><br>\
	This brings us first to volunteers and then to losers! Volunteering is simple! Anyone can walk up to the SPASM and select to be a prize (examine yourself first, else flavor text might not have been generated for system to copy.)<br>\
	The SPASM will dispense a collar and 100 chips for you to spend as you please!<br>\
	Whether it's staff or crewmember that loses a bet with themselves on the line, the winner has the rights to keep the loser as a prize, or donate them to the SPASM. It goes like volunteering, except the winner gets the 100 chips dispensed and use to buy the prize instantly if deciding to keep.<br><br>\
	The collar made for volunteers or losers will be added to a list, and remotely show the prize's status, with everyone at the terminal able to see if you're owned or available, neat huh?<br>\
	When a collar has been selected it can be examined at the SPASM, allowing crew to see information about the prize to see in advance if they might be to their liking.<br><br>\
	For crew wishing to buy a prize, you first select the prize, and then insert chips into the system, if the person in question is the prize, they buy themselves out of the system and collar is deactivated.<br>\
	If an owner thinks they had enough fun and wants to cut their prize slack, simply take the collar from the prize, and swipe through system, the system will then ask if the ownership and collar should be nullified. If you need help just ask staff!<br><br>\

	(Sour part, but very important. These sentient prizes can be fun, but one thing always dictates how these things goes down, preferences and ooc wants. If preferences dont line up and people dont agree to do winner/loser scene it becomes sentient prize on list. <br>\
	And someone cant win a prize if the prize ooc doesnt want to do what the winner wants to do. We still wish people to try and reach out and try things with new people and/or new things they are comfortable doing, but never shall anyone be forced into a situation they dont want!)"

/datum/lore/codex/page/casinomanual_managementguide/add_content()
	name = "Golden Space Goose Management Guide"
	keywords += list("Staff", "Guide")
	data = "WIP"
