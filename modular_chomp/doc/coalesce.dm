/*
Coalesce is a very simple concept in programming, essentially it takes a list of arguments and tells you the first one that is not null

Natively byond has no such thing but we added it
the syntax is coalesce(var1,var2...)
*/
//As an example lets use A simple fallback system to check for an id
//This code is entirely fictional and only demonstrates syntax

/proc/get_ID(/mob/carbon/m)
	return coalesce(  getID(handslotL),
					getID(handslotR),
					getID(beltslot)
					)
//Now assuming getID was a real proc that either returned NULL or an ID in a given storage slot.
// This code would check all 3 slots and then return the first ID we find.
// This makes it so we do not have to do any extra if/else statements, we simply use whatever is present first.

//as a second example you can also use coalesce as a fallback
/proc/fetch_name_with_fallback(var/name,var/nametwo)
	coalesce(name, nametwo, "Not found")
//Now what this will do is return name, if name is not null, nametwo if name is null but nametwo isnt null
//however if both given vars are in fact null we have a hardocded fallback "not found" that will always return instead
//now the important part here is the order. Always put the fallback last as arguments are checked based on their occurence in the list.
