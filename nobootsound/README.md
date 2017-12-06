# nobootsound

Source: https://github.com/teored90/nobootsound

Simple and effective solution to mute the boot sound of Mac computers.

The only effective way of disabling the boot sound, without resorting to hacks, is to mute the Mac before shutting it off. This script works by muting the Mac right before shutdown and by restoring the volume state after the login.

With **nobootsound**, you won't need to remember to mute your Mac, and you will get rid of the boot sound, which can be very annoying, especially if you have to boot in places where silence is golden, such as libraries, classrooms, conference halls...

## Modification to the source
I added the "audiodevice" CLI that let's you quickly change your output device via a terminal command.
You simply need to put the "audiodevice" file into your /Applications folder so that you can run it by typing /Applications/audiodevice output list for example.
I also tried switchaudio-osx but that did not work!



## Installation instructions
To install the script, run the script `install.sh` with administrative privileges:

    sudo sh install.sh

This script will just copy two files in the `/Library/LogHook` folder and register them as hooks for login and logout, so that they will be called each time the Mac is shut down and powered up.

## Removal instructions
To uninstall the script, run the script `install.sh` with the `-u` flag with administrative privileges:

    sudo sh install.sh -u
