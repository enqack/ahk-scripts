﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

EnvGet, UserProfile, UserProfile

Run "C:\Users\sysop\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%UserProfile%\My Documents\AutoHotkey"
