#!/bin/bash


# disable Gatekeeper
sudo spctl --master-disable

# set default file format to jpg for Screenshots using cmd+shift+4
defaults write com.apple.screencapture type jpg

# set checking updates frequency to once per day
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# enable show full path in Finder
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES; killall Finder

# enable hidden windows if hiding a window with cmd+m
defaults write com.apple.Dock showhidden -bool TRUE

# enable hold down key repeat, remember to set delay in keyboard settings
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false


# set hide dock animation to 0.10 for faster responsiveness
defaults write com.apple.dock autohide-time-modifier -float 0.10

# add i spacers to the dock
for (( i=1; i<=8; i++))
    do
        defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}’
    done
