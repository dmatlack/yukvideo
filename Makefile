###
# Convert files from avchd to mp4
###

MTS_DIR = avchd
MP4_DIR = mp4

MTS_VIDEOS = $(shell ls $(MTS_DIR))
MTS_FULL = $(addprefix $(MTS_DIR)/,$(MTS_VIDEOS))

MP4_VIDEOS = $(MTS_VIDEOS:.MTS=.mp4)
MP4_FULL = $(addprefix $(MP4_DIR)/,$(MP4_VIDEOS))

.PHONY: target

target: $(MP4_FULL)

$(MP4_DIR)/%.mp4: $(MTS_DIR)/%.MTS
	ffmpeg -i $< -vcodec mpeg4 -b:v 15M -acodec libmp3lame -b:a 192k $@
