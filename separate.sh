#!/bin/sh

out_dir="lists"
mkdir -p $out_dir
listnum="1"

function videos {
  ls -lUT avchd | grep MTS | sed -E s/" "+/,/g | cut -d"," -f8,10
}

function outfile {
  echo "${out_dir}/movie_${listnum}.txt"
}

function clear {
  printf "" > $1
}

curr=""
curr_time=""
curr_video=""

clear `outfile`

for next in `videos`; do
  next_time=`echo $next | cut -d"," -f1`
  next_video=`echo $next | cut -d"," -f2`

  if [ "$curr" != "" ]; then
    mp4=`echo $curr_video | tr "MTS" "mp4"`
    echo "file '../mp4/$mp4' " >> `outfile`

    time_diff=`timediff/timediff $curr_time $next_time`

    if [ $time_diff -gt 10 ]; then
      listnum=`expr $listnum + 1`
       clear `outfile`
    fi
  fi

  curr="$next"
  curr_time="$next_time"
  curr_video="$next_video"
done
