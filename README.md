# fix-my-bluetooth

This is a simple BASH script to quickly reload my linux bluetooth module when it freezes up and/or won't start.   
It is *not* intended to fix connectivity issues where the BT adapter is working but some devices can't connect (i.e. it does not clear out the bluetooth cache or look at paired devices).  

## Requirements

* hciconfig

If you are using bluetooth on linux, you probably already have it.  
If you don't have it because you installed BlueZ 5.44+ manually; then you are clearly smarter than I am, and probably already know that you need `bluez-utils-compat`   

## Usage

Clone or download (the green "<>Code" button) the script; then in 
your terminal navigate to the folder where this script is, and run this command: `bash fix_bt.sh`  

If you are as impatient with your bluetooth adapter as I am, consider adding it to your ~/.bash_aliases file:  
`alias fix-bt='bash ~/Source/scripts/fix-my-bluetooth/fix_bt.sh'` (or wherever you put the .sh file)  
so you can run it quickly by typing `fix-bt`, you will need a reboot before the alias works.  

## Support  
This script is provided "as is", without warranty of any kind.  
If it doesn't work or breaks your system worse somehow, that's not my fault, it works on my machine.  
