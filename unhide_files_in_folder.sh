# This scripts unhide all files in a folder
# Run this script with a folder as parameter:
# $ path/to/script path/to/folder

#!/bin/bash          
FOLDER=$1

for file in "$FOLDER"/*
do
  echo "Unhiding $file"
  xattr -d com.apple.FinderInfo "$file"
  chflags nohidden "$file"
done