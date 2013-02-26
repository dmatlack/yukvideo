Video Conversion & Movie Generation
===================================

Converting and making movies with iMovie is a pain in the ass so I decided to 
do it on the commandline using Make and ffmpeg.

Usage
-----

Put all raw AVCHD files in the avchd/ directory. Running make will convert them
to mp4 files and put them in the mp4/ directory.

Why Makefiles
-------------

Using Make allows me to avoid re-converting video files. In addition, you can
run make and interrupt it at any time with CTRL-C. Then when you want to resume
conversion just run make again and it will pick up at the last file that was being
converted.
