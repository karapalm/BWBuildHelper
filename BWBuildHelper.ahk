#Requires Autohotkey v2.0
#include OCR.ahk
Persistent
#MaxThreadsPerHotkey 2

CoordMode "Mouse", "Screen"
CODE:
global ToggleThis := False
SetWorkingDir(A_ScriptDir)
CoordMode("Mouse", "Screen")
FileInfo := FileRead("buildOrder.txt")
global oText := StrSplit(FileInfo, "`n")
global msgIndex := 1
global time := StrSplit(oText[msgIndex],"`t")
f1::
{ 
global 
global oText
global msgIndex
if  IsSet(MyGui) && MyGui {
        MyGui.Destroy()
		MyGui := ""
		}
		
global myGui := Gui()

myGui.Opt("-LastFound +AlwaysOnTop -Caption +ToolWindow")
myGui.BackColor := "EEAA99"
myGui.SetFont("s20")
ogcTextFileInfo := myGui.Add("Text", "vFileInfo cred", oText[msgIndex])
;ogcTextFileInfo := myGui.Add("Text", "vFileInfo cred", oText.Length)

WinSetTransColor("EEAA99 150")
myGui.Show("x5" . " y5")
if WinExist("Brood War")
WinActivate	

return
} ; V1toV2: Added Bracket before hotkey or Hotstring

f6::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
if  IsSet(MyGui) && MyGui {
        MyGui.Destroy()
		MyGui := ""
		}
} ; V1toV2: Added Bracket before hotkey or Hotstring

WheelUp::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
global msgIndex := msgIndex+1
if msgIndex >= oText.Length{
ExitApp
}
if  IsSet(MyGui) && MyGui {
        MyGui.Destroy()
		MyGui := ""
		}
global myGui := Gui()

myGui.Opt("+LastFound +AlwaysOnTop -Caption +ToolWindow")
myGui.BackColor := "EEAA99"
myGui.SetFont("s20")
ogcTextFileInfo := myGui.Add("Text", "vFileInfo cred", oText[msgIndex])
WinSetTransColor("EEAA99 150")
myGui.Show("x5" . " y5")
if WinExist("Brood War")
    WinActivate
;return

} ; V1toV2: Added bracket in the end

WheelDown::
{
global ; V1toV2: Made function global
global msgIndex := msgIndex-1
if msgIndex <= 0{
ExitApp
}
if  IsSet(MyGui) && MyGui {
        MyGui.Destroy()
		MyGui := ""
		}
myGui := Gui()

myGui.Opt("+LastFound +AlwaysOnTop -Caption +ToolWindow")
myGui.BackColor := "EEAA99"
myGui.SetFont("s20")
ogcTextFileInfo := myGui.Add("Text", "vFileInfo cred", oText[msgIndex])
WinSetTransColor("EEAA99 150")
myGui.Show("x5" . " y5")
if WinExist("Brood War")
    WinActivate
;return

}

f7::
{
global oText
global msgIndex
found := False
global time := StrSplit(oText[msgIndex],"`t")
global ToggleThis := true
while ToggleThis == true {
if msgIndex >= oText.Length{
ExitApp
}
  sleep 200
notFound := 0

result := OCR.FromWindow("Brood War", {scale:2, X:1255, Y: 1070, W: 250, H: 100})
    try found := result.FindString(time[2])
	catch {

        
		notFound := 1
    }
    
    if notFound = 0{
		msgIndex := msgIndex+1
		time := StrSplit(oText[msgIndex],"`t")
		if  IsSet(MyGui) && MyGui {
        MyGui.Destroy()
		MyGui := ""
		}
		
		global myGui := Gui()

		myGui.Opt("+LastFound +AlwaysOnTop -Caption +ToolWindow")
		myGui.BackColor := "EEAA99"
		myGui.SetFont("s20")
		ogcTextFileInfo := myGui.Add("Text", "vFileInfo cred", oText[msgIndex])
		WinSetTransColor("EEAA99 150")
		myGui.Show("x5" . " y5")

		found.Highlight()
		if WinExist("Brood War")
		WinActivate	
		;
		}
		
		}
		}
		
f8::{
global ToggleThis := False
		
}

f9::{
ExitApp()
Return

GuiEscape(*)
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
GuiClose:
ExitApp()
} ; V1toV2: Added bracket in the end
}


