### Window Information Tool

<img src="https://github.com/Ixiko/AHK-WinSpyM/blob/master/Resources/AHK-WinSpy.svg" align="left"  scale="20%" />

a fork by IXIKO in the original by [alguimist](https://sourceforge.net/u/alguimist/profile/)



|   WinSpyM V1.05   |
| ---- |
| <img src="https://github.com/Ixiko/AHK-WinSpyM/blob/master/Resources/WindowShot1.JPG" alt="WindowShot1" align="left" style="zoom: 20%;" /> <img src="https://github.com/Ixiko/AHK-WinSpyM/blob/master/Resources/WindowShot.JPG" alt="WindowShot" align="left" style="zoom: 20%;" /> <br> |
| :------------------------------------------------------------------------------------------------------------------------------------------------------: 

## Description of modifications

* The main window has been slightly enlarged to better accommodate all the information. You can change the initial size of the window by increasing or decreasing two script variables (plusW & plusH). 

- <u>*Messages tab*</u>: The result of a call to send a message is displayed in decimal and hexadecimal.
I have ***added an area for the description of message numbers***. So far, however, only part of the information is available. Some descriptions are quite long, so more clarity had to be provided by resizing the window vertically

- When starting the script, WinSpy is ***moved to the middle of the primary scree***n if it is outside the visible area. This can happen when you use different screen resolutions, for example in different rdp sessions.

- ***AlwaysOnTop mode*** can be set from the main window (check box to the right of the compact mode check box).
The setting is retained after WinSpy is called up again. I missed this function. 

* Added a "Reload" button to be able to reload the WinSpy script. (for coding purposes).





