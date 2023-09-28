#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, RegEx

window = Unreal Editor

if WinExist(window) {
	; Switch to editor
	WinActivate, i)\Q%window%\E
	; Save all
	Send {Control down}{Shift down}s{Shift up}{Control up}
    ; Close editor
	WinClose, i)\Q%window%\E

    ; Confirm save content changes to finish WinClose
    if WinExist("Save Content") {
        Send {Enter}
    }
}
