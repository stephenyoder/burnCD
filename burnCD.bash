#!/bin/bash

echo "burning cd..."
read -p "What audio type would you like? You may choose more than one delimited by commas. Options: mp3, flac, spx, mpc, m4a, wav: " audio_type

#sanitize input


abcde -a cddb,read,encode,tag,move,playlist,clean -d /dev/cdrom -o $audio_type -V -x

#use jack to querie FreeDB databae

jack -Q -R
