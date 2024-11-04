/client/verb/export_chat()
<<<<<<< HEAD
	set category = "OOC.Chat" //CHOMPEdit
=======
	set category = "OOC.Chat"
>>>>>>> 4879a52633 (Server maint subsystem (#16518))
	set name = "Export Chatlog"
	set desc = "Allows to trigger the chat export"

	tgui_panel.window.send_message("saveToDiskCommand")
