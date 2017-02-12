/datum/configuration
	var/shipping_auth = "memes"
	var/list/authedservers = list()

/datum/configuration/proc/loadshippinglist(filename)
	var/list/Lines = file2list(filename)
	for (var/t in Lines)
		if(!t)	continue
		t = trim(t)
		if (length(t) == 0)
			continue
		else if (copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/ip = null
		var/value = null

		if (pos)
			ip = lowertext(copytext(t, 1, pos))
			value = copytext(t, pos + 1)
		else
			ip = lowertext(t)

		if (!ip)
			continue

		var/name
		var/auth
		pos = findtext(value, ";")
		if (pos)
			name = lowertext(copytext(value, 1, pos))
			auth = copytext(value, pos + 1)

		authedservers[ip] = new /datum/shippingservers(ip, name, auth)
		world << "Added server: [ip] [name] [auth] to list"


/datum/shippingservers
	var/serverip
	var/servername
	var/serverauth

/datum/shippingservers/New(_serverip, _servername, _serverauth)
	if(!_serverip || !_servername || !_serverauth)
		throw EXCEPTION("Invalid arguments sent to shippingservers/New().")

	serverip = _serverip
	servername = _servername
	serverauth = _serverauth