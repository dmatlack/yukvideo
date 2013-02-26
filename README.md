Video Conversion & Movie Generation
===================================

Converting and making movies with iMovie is a pain in the ass so I decided to 
do it on the commandline using Make and ffmpeg.

Usage
-----

Put all raw AVCHD files in the avchd/ directory and movielist files in the
movielists directories. To convert all files and build all movies, run

`$ make`

To just convert all avchd files (and not build movies), run:

`$ make convert`

Why Makefiles
-------------

Using Make allows me to avoid re-converting video files. In addition, you can
run make and interrupt it at any time with CTRL-C. Then when you want to resume
conversion just run make again and it will pick up at the last file that was being
converted.
