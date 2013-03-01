###
# Convert files from avchd to mp4
###
SHELL := /bin/bash

MTS_DIR = avchd
MP4_DIR = mp4
MOVIELISTS_DIR = movielists
MOVIES_DIR = movies

MTS_VIDEOS = $(shell ls $(MTS_DIR) | grep "MTS")
MTS_FULL = $(addprefix $(MTS_DIR)/,$(MTS_VIDEOS))

MP4_VIDEOS = $(MTS_VIDEOS:.MTS=.mp4)
MP4_FULL = $(addprefix $(MP4_DIR)/,$(MP4_VIDEOS))

MOVIELISTS = $(shell ls $(MOVIELISTS_DIR) | grep "txt")
MOVIELISTS_FULL = $(addprefix $(MOVIELISTS_DIR)/,$(MOVIELISTS))

MOVIES = $(MOVIELISTS:.txt=.mp4)
MOVIES_FULL = $(addprefix $(MOVIES_DIR)/,$(MOVIES))

default: $(MOVIES_FULL)
	
.PHONY: convert
convert: $(MP4_FULL) 

$(MOVIES_DIR)/%.mp4: $(MP4_FULL) $(MOVIELISTS_DIR)/%.txt
	mkdir -p movies
	ffmpeg -f concat -i $(MOVIELISTS_DIR)/$*.txt -c copy $(MOVIES_DIR)/$*.mp4

$(MP4_DIR)/%.mp4: $(MTS_DIR)/%.MTS
	mkdir -p mp4
	ffmpeg -i $< -vcodec mpeg4 -b:v 15M -acodec libmp3lame -b:a 192k $@
