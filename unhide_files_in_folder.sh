# This scripts unhide all files in folder
# Run this script with a folder as parameter:
# $ path/to/script path/to/folder

#!/bin/bash          
FOLDER=$1

for file in "$FOLDER"/*
do
  echo "Processing $file"
  chflags nohidden "$file"
done