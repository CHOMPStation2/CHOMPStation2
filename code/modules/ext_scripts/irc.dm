/proc/send2irc(var/channel, var/msg)
	return  // VOREStation Edit - Can't exploit shell if we never call shell!
	/* Unreachable with above VOREStation Edit
	if (CONFIG_GET(flag/use_irc_bot)) // CHOMPEdit
		if (CONFIG_GET(flag/use_node_bot)) // CHOMPEdit
			shell("node bridge.js -h \"[CONFIG_GET(string/irc_bot_host)]\" -p \"[CONFIG_GET(number/irc_bot_port)]\" -c \"[channel]\" -m \"[escape_shell_arg(msg)]\"") // CHOMPEdit
		else
			if (CONFIG_GET(string/irc_bot_host)) // CHOMPEdit
				if(CONFIG_GET(flag/irc_bot_export)) // CHOMPEdit
					spawn(-1) // spawn here prevents hanging in the case that the bot isn't reachable
						world.Export("http://[CONFIG_GET(string/irc_bot_host)]:45678?[list2params(list(pwd=CONFIG_GET(string/comms_password), chan=channel, mesg=msg))]") // CHOMPEdit
				else
					if(CONFIG_GET(flag/use_lib_nudge)) // CHOMPEdit
						var/nudge_lib
						if(world.system_type == MS_WINDOWS)
							nudge_lib = "lib\\nudge.dll"
						else
							nudge_lib = "lib/nudge.so"

						spawn(0)
							LIBCALL(nudge_lib, "nudge")("[CONFIG_GET(string/comms_password)]","[CONFIG_GET(string/irc_bot_host)]","[channel]","[escape_shell_arg(msg)]") // CHOMPEdit
					else
						spawn(0)
							ext_python("ircbot_message.py", "[CONFIG_GET(string/comms_password)] [CONFIG_GET(string/irc_bot_host)] [channel] [escape_shell_arg(msg)]") // CHOMPEdit
	return
	*/

/proc/send2mainirc(var/msg)
	if(CONFIG_GET(string/main_irc))
		send2irc(CONFIG_GET(string/main_irc), msg)
	return

/proc/send2adminirc(var/msg)
	if(CONFIG_GET(string/admin_irc))
		send2irc(CONFIG_GET(string/admin_irc), msg)
	return


/hook/startup/proc/ircNotify()
	send2mainirc("Server starting up on byond://[CONFIG_GET(string/serverurl) ? CONFIG_GET(string/serverurl) : (CONFIG_GET(string/server) ? CONFIG_GET(string/server) : "[world.address]:[world.port]")]")
	return 1
