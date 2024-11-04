/datum/admins/proc/view_persistent_data()
<<<<<<< HEAD
	set category = "Admin.Game" //CHOMPEdit
=======
	set category = "Admin.Game"
>>>>>>> 4879a52633 (Server maint subsystem (#16518))
	set name = "View Persistent Data"
	set desc = "Shows a list of persistent data for this round. Allows modification by admins."

	SSpersistence.show_info(usr)
