#!/bin/bash

echo "burning cd..."
read -p "What audio type would you like? You may choose more than one delimited by commas. Options: mp3, flac, spx, mpc, m4a, wav: " audio_type

#sanitize input
audio_types=$(echo $audio_type | tr "," "\n")

for type in $audio_types;do
	if ["$type" != "mp3" | "$type" != "flac" | "$type" != "spx | "$type" != "mpc" | "$type" != m4a" | "$type" != "wav"];then
		echo "invalid input"
		exit 1
	fi
done

#have user input tracks they want to burn
read -p "enter track #'s you would like to burn separated by spaces. If you would like to burn all, leave blank and press enter" tracks

track_list=$(echo $tracks | tr " " "\n")

for track in $track_list;do
	case $track in 
		''|*[!0-9]*) 
			echo "not a num"
			exit 1
			;;

#use jack to query FreeDB database?

#perfrom burn
abcde -a cbbd,read,encode,tag,move,playlist,clean -d /dev/cdrom -o $audio_type -V -x $tracks
