# Alfred
<img src="https://raw.github.com/keymholio/alfred/master/alfred.jpg"/>

## Installation
Put the shell script in the location of your choice. You may want it readily available in /home/[your username]/bin or possibly in /usr/local/bin for all users.

I also recommend removing the ".sh" extention so you won't have to use "alfred.sh" in all of the commands. All the code and examples below assume you don't have the ".sh" extension.

Once there, you need to make it executable by running the following command:
`chmod +x alfred`

## Usage
`alfred [option] <source> <destination> [search_text]` 

## Description
This script compiles a directory of .less files and outputs a directory of .css files. You can search text within the file (optional 'search_text' parameter to filter which less files to compile.

## Options
  -h, --help	Print help

## Examples
`alfred ~/theme/less ~/theme/css`

This the most basic version. It takes all of the less files and compiles them as css.

`alfred ~/theme/less ~/theme/css '.theme()'`

This takes all of the less files with the text '.theme()' in them and compiles them to css.

## Prerequisites
Less compiler needs to be installed. See http://lesscss.org for more information.

## Author
Andrew Keym 
@optimus_keym
http://github.com/keymholio

## License
Copyright © 2013 Free Software Foundation, Inc. License  GPLv3+:  GNU
GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
This  is  free  software:  you  are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
