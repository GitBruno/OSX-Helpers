# This scripts labels all empty folders
# Run this script with a folder as parameter:
# $ path/to/script path/to/folder

#!/bin/bash
DIR=$1

# Pick a label
# 1=Orange, 2=Red, 3=Yellow, 4=Blue, 5=Purple, 6=Green, 7=Gray
COLOUR=2;

highlightEmptyFolders () {
  local folder="$1"
  echo "$COLOUR"
  if [ "$(ls -A "$folder")" ]; then
    # echo "$folder is not Empty"
	# run this script on every folder in this folder
	for f in "$folder"/*/
	do
		highlightEmptyFolders "$f"
	done
  else
    # echo "$folder is Empty"
	osascript -e "tell application \"Finder\" to set label index of alias POSIX file \"$folder\" to \"$COLOUR\""
  fi
}

highlightEmptyFolders "$DIR"
