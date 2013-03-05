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

Make handles the data dependencies, and avoids redoing any work.
