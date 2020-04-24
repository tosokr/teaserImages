#!/bin/bash
pathToStenciles="/mnt/c/Media/stencils/Azure-Stencils"
pathToTeasers="/mnt/c/Media/github/teaserImages"
cd $pathToStenciles
find . -type f -iname '*.svg' ! -iname "*\'*" | sed 's/\.svg$//1'| xargs -I fileName inkscape -z -e fileName".png" fileName".svg" -w 290 -h 290 -b white
find . -iname '*.png' -exec cp --parents {} $pathToTeasers \;
cd $pathToTeasers
find . -type f -iname '*.png' ! -iname "*\'*" | xargs -I filename convert filename -gravity center -background "rgb(255,255,255)" -extent 500x300 filename
