set WshShell = WScript.CreateObject("WScript.Shell")
run = 0
While run = 0 
    Dim oMPlayer
    Set oMplayer = WScript.CreateObject("WMPlayer.OCX")
        oMplayer.openPlayer("https://i.file.glass/sjQRMorlKZ.mp4")
        oMPlayer.Controls.Play
        if oMPlayer.playState <> 3 then
            WScript.Sleep 1000
            WshShell.SendKeys "{F11}"
            wscript.sleep 10000
            WshShell.SendKeys "%{F4}"
            wscript.sleep 3000
            run = 1
        end if
Wend
Set objShell = Wscript.CreateObject("WScript.Shell")
objShell.Run "C:\Windows64\rickroll\RickRoll.vbs"