/obj/item/book/manual/chemistry_guide
	name = "Chemical Recipes and Refreshers"
	desc = "A lengthy guide on the most commonly used chemicals on a modern orbital facility"
	icon_state = "bookMedical"
	icon = 'icons/obj/library.dmi'
	author = "NanoTrasen"
	title = "Chemical Recipes and Refreshers"

/obj/item/book/manual/chemistry_guide/New()
	..()
	dat = {"
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>
				<h1>((https://wiki.chompstation13.net/index.php?title=Guide_to_Chemistry))</h1>
			"}
