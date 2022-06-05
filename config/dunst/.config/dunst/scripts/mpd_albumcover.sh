#!/bin/bash
music_dir="/mnt/suzunaan/Music" # set this to your mpd music directory
read -r current_path < <(mpc -f %file%)
dir="${music_dir}/${current_path%/*}"
for i in "$dir"/*; do
    [[ "${i##*/}" =~ (cover|folder)*.(jpg|png) ]] && echo "$i" && break
done