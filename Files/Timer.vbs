Wscript.Echo "hello from timer"

datenow = FormatDateTime(now, 2) ' 12/16/2021
timenow = FormatDateTime(now, 3) '2:10:41 PM
wscript.Echo FormatDateTime(now, 4)
do
    datenow = FormatDateTime(now, 2)
Loop Until datenow = "12/16/2021"
wscript.echo "date right"

do
    timenow = FormatDateTime(now, 4) '2:10:41 PM
Loop Until timenow = "14:29"

Set objShell = Wscript.CreateObject("WScript.Shell")
objShell.Run "Video.vbs"