#SingleInstance, force
#NoEnv
#Persistent

Gui +LastFound
hGui := WinExist()
Gui, Add, ActiveX, vWB w800 h600, Shell.Explorer
Gui, Show, AutoSize Center, Webpage GUI

wb := WBGet()
wb.Navigate("https://learn.microsoft.com/en-us/windows/win32/controls/em-setundo")

While (wb.Busy || wb.ReadyState != 4)
    Sleep, 10

wb.document.body.style.overflow := "hidden"  ; Verhindert das Scrollen der Webseite

; Extrahiere den gewünschten Bereich der Webseite
;~ element := wb.document.querySelector("body > div.mainContainer.uhf-container.has-default-focus > div > section > div")
element := wb.document.querySelector("#main > div.content")
html := "<!DOCTYPE html><html lang='en'><head><meta charset='utf-8'/>	<title>MS Controls Sendmessages</title>"
		.   "<meta name='viewport' content='width=device-width, initial-scale=1'/></head><body>" element.innerHTML "</body></html>"

GuiControl, -Redraw, WB  ; Verhindert das Blinken beim Aktualisieren des Inhalts
wb.DocumentWrite(html)
;~ wb := ""
GuiControl, +Redraw, WB
MsgBox, % element.innerHTML
return

GuiClose:
    ExitApp

; Helper-Funktion zum Abrufen des WebBrowser-Objekts
WBGet(ByRef wb := "") {
    static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
    SendMessage msg, 0, 0, Internet Explorer_Server1, ahk_class "Shell Embedding", % "ahk_id " hGui
    OnMessage(0x4A, "WM_COPYDATA")
    Return wb
}

 WM_COPYDATA(wParam, lParam) {
        COPYDATASTRUCT := NumGet(lParam + 0, A_PtrSize = 8 ? 8 : 4)
        if (COPYDATASTRUCT = msg) {
            IDispatch := NumGet(lParam + (A_PtrSize = 8 ? 16 : 12), A_PtrSize = 8 ? 8 : 4)
            wb := ComObjEnwrap(IDispatch, 1)
        }
        Return
}

