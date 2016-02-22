# This scripts creates a new project folder

# this is a stupid folder structure but this is how it is ;(

makecomment(){
  osascript -e 'on run {f, c}' -e 'tell app "Finder" to set comment of (POSIX file f as alias) to c' -e end "$1" "$2"
}

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
FOLDERNAME="/_ISBN_Title"
NEWDIR="$CURDIR$FOLDERNAME"

# Create WIP folder
mkcdProjectFolder "$NEWDIR"
# Add username to comment
makecomment "$NEWDIR" "$USER"

mkcdProjectFolder "work_In_progress"
mkdir "Text"
mkdir "Cover"

#Create Final Art folder
cd "$NEWDIR"
mkcdProjectFolder "final_files"
mkcdProjectFolder "application_files"
mkdir "Text"
mkdir "Cover"

cd "${NEWDIR}/final_files"
mkcdProjectFolder "print_ready_pdf"
mkdir "Text"
mkdir "Cover"

osascript -e 'tell application "Terminal" to close (every window whose name contains "_newBookFolder")' & exit