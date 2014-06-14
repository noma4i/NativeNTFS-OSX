NativeNTFS-OSX
==============

Mount NTFS hard disks to write on OSX without installing third party software

Make it executable:

	$	chmod +x ntfs.sh

Run:

	$	./ntfs.sh
	
Example output
	
	___________________________________
	RubeniumTB. 2013 --rubenium(at)hotmail.com--

	Initialize a NTFS Hard Disk on this system to read and write
	Next time you won't need to initialize it again. Just plug and open

	* Configured disks will not be auto-opened!!
	* You will need to open /Volumes and click on your disk!!
	* The device will have a label
	
	* Although it should not happen anything wrong, use at your own risk

	* IMPORTANT!!. Be sure that the NTFS device has been safely removed or 	it won't
	be mounted in write mode. In this case you can connect it again to any 	windows PC,
	remove safely, and then connect to your MAC

	Now you are ready....
	SELECT a NTFS Disk to initialize on this system
	Write quit to exit

	1) /Volumes/BOOTCAMP	 3) /Volumes/My Passport
	2) /Volumes/Data	 4) /Volumes/Untitled
	
	#? 3

	You picked /Volumes/My Passport
	Checking if already existing device on file...

Initial Project at:
http://sourceforge.net/projects/native-ntfs-osx/files/

author: RubeniumTB@hotmail.com