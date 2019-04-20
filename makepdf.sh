#!/bin/bash
VALID_EXTENSIONS="(md|txt)"

if [[ $# -lt 1 ]] || [[ "$1" = "-h" ]]; then
    echo "USAGE: \n
		./makepdf.sh -f ausgaben/multiversum-XXX.{md|txt|...} ...\n
		./makepdf.sh -d ausgaben\n
		./makepdf.sh ausgaben/multiversum-XXX.{md|txt|...} (DEPRECATED)"
    exit 1
fi

build_pdf() {
	echo "Compiling $file ..."
	pandoc "$1" --pdf-engine="xelatex" --template="main.tex" -o "${1/${1##*.}}"pdf
}

# Old usage (only one file)
if [[ -f $1 ]] ; then
	file="$1"
	echo "Deprecated usage! See -h" 
	build_pdf $file	
fi

# New usage
key=$1
shift
case $key in
	-d|--dir)
		dir=$1
		if [[ ! -d $dir ]] ; then
			echo "$dir is not a directory."
			exit 1 
		fi
		echo "Traversing directory $dir :"
		find "$dir" -type f -regextype posix -regex ".*\.$VALID_EXTENSIONS" -print0 | while IFS= read -r -d $'\0' line; do			
			build_pdf $IFS
		done
	;;
	-f|--file|--files)
		while [[ $# -ne 0 ]] ; do
			file="$1"
			if [[ "${file##*.}" =~ $VALID_EXTENSIONS ]] ; then
				   build_pdf $file
			fi		   
			shift
		done	
	;;
esac
