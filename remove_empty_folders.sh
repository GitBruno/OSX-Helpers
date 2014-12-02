# This scripts labels all empty folders
# Run this script with a folder as parameter:
# $ path/to/script path/to/folder

#!/bin/bash

rmEmptyDirs(){
	local DIR=$1
	for dir in "$DIR"/*/
	do
		[ -d "${dir}" ] || continue # if not a directory, skip
		dir=${dir%*/}
		# echo $dir
		if [ "$(ls -A "$dir")" ]; then
			# echo "$dir is not Empty"
			rmEmptyDirs "$dir"
		else
			# echo "$dir is Empty"
			rmdir "$dir"
		fi
	done
}

rmEmptyDirs "$1"