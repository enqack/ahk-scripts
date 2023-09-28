#NoEnv
#Persistent
SetBatchLines, -1

#Include <Socket>

/*

Launch AutoHotkey code from a StreamDeck efficiently using GET requests

Step 1: Copy this template
Step 2: Write some functions under the "User Functions" heading (no parameters)
Step 3: Add the "System > Website" button to your StreamDeck
Step 4: Fill in the "URL" as "http://localhost:1337/YourFunctionName"
Step 5: Check the "GET request in background" button
Step 6: While the script is running, test the button on your StreamDeck

*/

Server := new SocketTCP()
Server.OnAccept := Func("OnAccept")
Server.Bind(["127.0.0.1", 1337])
Server.Listen()
return


; --- Server Code ---

OnAccept(server)
{
	sock := server.Accept()
	request := StrSplit(sock.RecvLine(), " ")
	
	if (request[1] != "GET")
	{
		sock.SendText("HTTP/1.0 501 Not Implemented`r`n`r`n")
		sock.Disconnect()
		return
	}
	
	fname := LTrim(request[2], "/")
	if IsFunc(fname)
	{
		SetTimer, % fname, -0
		sock.SendText("HTTP/1.0 200 OK`r`n`r`n")
		sock.Disconnect()
		return
	}
	
	sock.SendText("HTTP/1.0 404 Not Found`r`n`r`n")
	sock.Disconnect()
	return
}


; --- User Functions ---

Example()
{
	MsgBox, Example
}

VisualStudioBuild()
{
	SetTitleMatchMode, RegEx

	if WinExist("Unreal Editor") {
		; Switch to Unreal Editor
		WinActivate, i)\QUnreal Editor\E
		; Save all
		Send, ^+s
		; Close Unreal Editor
		WinClose, i)\QUnreal Editor\E
	}

	; Wait for Unreal Editor to finish closing
	Sleep 3
	
	; Switch to code editor
	WinActivate, i)\QMicrosoft Visual Studio\E
	; Build solution
	Send ^{F5}	
}