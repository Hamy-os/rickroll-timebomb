datenow = FormatDateTime(now, 2) ' 12/16/2021
timenow = FormatDateTime(now, 4) '16:00
do
    datenow = FormatDateTime(now, 2)
Loop Until datenow = "12/16/2021"

do
    timenow = FormatDateTime(now, 4) '15:00
Loop Until timenow = "16:20"

Set objShell = Wscript.CreateObject("WScript.Shell")
objShell.Run "Video.vbs"