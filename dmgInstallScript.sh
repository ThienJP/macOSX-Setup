#!/bin/bash

#set this to the path where you store your .dmg images, no trailing / necessary
APPS_PATH="/Users/thienjp/Programs/Apps/test"

FILES="$APPS_PATH/*.dmg"
    #loops through all .dmg in FILES path
    for dmg in $FILES
    do
        echo now installing $dmg ...
        VOLUME=`yes | hdiutil attach $dmg | grep Volumes | awk '{print $3}'`
        cp -rf $VOLUME/*.app /Applications
        hdiutil detach $VOLUME
        echo successfully installed $dmg
    done
