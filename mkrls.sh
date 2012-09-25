#!/bin/sh

curdir=$(pwd)
here=$(basename $curdir)

hd=$( cat Version.txt | awk -F: '{ print $1 }')
txt=$( cat Version.txt | awk -F: '{ print $2 }')

pkg=$( echo $hd | awk '{ print $1 }')
vers=$( echo $hd | awk '{ print $2 }')
date=$( echo $hd | awk '{ print $3 }')
date=$( echo $date | sed 's/(//g' )
date=$( echo $date | sed 's/)//g' )

nm=${pkg}-${vers}_${date}
fnm=${nm}.tar.gz

cd ..

rm -rf $nm
cp -r $pkg $nm
rm -rf ${nm}/.git


tar cfvz $fnm $nm
pandoc -f markdown -t html $nm/Readme.txt > src/${nm}.html
mv src/${nm}.html src/${here}.html
rm -rf $nm


