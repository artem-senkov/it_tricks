I had a task to move Users folder to another drive on Windows server.

I didn't found simple solution like regedit key, the right way is move folder and create link on system drive.  

Boot the Windows in Rescue mode - command prompt mode

Copy Users folde to new location

xcopy /h /s /E /B /Y /V /C /K /X C:\Users D:\Users

rename Users User.bak

Create a symbolic link from where Users was, to where you copied the folder.

mklink /J C:\Users D:\Users

Reboot and validate that everything is proper (e.g. Create a new file in your Documents, and validate it shows on the other drive / location)

Delete the Users.bak Directory.

