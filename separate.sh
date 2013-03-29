#!/bin/sh

###
###
# Determine the videos that correspond to a game.
#
# This is done by looking at the creation time for each video (each
# raw video file from the camera) and looking at the time difference
# between consecutive videos. If the time difference is greater
# than some threshold (e.g. 10 minutes), we say this marks the time
# in between two games.
###
###

function videos {
  ls -U avchd | grep MTS
}

function outfile {
  echo "${outdir}/movie_${listnum}.txt"
}

function clear {
  printf "" > $1
}

prev_video=""
listnum="1"

outdir="lists"
mkdir -p $outdir
clear `outfile`

for current_video in `videos`; do

  if [ $prev_video ]; then
    mp4=`echo $prev_video | tr "MTS" "mp4"`
    echo "file '../mp4/$mp4' " >> `outfile`

    time_diff=`./td/timediff avchd/$prev_video avchd/$current_video`

    if [ $time_diff -gt 10 ]; then
      listnum=`expr $listnum + 1`
      clear `outfile`
    fi
  fi

  prev_video="$current_video"
done
