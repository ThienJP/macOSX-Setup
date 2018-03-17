#!/bin/bash

echo setting up OSX configuration...

# disable Gatekeeper
sudo spctl --master-disable

# set default file format to jpg for Screenshots using cmd+shift+4
defaults write com.apple.screencapture type jpg

# set checking updates frequency to once per day
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# enable show full path in Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES; killall Finder

# enable hidden windows if hiding a window with cmd+m
defaults write com.apple.Dock showhidden -bool TRUE

# enable hold down key repeat, remember to set delay in keyboard settings
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# set hide dock animation to 0.10 for faster responsiveness
defaults write com.apple.dock autohide-time-modifier -float 0.10

# set fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# ask for password when leaving screensaver or sleep mode
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelaay -int 0

# show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# enable one tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# disable Dashboard
defaults write com.apple.dashboard mcx-disabled -boolean TRUE; killall Dock

# disable natural scroll (swipe down to scroll up)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# add i spacers to the dock
for (( i=1; i<=8; i++))
  do
    defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}’'
done

# install homebrew and xcode-cli tools
echo installing homebrew and xcode-cli tools
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
xcode-select --install

echo installing brew packages

PACKAGES {
  google-chrome
  iterm2
  git
  ffmpeg
  vagrant
  discord
}

brew install ${PACKAGES[@]}
brew cleanup

# copy fonts to system-wide folder
echo installing source-code-pro Fonts
sudo cp -a $HOME/Programs/Apps/source-code-pro-2.030R/OTF/. /Library/Fonts

# generating ssh-key
ssh-keygen -t rsa -b 4096 -C "my_email"
cat ~/.ssh/id_rsa.pub > pbcopy

echo ssh-key copied to clipboard. paste in your github account.

#set this to the path where you store your .dmg images, no trailing / necessary
echo installing .dmg images
APPS_PATH="$HOME/Programs/Apps/test"

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



