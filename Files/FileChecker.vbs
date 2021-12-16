Option Explicit
Dim WshShell, oShell, strHomeFolder, full, fso, file1, file2, file3, file4, file5, file6, batFolder, path, pat2, oExec, objShell, homefolder, configexists, dateconfig, timeconfig, OutPutFile
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


' code from https://developpaper.com/vbs-read-configuration-file-configuration-item-implementation-code/
Function GetConfig(FilePath,Mark,Key)
    Dim fso, Str_ReadLine
    Set fso = CreateObject("Scripting.FileSystemObject")
    If fso.FileExists(FilePath) Then
        Flag = 0
        Set ConfigFile = fso.opentextfile(FilePath, 1)
        Do
        Str_ReadLine = ConfigFile.ReadLine
        WScript.Echo Str_ReadLine
        If Str_ReadLine <> "" Then
            If LCase(Trim(Str_ReadLine))="[" & Lcase(Mark) & "]" Then
                Flag = 1  
                Do
                Str_ReadLine = ConfigFile.ReadLine
                retNum = InStr(Str_ReadLine,"=")
                    If retNum > 0 Then
                        If Trim(LCase(Left(Str_ReadLine,retNum-1)))= Trim(LCase(Key)) Then
                            GetConfig = Trim(Right(Str_ReadLine,Len(Str_ReadLine)-retNum))
                            Exit Function 
                        End If
                    End If
                    If (InStr(Str_ReadLine,"[")>0 And InStr(Str_ReadLine,"]")>0) Then
                        Flag = 0
                        Exit Function
                    End If
                    Loop Until (Flag = 0 Or ConfigFile.AtEndOfStream)
                End If
            End If 
            Loop Until ConfigFile.AtEndOfStream
            ConfigFile.Close
            Set fso = Nothing
        Else
        Msgbox "configuration file" & "[" & filepath & "] does not exist. Please check if the path is correct."
    End If
End Function

Function CreateConfig(dateconfig ,timeconfig)
    Dim FSO
    Set FSO = CreateObject("Scripting.FileSystemObject")
    Set OutPutFile = FSO.OpenTextFile("C:/windows64/rickroll/config.ini" ,8 , True)
    OutPutFile.WriteLine("[dateandtime]" & vbCrLf + "startdate = " + dateconfig & vbCrLf + "starttime = "+ timeconfig )
    Set FSO= Nothing
End Function

configexists = 0
do
    If FileExists("C:/windows64/rickroll/config.ini") Then
        configexists = 1
    Else
    dateconfig = InputBox("What day do youwant this to happen on? mm/dd/yyyy", "Create File")
    timeconfig = InputBox("What day do youwant this to happen on? hh:mm", "Create File")
    CreateConfig dateconfig ,timeconfig
    exit do
    end If
Loop Until configexists = 1

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