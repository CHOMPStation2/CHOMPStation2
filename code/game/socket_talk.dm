// Module used for fast interprocess communication between BYOND and other processes

/datum/socket_talk
	var
		enabled = 0
	New()
		..()
		src.enabled = CONFIG_GET(flag/socket_talk) // CHOMPEdit

		if(enabled)
			call_ext("DLLSocket.so","establish_connection")("127.0.0.1","8019") // CHOMPEdit

	proc
		send_raw(message)
			if(enabled)
				return call_ext("DLLSocket.so","send_message")(message) // CHOMPEdit
		receive_raw()
			if(enabled)
				return call_ext("DLLSocket.so","recv_message")() // CHOMPEdit
		send_log(var/log, var/message)
			return send_raw("type=log&log=[log]&message=[message]")
		send_keepalive()
			return send_raw("type=keepalive")


var/global/datum/socket_talk/socket_talk
