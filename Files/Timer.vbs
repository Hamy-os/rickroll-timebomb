Wscript.Echo "hello from timer"

datenow = FormatDateTime(now, 2) ' 12/16/2021
timenow = FormatDateTime(now, 4) '16:00
wscript.Echo FormatDateTime(now, 4)
do
    datenow = FormatDateTime(now, 2)
Loop Until datenow = "12/16/2021"
wscript.echo "date right"
exit do

do
    timenow = FormatDateTime(now, 4) '15:00
Loop Until timenow = "16:10"
wscript.echo "time right"

Set objShell = Wscript.CreateObject("WScript.Shell")
objShell.Run "rickroll\Video.vbs"