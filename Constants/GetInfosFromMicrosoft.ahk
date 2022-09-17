
NotMatch:=[]
NotMatch.Push("minutes\s+to\s+read")
NotMatch.Push("^Parameters\s*$")
NotMatch.Push("^\s*[A-Za-z]\s*$")

BlockEnd:=[]
BlockEnd.Push("^\s*Requirements\s*$")
BlockEnd.Push("i)\sPage\s")

file:= "D:\Eigene Dateien\Eigene Dokumente\AutoIt Scripte\Addendum für AlbisOnWindows\_FremdCode\SpyTools-InfoTools\WinSpy\Constants\3c08b4b1693cc4c9e830e1c256443564.txt"
infoFile := FileOpen(A_ScriptDir "\constantsInfo.ini", "w", "UTF-16")
readBlock := false

Loop, Parse, file, `n, `r
{
		line := A_LoopField
		If RegExMatch(line, "([A-Z]+\_[A-Z]+)\s+message\s*$", msgName) {
			readBlock:= true
			continue
		}

		If readBlock {

				Loop, % NotMatch.MaxIndex()
					If RegExMatch(line, NotMatch[A_Index])
						continue

				Loop, % BlockEnd.MaxIndex()
					If RegExMatch(line, BlockEnd[A_Index]) {
						readBlock := false
						continue
					}


		}


}