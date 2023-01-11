#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; This is the main command, can run fully automated and go through an entire textbook. Will screenshot, crop, 
; auto-adjust and auto-rename files in ascending numerical order.
; Uses ShareX Scrolling Capture as the main tool to get images in high quality. (you obviously gotta download ShareX)
; Not a good script for beginners, this is very crude code written just for my setup, script must be configured for each individual textbook.
; This script was used on, and works well with Economic Fundamentals Australia VCE 3&4 8E, by CPAP on the campion.education textbook reader website.
; if using a screen resolution NOT 1080p then you must adjust mouse coordinates.
; THIS SCRIPT WAS USED WITH CAMPION PAGE IN FULL-WIDTH ZOOM (ie. the page stretches out across the whole screen)
; WINDOWS SCROLL SPEED SET TO 16 LINES per SCROLL, optimal for enough speed but not too fast for the rendering to keep up
; Recommended to use Firefox, then remove scrollbars (info in README.md)
; Press Q to trigger the shortcut, adjust for whatever
; Q key will be replaced by this command while script is active, right click icon > suspend hotkeys to disable script and use Q again

Q::
x := 1		; What page number it starts NAMINIG from, adjust for whatever page number you are starting/restarting from 
Loop, 1{		; How many loops it goes for, lots of config required, set to 1 loop while testing, if it works well you can increase from there
Var := x++		; Increases page number each loop by 1
Send, {Ctrl down}{Shift down}f{Ctrl up}{Shift up}	; Ctrl+Shift+F is the shortcut I set to trigger ShareX Scrolling Capture, you can set in Hotkey Settings in ShareX 
Sleep, 400
MouseClick, left, 1405, 800		; Clicks on the active window which the Scrolling Capture will be used on, can be anywhere on the page
Sleep, 400
MouseClick, left, 1405, 800		; Clicks on the Start Scrolling Capture button at the bottom, if an update changes this location then adjust coordinates
MouseClick, left, 1405, 800		; Double clicks because it sometimes doesn't register idk why
Sleep, 6200		; This is the time it takes to scroll (6.2 seconds) and capture one page, adjust for your speed
Send, {Esc}		; Remove the Save As file pop-up (we aren't using this one)
    Send, {Alt down}
Sleep, 300		;(0.3 seconds)
    Send, {Tab} 
Sleep, 300
    Send, {Alt up}		; Alt+Tab to switch from the book viewer website to the newly opened ShareX Image Scroller capture output page
Sleep, 300
Send, {Tab}{Tab}{Tab}		; Switch to "Left" on Trim Adjustments
Send, ^a		; Ctrl+A
Send, 7			; You must experiement to find optimal number, isolated script to test provided below this one
Send, {Tab}		; Switch to "Top"
Send, ^a
Send, 96		; You must experiement to find optimal number (it's a pain)
Send, {Tab}		; "Right"
Send, ^a
Send, 12		; Adjust Tab count and add another Send input if you need one for "Bottom"
Send, {Tab}{Tab}		; Switch to combine adjustments "Vertical" (the auto guess in sharex is pretty useful but you gotta adjust manually)
    Send, ^a
    Send, 639
    Send, {Tab}		; "Last Vertical"
    Send, ^a
    Send, 651
Send, {Tab}{Tab}{Tab}{Enter}		; Tab to the "Upload/save depending on after capture settings" button
    Send, %Var%		; Another Save File window should open like on [Line 29], this command inputs the variable on [Line 19], the page number
Sleep, 200
    Send, {Enter}		; Save file (enter)
Sleep, 400
 Send !{f4}		; Alt+F4 to exit the ShareX output window
Sleep, 400
}		; End of loop, start again, the current window should be back to the textbook
return



; This is the isolated script mentioned on [Line 38] to paste edge values and combine adjustments, can be used to speed up manual screenshotting
CapsLock::
Send, ^a		; Click on Trim Edges - "Left"
Send, 7		;Left
Send, {Tab}
Send, ^a
Send, 96	;Top
Send, {Tab}
Send, ^a
Send, 12	;Right
Send, {Tab}{Tab}	; Skips bottom, you can add it if you want
    Send, ^a
    Send, 639		; Vertical
    Send, {Tab}
    Send, ^a
    Send, 651		; Last vertical
return
