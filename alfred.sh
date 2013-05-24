#!/bin/bash

set -e

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
  echo "
NAME:
$(basename $0)

USAGE: 
$(basename $0) [option] <source> <destination> [search_text] 

DESCRIPTION:
This script compiles a directory of .less files and outputs a directory of .css files. You can search text within the file to filter which less files to compile.

OPTIONS
  -h, --help	Print help (this message) and exit.

EXAMPLES
$(basename $0) ~/theme/less ~/theme/css
This the most basic version. It takes all of the less files and compiles them as css.

$(basename $0) ~/theme/less ~/theme/css '.theme()'
This again takes all of the less files with the text '.theme()' in them and compiles them to css.

PREREQUISITES
Less compiler needs to be installed. See http://lesscss.org for more information.

AUTHOR
Andrew Keym @optimus_keym
http://github.com/keymholio

License
Copyright © 2013 Free Software Foundation, Inc. License  GPLv3+:  GNU
GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This  is  free  software:  you  are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
"
  exit 0
fi

die() { echo "$@" 1>&2 ; rm $dest_path; exit 1; }

# find all of the less files that contain '.theme()'
# in the passed in directory
source_path=$1
dest_path=$2
search=$3

mkdir -p $dest_path
[[ -d "$source_path" ]] || die "A source directory is required"
[[ -d "$dest_path" ]] || die "A destination directoy is required"

if [[ -z "$3" ]]; then
	files=$(find $1 -name '*.less' -type f)
else
	files=$(find $1 -name '*.less' -type f | xargs grep -l $search)
fi

# check if destination directory already exists
[[ -d "$dest_path" ]] && rm -rf $dest_path

# check if the destination directory has a trailing forward slash
dest_path_last_char=$(echo $dest_path | tail -c 2)
[[ "$dest_path_last_char" == "/"  ]] || dest_path="$dest_path/"

echo "Creating files..."
for file in $files
do
	dir="$(dirname $file)/"
	subdir=${dir//$source_path/}
	filename=$(basename $file)
	filename=${filename//"less"/"css"}
	dest="$dest_path$subdir$filename"
	lessc --yui-compress $file $dest
done

echo "You've been served css!"
