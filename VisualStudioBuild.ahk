#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, RegEx

code_editor_name = Visual Studio
code_editor_exec = devenv.exe

TrayTip, Building, Building %code_editor_name% project for Unreal Editor, 30
sleep 1000

if WinExist("Unreal Editor") {
	; Switch to Unreal Editor
	WinActivate, i)\QUnreal Editor\E
	; Save all
	Send {Control down}{Shift down}s{Shift up}{Control up}
	; Initiate closing Unreal Editor
	WinClose, i)\QUnreal Editor\E

    ; Confirm save content changes to finish WinClose
    if WinExist("Save Content") {
		WinActivate, "Save Content"
        Send {Enter}
    }

	; Wait for Unreal Editor to close
 	WinWaitClose
	; Wait for Unreal Editor process spin-down
	sleep 3000
}
 
; Switch to code editor
WinActivate, ahk_exe %code_editor_exec%
; Save all
Send {Control down}{Shift down}s{Shift up}{Control up}
; Build solution
Send {Control down}{F5}{Control up}

; Wait for Unreal Editor to open
while !WinExist("Unreal Editor") {
	sleep 1000
}

; Show TrayTip and wait for it to close
TrayTip, Finished, Build Finished, 30
WinWaitClose
