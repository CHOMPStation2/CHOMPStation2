// Ported from /vg/.
/proc/escape_shell_arg(var/arg)
	// RCE prevention
	// - Encloses arg in single quotes
	// - Escapes single quotes
	// Also escapes %, ! on windows
	if(world.system_type == MS_WINDOWS)
		arg = replacetext(arg, "^", "^^") // Escape char
		arg = replacetext(arg, "%", "%%") // %PATH% -> %%PATH%%
		arg = replacetext(arg, "!", "^!") // !PATH!, delayed variable expansion on Windows
		arg = replacetext(arg, "\"", "^\"")
		arg = "\"[arg]\""
	else
		arg = replacetext(arg, "\\", "\\\\'") // Escape char
		arg = replacetext(arg, "'", "\\'")    // No breaking out of the single quotes.
		arg = "'[arg]'"
	return arg

/proc/ext_python(var/script, var/arguments, var/scriptsprefix = 1)
	return  // VOREStation Edit - Can't exploit shell if we never call shell!
	/* Unreachable with above vorestation edit
	if(scriptsprefix)
		script = "scripts/" + script

	if(world.system_type == MS_WINDOWS)
		script = replacetext(script, "/", "\\")

	var/command = CONFIG_GET(string/python_path) + " " + script + " " + arguments
	return shell(command)
	*/
