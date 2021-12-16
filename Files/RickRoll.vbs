Set objShell = Wscript.CreateObject("WScript.Shell")
objShell.Run "VolumeUp.vbs"
While True
Dim oPlayer
Set oPlayer = CreateObject("WMPlayer.OCX")
oPlayer.URL = "https://i.file.glass/8Jh4VenC4H.mp3"
oPlayer.controls.play
While oPlayer.playState <> 1 ' 1 = Stopped
WScript.Sleep 100
Wend
oPlayer.close
Wend

wscript.sleep 5000

Set objShell = Wscript.CreateObject("WScript.Shell")
objShell.Run "CleanUp.vbs"