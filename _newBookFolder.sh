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
FOLDERNAME="/_New Book Folder"
NEWDIR="$CURDIR$FOLDERNAME"

echo "$NEWDIR"

mkcdProjectFolder "$NEWDIR"
mkdir "MU"
mkdir "Supplied"
mkdir "_Archive"

osascript -e 'tell application "Terminal" to close (every window whose name contains "_newBookFolder")' & exit