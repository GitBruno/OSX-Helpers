# This scripts labels all empty folders
# Run this script with a project name as parameter:
# $ path/to/script "Book Title"

#!/bin/bash
echo What is the title of the book?
read TITLE

# TO DO:
# regex title to put the and a at the back

function mkcdNewProject {
  if [ ! -n "$1" ]; then
    echo "Enter a project name"
  elif [ -d $1 ]; then
    echo "\`$1' folder already exists"
  else
    mkdir $1 && cd $1
  fi
}

# Go to current dir
CURDIR="${0%/*}"
NEWDIR=$CURDIR'/'$TITLE

mkcdNewProject $NEWDIR
mkdir "MU"
mkdir "Supplied"
mkdir "_Archive"
