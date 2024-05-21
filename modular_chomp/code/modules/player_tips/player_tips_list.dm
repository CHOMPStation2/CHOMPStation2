/* List of player tips
Weighted to emphasize more important over less.area
Weights are not additive. You can have multiple prob(50) items.
prob(50) makes it half as likely to appear and so forth.
When editing the list, please try and keep similar probabilities near each other. High on top, low on bottom */

//argument determines if to pick a random tip or use a forced choice.
/datum/player_tips/proc/pick_tip(var/isSpecific)
	var/choice = null
	if(!(isSpecific == "none" || isSpecific == "general" || isSpecific == "gameplay" || isSpecific == "roleplay" || isSpecific == "lore" ))
		choice = "none" //Making sure that wrong arguments still give tips.
	if(isSpecific == "none")
		choice = pick (
			prob(50); "general",
			prob(50); "gameplay",
			prob(25); "roleplay",
			prob(20); "lore"
		)
	else
		choice = isSpecific

	switch(choice)
		if("general")
			var/info = "The following is a general tip for playing on CHOMPStation! You can disable them using the periodic tips toggle in the Global tab of the character setup! \n"
			return pick(
			prob(60); "[info] Got a question about gameplay, roleplay or the setting? Press F1 to Mentorhelp!",
			prob(60); "[info] We have a wiki that is actively updated! Please check it out at https://wiki.chompstation13.net/index.php/Chomp_Station_Wiki for help!",
			prob(60); "[info] Unsure about rules? Press F1 and ask our admins for clarification - they are happy to help.",
			prob(30); "[info] Don't be afraid to approach your fellow players for advice! Learning things ICly can help build powerful bonds!",
			prob(30); "[info] Need some guidance making a character or with roleplay concepts? Our discord's tutoring channel is happy to help!",
			prob(30); "[info] Having difficulties getting started? Pressing F3 to speak and typing '; Hello! I'm a new hire. Could someone please give me a tour?' or as appropriate for your character is a good way to start! More help available at: https://wiki.chompstation13.net/index.php/The_Basics",
			prob(30); "[info] Want to try out a new department? Consider joining as an intern when it's well-staffed. Our players enjoy teaching eager students. You can approach such roleplay as simply getting taught the local technologies, procedures - you don't need to be 'fresh out of school' to justify it!",
			prob(30); "[info] Our discord is an excellent resource to stay up to date about changes and events! If wanting to separate your kink and real identities, Discord has a built in means to swap accounts within the client. It is OK to lurk!",
			prob(5); "[info] Got another tip for the list? Please let us know on Discord in the feedback forums!"
			)


		if("gameplay")
			var/info = "The following is a gameplay-focused tip for playing on CHOMPStation! You can disable them using the periodic tips toggle in the Global tab of the character setup! \n"
			return pick(
				prob(50); "[info] To talk to your fellow coworkers, use ';'! You may append it by an exclamation mark, like ';!' to perform an audiable emote. ",
				prob(50); "[info] Lost on the map? You can find In-Character help by speaking on the Common Radio. You can do this by pressing F3 and typing ' ; ' before your message. Your fellow co-workers will likely help. If OOC help is preferred, press F1 for mentorhelp. ",
				prob(50); "[info] You may set your suit sensors by clicking on the icon in the bottom left corner, then right click the clothes that appear right above it. It is recommended to turn on suit sensors to 'TRACKING' before doing anything dangerous like mining, and to turn them off before digestion scenes as prey.",
				prob(35); "[info] It is never a bad idea to visit the medbay if you get injured - small burns and cuts can get infected and become harder to treat! If there is no medical staff, bathrooms and the bar often have a NanoMed on the wall, while a medical station can be found on the first deck - with ointments to disinfect cuts and burns, bandages to treat bruises and encourage healing.",
				prob(25); "[info] Two control modes exist for SS13 - hotkey ON and hotkey OFF. You can swap between the two modes by pressing TAB. In hotkey mode, to chat you need to press T to say anything which creates a small talking bubble.",
				prob(25); "[info] Do you want to shift your character around, for instance to appear as if leaning on the wall? Press CTRL + SHIFT + arrow keys to do so! Moving resets this.",
				prob(25); "[info] Emergency Fire Doors seal breaches and keep active fires out. Please do not open them without good reason. SHIFT + CLICK them to get temperature and atmospheric pressure readings.",
				prob(25); "[info] The kitchen's Oven can fit multiple ingredients in one slot if you pull the baking tray out first. This is required for most recipes, and the Grille and Deep Frier work the same way!",
				prob(10); "[info] Not every hostile NPC you encounter while mining or exploring needs to be defeated. Sometimes, it's better to avoid or run away from them.",
				prob(1); "[info] Stay robust, my friends.",
				prob(35); "[info] You can insert your ID into your PDA. This frees up your belt from having to carry your PDA. Furthermore, by clicking and dragging the PDA to the game screen, you can use it without holding it!",
				prob(35); "[info] Your vore-bellies have multiple add-ons! Muffling is excellent to ensure your prey does not accidentally inform everyone about their predicament, and jam suit sensors is a great courtesy to avoid medical being worried about your prey!",
				prob(35); "[info] Remember to check your vore panel preferences! There you can find toggles for things other than just vore(tm), such as stepping mechanics and spontaneous transformation.",
				prob(25); "[info] If you would like to toggle stepping mechanics, head to the vore panel and click on personal preferences! Disabling stepping mechanics will disable stepping descriptions and will prevent your character from taking damage if a bigger character walks over yours with harm intent. Your character will still be stunned, however."
				)

		if("roleplay")
			var/info = "The following is a roleplay-focused tip for playing on CHOMPStation! You can disable them using the periodic tips toggle in the Global tab of the character setup! \n"
			return pick(
				prob(50); "[info] Having difficulty finding scenes? The number one tip is to be active! Generally speaking, people are more likely to interact with you if you are moving about and doing things. Don't be afraid to talk to people, you're less likely to be approached if you're sat alone at a table silently. People that are looking for scenes generally like to see how you type and RP before they'll start working towards a scene with you.",
				prob(50); "[info] Please avoid a character that knows everything. Having only a small set of jobs you are capable of doing can help flesh out your character! It's OK for things to break and fail if nobody is around to fix it - you do not need to do others' jobs.",
				prob(25); "[info] Embrace the limits of your character's skillsets! Seeking out other players to help you with a more challenging task might build friendships, or even lead to a scene!",
				prob(25); "[info] Slowing down when meeting another player can help with finding roleplay! Your fellow player might be typing up a greeting or an emote, and if you run off you won't see it!",
				prob(25); "[info] It is a good idea to wait a few moments after using mechanics like lick, hug or headpat on another player. They might be typing up a response or wish to reciprocate, and if you run away you might miss out!",
				prob(25); "[info] Participating in an away mission and see something acting strange? Try emoting or talking to it before resorting to fighting. It may be a GM event!",
				prob(15); "[info] We are a medium roleplay server. This does not neccessarily mean 'serious' roleplay, levity and light-hearted RP is more than welcome! Please do not ignore people just because it is unlikely you will be able to scene.",
				prob(10); "[info] Sending faxes to central command, using the 'pray' verb or pressing F1 to ahelp are highly encouraged when exploring the gateway or overmap locations! Letting GMs know something fun is happening allows them to spice things up and make the world feel alive!",
				prob(40); "[info] Just because you see something doesn't mean your character has to. A courtesy 'missing' of contraband or scene details can go a long way towards preserving everyone's fun!",
				prob(25); "[info] It is always a good idea to communicate on your department's private channel (whose key you can learn by examining your headset) when responding to an emergency! This lets your coworkers know if they might be needed!",
				prob(25); "[info] While following the SOP is not mandatory, and you are free to break it (albeit, with potential in-character consequences), departments like security and medical do well to be familiar with them! https://wiki.chompstation13.net/index.php/Standard_Operating_Procedure",
				prob(25); "[info] Think a player is acting especially antagonistic? It might be better to Ahelp (with F1) rather than try to deal with it icly, staff can make sure it's all okay.",
				prob(20); "[info] See a minor infraction as Security with a minimal time punishment? Consider using your ticket printer to give a non obtrusive punishment."
				)

		if("lore")
			var/info = "The following is a tip for understanding the lore of CHOMPStation! You can disable them using the periodic tips toggle in the Global tab of the character setup! \n"
			return pick(
				prob(25); "[info] Our lore is somewhat in line with other servers. The year is 2568 (current year+544).",
				prob(75); "[info] You can find a short summary of our setting that everyone should know at https://wiki.chompstation13.net/index.php/Lore",
				prob(50); "[info] You are currently working in the Vir system on the NLS Southern Cross telecommunications and traffic control station. https://wiki.chompstation13.net/index.php/Vir",
				prob(50); "[info] The majority of employees live at the Northern Star asteroid colony orbiting a gas giant called Kara. It is also a central hub for visitors, logistics, and mining. This is the place the shuttle takes you at the end of the round. You may visit the mines via the exploration shuttles. https://wiki.chompstation13.net/index.php/NCS_Northern_Star",
				prob(10); "[info] Thaler is a universal monopoly money. It is backed and supported by Sol Central and its allies. While ubiquitous in frontier worlds, it has an unfavourable exchange rate with most currencies used by well-settled regions, limiting immigration to places such as Earth. https://wiki.chompstation13.net/index.php/Lore"
			)
