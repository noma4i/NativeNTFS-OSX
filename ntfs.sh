#!/bin/bash

checkExisting(){

echo "Checking if already existing device on file..."

while read fileLine; do
    
    if [ "$line" = "$fileLine" ]; then
    	echo "[WARNING] Device already initialized on this system. Nothing to do here"
    	open "$FILENAME"
    	exit 0;
    fi
done < /etc/fstab

}

addLine(){
	uuid=$(diskutil info "$FILENAME" | grep UUID | cut -d ':' -f2 | tr -d ' ')
	volumeName=$(diskutil info "$FILENAME" | grep "Volume Name" | cut -d ':' -f2 | tr -d ' ')
	
	if [ "$uuid" = "" ]; then
		line="LABEL=$volumeName none ntfs rw,auto,nobrowse";
	else
		line="UUID=$uuid none ntfs rw,auto,nobrowse";
	fi

	checkExisting;
	echo "# New NTFS HD: $volumeName on $(date) " >> /etc/fstab
	echo $line >> /etc/fstab
	device=$(diskutil info "$FILENAME" | grep "Device Node" | cut -d ':' -f2 | tr -d ' ')
	diskutil unmount "$FILENAME"
	diskutil mount $device
	open $FILENAME;
	exit 0;
}
checkDisk(){
	filetype=$(diskutil info "$FILENAME" | grep "Type (Bundle):" | cut -d ':' -f2 | tr -d ' ')
	#echo $filetype
	if [ "$filetype" = "ntfs" ]; then
		addLine;
	fi

	if [ "$filetype" = "" ]; then
		echo "Error. Please, select a NTFS device"
	fi
}

#Check sudo
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "This script should be run as ROOT. Try sudo"
    exit
fi
echo "___________________________________"
echo "RubeniumTB. 2013 --rubenium(at)hotmail.com--"
echo ""
echo "Initialize a NTFS Hard Disk on this system to read and write" 
echo "Next time you won't need to initialize it again. Just plug and open"
echo ""
echo "* Configured disks will not be auto-opened!!"
echo "* You will need to open /Volumes and click on your disk!!"
echo "* The device will have a label"
echo ""
echo "* Although it should not happen anything wrong, use at your own risk"
echo ""
echo "* IMPORTANT!!. Be sure that the NTFS device has been safely removed or it won't"
echo "be mounted in write mode. In this case you can connect it again to any windows PC," 
echo "remove safely, and then connect to your MAC"
echo ""
echo "Now you are ready...."
echo "SELECT a NTFS Disk to initialize on this system"
echo "Write quit to exit"
echo ""

select FILENAME in "/Volumes"/*
do
     
     case "$FILENAME" in
        "$QUIT")
          echo "Exiting."
          break
          ;;
        *)
          echo "You picked "$FILENAME" "
          checkDisk;
          ;;
  esac
done



