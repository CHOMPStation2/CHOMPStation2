/*
 * Home of the New (NOV 1st, 2019) library books.
 */

/obj/item/book/custom_library // CHOMPEdit - Removal of obj/item/weapon
	name = "Book"
	desc = "A hardbound book."
	description_info = "This book is printed from the custom repo. If you can see this, something went wrong."

	icon = 'icons/obj/custom_books.dmi'
	icon_state = "book"

	// This is the ckey of the book's author.
	var/origkey = null
	author = "UNKNOWN"

/obj/item/book/custom_library/fiction // CHOMPEdit - Removal of obj/item/weapon
	libcategory = "Fiction"

/obj/item/book/custom_library/nonfiction // CHOMPEdit - Removal of obj/item/weapon
	libcategory = "Non-Fiction"

/obj/item/book/custom_library/reference // CHOMPEdit - Removal of obj/item/weapon
	libcategory = "Reference"

/obj/item/book/custom_library/religious // CHOMPEdit - Removal of obj/item/weapon
	libcategory = "Religious"
/*
/obj/item/book/custom_library/adult // CHOMPEdit - Removal of obj/item/weapon
	libcategory = "Adult"
*/
/obj/item/book/bundle/custom_library // CHOMPEdit - Removal of obj/item/weapon
	name = "Book"
	desc = "A hardbound book."
	description_info = "This book is printed from the custom repo. If you can see this, something went wrong."

	icon = 'icons/obj/custom_books.dmi'
	icon_state = "book"

	// This is the ckey of the book's author.
	var/origkey = null
	author = "UNKNOWN"

	page = 1 //current page
	pages = list() //the contents of each page

/obj/item/book/bundle/custom_library/fiction // CHOMPEdit - Removal of obj/item/weapon
	libcategory = "Fiction"

/obj/item/book/bundle/custom_library/nonfiction // CHOMPEdit - Removal of obj/item/weapon
	libcategory = "Non-Fiction"

/obj/item/book/bundle/custom_library/reference // CHOMPEdit - Removal of obj/item/weapon
	libcategory = "Reference"

/obj/item/book/bundle/custom_library/religious // CHOMPEdit - Removal of obj/item/weapon
	libcategory = "Religious"
/*
/obj/item/book/bundle/custom_library/adult // CHOMPEdit - Removal of obj/item/weapon
	libcategory = "Adult"
*/
