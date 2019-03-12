/world/New()
	SERVER_TOOLS_ON_NEW
	return ..()

/world/Reboot(var/reason)
	SERVER_TOOLS_ON_REBOOT
	return ..(reason)

/world/Topic(T, addr, master, key)
	SERVER_TOOLS_ON_TOPIC
	return ..(T, addr, master, key)