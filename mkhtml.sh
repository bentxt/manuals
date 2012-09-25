#!/bin/sh

rm -rf html
mkdir -p html

{
    echo "# Manuals "
    for f in txt/*.txt ; do
        [ -f $f ] || continue
        bn=$(basename $f)
        nm=${bn%.*}
        pandoc -s -f markdown -t html $f >| html/${nm}.html
        echo "- [$nm](${nm}.html)"
    done
} | pandoc -s -f markdown -t html >| html/index.html


