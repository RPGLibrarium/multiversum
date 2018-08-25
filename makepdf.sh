#!/bin/bash
if [ $# -lt 1 ]; then
        echo "USAGE: ./makepdf.sh ausgabeX.{md|txt|...}"
        exit 1
fi

pandoc "$1" --pdf-engine="xelatex" --template="main.tex" -o "${1/${1##*.}}"pdf

