// The location where we spawn shipping stuff that's returned or arrived.
var/turf/shippping_return = null

// The global list of IDs and pathnames we accept from other places.
var/list/global_shipping_ids = list()

// The reverse of the dictionary above. path -> id.
var/list/global_shipping_paths = list()

// The global list of received requests, sorted by their IP of origin.
var/list/shipping_contacts = list("origin" = list())
