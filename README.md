# wincd
ABOUT TOOL:
This is a Ubuntu Linux WSL path converter. 
This is to allow a user to enter their windows path to a folder and it shows what to type to access the path in Linux. 
Although the user could just type in the converted path this is an easy to tool use for conversion for users unfamiliar with the Linux Terminal. 
It's an educational tool based in bash.

HOW TO INSTALL (USING UBUNTU TERMINAL): 


git clone https://github.com/Ollie-S23/wincd.git


cd wincd

ls 
//This should list README.md wincd.sh


chmod +x wincd.sh
//This makes the file executable


ls -l wincd.sh
//This checks that the execution works.
//It should print a message starting with "-rwxr-xr-x..."


sudo cp wincd.sh /usr/local/bin/wincd
//This should ask for sudo password. If sudo is not installed. Install sudo first


sudo chmod +x /usr/local/bin/wincd


cd 
//go return to main


wincd ollie "Music/iTunes"
//This is an example of using the program

HOW TO FORMAT prompt:
Usage: /usr/local/bin/wincd <windows_username> <path_under_user>
Example: /usr/local/bin/wincd ollie "OneDrive/Pictures/Camera Roll"
//This can be found by typing: // wincd


HOW TO USE: 
 wincd ollie  "/Pictures" //example 
cd "/mnt/c/Users/ollie/Pictures" //this is what to type to find path in Ubuntu WSL
This directory does NOT contain executables and should NOT be added to PATH. //Cannot move to Ubuntu
To COPY into Ubuntu home:
cp -r "/mnt/c/Users/ollie/Pictures" ~/ //this creates a copy to Ubuntu
//It may show to move to Ubunutu. BE CAREFULL WHEN MOVING

HOW TO KNOW WINDOWS PATH: 
I want to get to the Music/iTunes/Album Artwork folder
on on windows property, the path should show something like:
C:\Users\ollie\Music\iTunes
In your prompt type everything past your username and include folder to go to at the end. 
Example 
"/Music/iTunes/Album Artwork" 
Spaces and case sesnitivity is needed
Example to type prompt:
wincd ollie "/Music/iTunes/Album Artwork" 

NOTE: This program should work in all Linux Distros using WSL 1 or 2 and includes the standard WSL unilties. It has only been tested in Ubunutu WSL. The host machine must be Windows
