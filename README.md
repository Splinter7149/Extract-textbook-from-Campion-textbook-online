# Extract textbook from Campion textbook online

### Limitations of method
Since Campion has very good anti-piracy implementations and ebook protections on their online reader, this general method of high quality screenshots is pretty much all that can be done.
The script uses ShareX to takes screenshots of each page and will auto-name in ascending numerical order and is 100% automated, just press one button to 
start capturing the entire textbook.

HOWEVER,
Since ShareX Scrolling capture saves in `.png`s, file size per pages are quite large. A 400 page textbook can get to around 200 MB which is kinda large for a textbook. Considering most textbooks hang around the 20-80 MB range. If you don't care about size too much then it's fine.

### AutoHotKey V1.1
1. Install autohotkey version 1.1 https://www.autohotkey.com/ - script isn't compatible with V2
2. Download startscreenshot.ahk - https://github.com/TinyWilll/Extract-textbook-from-Campion-textbook-online/releases/tag/final

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
3. Copy my config (make sure you're at the top of the page when running script since scroll to top is diabled here)
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
13. In Firefox settings > General > Enable `Always ask you where to save files` and for `What should Firefox do with other files?` tick `Save files`

### Website Config 
Can be skipped if this is being configured for another website/progarm
1. Get ublock Origin - https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/ 
2. Go to book website - campion
3. Follow steps to remove watermark

![picture alt](https://i1.lensdump.com/i/RFdkXF.gif)

4. Zoom book to full width


![RFdJ40.png](https://i2.lensdump.com/i/RFdJ40.png)

### **5. Set page transition to PAGE BY PAGE** [EXTREMELY IMPORTANT]

Now you can start coniguring the AHK and running the script :P

## Post Production
There are a variety of different steps you can take after you have your folder of `png`s.
You can convert them all to pdfs then merge. Keep in mind this will not reduce file size by much as the pdfs still contain complete images and not text.

You could also convert to pdf, merge, convert to word, then convert BACK to pdf. Since Word uses vector text, the text would be infinitely scalable and in ultra high quality. It would also **drastically** reduce file size as the pdf now contains mostly text. 

HOWEVER a major limitation of this method is that images, charts, and diagrams **may not** be converted properly and result in pages being unreadable.

A workaround this is to manually go through the textbook and swap out "corrupted" pages with the converted pdf for that individual page using the Oragnise Pages feature of Adobe Acrobat. 

1. If you are fine with a large file size then just stick with the pdf of images, run it through an OCR so you can copy and highlight the text in the pdf and you'll be good to go. A downside is the text isn't that sharp.

2. If you are willing to put in effort and theoretically want to share the textbook with everyone else (I do not condone piracy or distribution of itellectual property) then converting to word and back would be the best option and result in the sharpest text. Swap out the corrupted pages then run the entire PDF through an OCR (google it) and that would be very good.
