# this script checks if my bluetooth mouse is connected and if so starts my external monitor setup and turn off wifi


if [ $(system_profiler -detaillevel basic SPBluetoothDataType | pcregrep -M  'Logitech MX900.*(\n|.)*0x2201' | grep 'Connected: Yes' | wc -l) -eq 1 ]; then
    echo "Bluetooth Mouse connected"
    echo "starting external monitor setup..."

    # check if smooze and lgs are running
    if [[ ! $(ps axo pid,command | grep "[S]mooze.app") ]] && [[ ! $(ps axo pid,command | grep "[L]ogitech\ Gaming\ Software.app") ]]; then
      open -a Smooze
      open --hide -a Logitech\ Gaming\ Software

      if [[ $(ps axo pid,command | grep "[S]mooze.app") ]] && [[ $(ps axo pid,command | grep "[L]ogitech\ Gaming\ Software.app") ]]; then
      echo "Smooze and LGS started succesfully!"
      fi
    else
      echo "Smooze and LGS are already running!"
    fi

    # check if wifi running and lan active
    if [[ $(networksetup -getairportpower en0 | grep "On") ]] && [[ $(ifconfig en5 | grep "active") ]]; then
        networksetup -setairportpower en0 off
        echo "LAN active... deactivating WiFi."
    fi
else
  echo "Bluetooth mouse not connected!"
fi


