#! /usr/bin/bash

mainfunc(){
    hciconfig
    echo "Enter value X to reset bluetooth device hciX [0]"
    read Xid
    Xid=${Xid:-0}
    if [[ $Xid =~ ^[0-9]+$ ]] && [ $Xid -gt -1 ]; then
        sudo rfkill unblock bluetooth || { echo "Failed to unblock bluetooth"; return 1; }
        echo "Stopping systemd bluetooth service"
        sudo systemctl stop bluetooth || { echo "Failed to Stop systemd bluetooth service"; return 1; }
        echo "Downing bluetooth device hci$Xid"
        sudo hciconfig hci$Xid down || { echo "Failed to Down bluetooth device hci$Xid"; return 1; }
        echo "Reloading linux btusb module"
        sudo rmmod btusb || { echo "Failed to remove btusb module"; return 1; }
        sudo modprobe btusb || { echo "Failed to load btusb module"; return 1; }
        echo "Uping bluetooth device hci$Xid"
        sudo hciconfig hci$Xid up || { echo "Failed to Up bluetooth device hci$Xid"; return 1; }
        sudo systemctl enable bluetooth || { echo "Failed to Enable systemd bluetooth service"; return 1; }
        echo "Restarting systemd bluetooth service"
        sudo systemctl start bluetooth || { echo "Failed to Start systemd bluetooth service"; return 1; }
        echo "All done, if this didn't work, try rebooting your machine"
        return 0
    else
        echo "Not a valid device number"
        return 0 # exit with no error
    fi
}
if ! mainfunc ; then
    echo "fix_bt.sh encountered an error and will now exit"
fi