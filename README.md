# Extract-textbook-from-Campion-textbook-online

###AutoHotKey V1.1
1. Install autohotkey version 1.1 https://www.autohotkey.com/ - script isn't compatible with V2
2. Download startscreenshot.ahk 

### ShareX Config
1. Download ShareX https://getsharex.com/
2. Go to hotkey settings 
3. Add new
4. Task: Scrolling Capture
5. Tick Override After capture tasks
6. After Capture: Save image to file as...
7. Set a hotkey, I have mine set to Ctrl+Shift+F, if you choose a different one you gotta remember it for when editing the AHK script

#### Scrolling Capture Config
1. Press Ctrl+Shift+f (or whatever hotkey)
2. Click anywhere - doesn't matter
3. Copy my config
![picture alt](https://i1.lensdump.com/i/RFJNvi.png)

### Misc Config
1. Go to - Change how far you scroll with the mouse wheel - in Windows settings
2. Change - Choose how many lines to scroll each time - to 16, this is optimal for capture speed and not exceeding rendering speed for campion 

#### Firefox Config
1. Script works best with Firefox
2. In serach bar - `about:config`
3. Confirm
4. Search  `toolkit.legacyUserProfileCustomizations.stylesheets`
5. Enable
6. In search bar - `about:profiles`
7. Open folder - root directory of first profile
8. Create new folder there, yes trust me, name it `chrome`, open folder
9. Create text document named `userContent.css`
10. Open and enter code `*{ scrollbar-width: none }` and save, this removes the scrollbar as it impacts the performance of the screen capture auto cropping
11. Back to `about:proflies` and press restart normally
12. This can be easily reverted by deleting all these newly created files and diabling step 4 here

### Website Config 
Can be skipped if this is being configured for another website/progarm
1. Get ublock Origin - https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/ 
2. Go to book website - campion
3. Follow steps to remove watermark

![picture alt](https://i1.lensdump.com/i/RFdkXF.gif)

4. Zoom book to full width


![RFdJ40.png](https://i2.lensdump.com/i/RFdJ40.png)

Now you can start coniguring the AHK and running the script
