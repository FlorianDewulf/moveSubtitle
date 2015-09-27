Script in ruby to synchronize subtitle for your series.
Sometimes, there are little fade out, or black screen during an episode and the only subtitles you have are not for this version of the video.

With this tool, you can remove the seconds to synchronize the text with the video.

Usage :
ruby script.rb [Time in second to remove] [Name of the file]

Example :
If the first text begins at 00:09:03,289 and you use the tool with the command :

$ ruby script.rb 2 my_file

A file named new_my_file will be created with the first text at 00:09:01,289.
It accepts a float as number of seconds and if you want to add time, I guess you can give a negative number (I didn't try).
