# This scripts creates a new project folder

function mkcdProjectFolder {
  if [ ! -n "$1" ]; then
    echo "Enter a project name"
  elif [ -d "$1" ]; then
    echo "\`$1' folder already exists"
  else
    mkdir "$1" && cd "$1"
  fi
}

# Go to current dir
CURDIR="${0%/*}"
FOLDERNAME="/New Project"
NEWDIR="$CURDIR$FOLDERNAME"

echo "$NEWDIR"

mkcdProjectFolder "$NEWDIR"
mkdir "MU"
mkdir "Supplied"
mkdir "_Archive"
