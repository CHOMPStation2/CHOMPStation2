// /data/ files store data in string format.
// They don't contain other logic for now.
/datum/computer_file/data/news_article
	filetype = "XNML"
	filename = "Unknown News Entry"
	block_size = 5000 		// Results in smaller files
	do_not_edit = 1			// Editing the file breaks most formatting due to some HTML tags not being accepted as input from average user.
	var/server_file_path 	// File path to HTML file that will be loaded on server start. Example: '/news_articles/space_magazine_1.html'. Use the /news_articles/ folder!
	var/archived			// Set to 1 for older stuff
	var/cover				//filename of cover.

/datum/computer_file/data/news_article/New(var/load_from_file = 0)
	..()
	if(server_file_path && load_from_file)
		stored_data = file2text(server_file_path)
	calculate_size()


// NEWS DEFINITIONS BELOW THIS LINE
/*
/datum/computer_file/data/news_article/space/vol_one
	filename = "SPACE Magazine vol. 1"
	server_file_path = 'news_articles/space_magazine_1.html'
*/

/* CHOMPedit: commenting out YW articles because they don't make sense here and adding our own.
//YAWN ADDS - All from discord
/datum/computer_file/data/news_article/archives/vol_gwa_one
	filename = "Galaxy Wide Archives"
	server_file_path = 'news_articles/galaxy_wide_archived_1.html'
	archived = 1

/datum/computer_file/data/news_article/archives/vol_tss_one
	filename = "The Sleepy Sergal Archives vol. 1"
	server_file_path = 'news_articles/the_sleepy_sergal_archived_1.html'
	archived = 1

/datum/computer_file/data/news_article/tss/vol_two
	filename = "The Sleepy Sergal vol. 2"
	server_file_path = 'news_articles/the_sleepy_sergal_2.html'
*/

/datum/computer_file/data/news_article/starfire/year_2564
	filename = "Starfire Report: Year 2564"
	server_file_path = 'news_articles/starfire_report_2564.html'

/datum/computer_file/data/news_article/starfire/year_2565
	filename = "Starfire Report: Year 2565"
	server_file_path = 'news_articles/starfire_report_2565.html'

//End CHOMPedit
