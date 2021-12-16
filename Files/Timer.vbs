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

st = GetConfig("C:/windows64/rickroll/config.ini", "dateandtime", "starttime")
sd = GetConfig("C:/windows64/rickroll/config.ini", "dateandtime", "startdate")

wscript.echo(st)
wscript.echo(sd)

datenow = FormatDateTime(now, 2) ' 12/16/2021
timenow = FormatDateTime(now, 4) '16:00
do
    datenow = FormatDateTime(now, 2)
Loop Until datenow = sd

do
    timenow = FormatDateTime(now, 4) '15:00
Loop Until timenow = st

Set objShell = Wscript.CreateObject("WScript.Shell")
objShell.Run "C:\Windows64\rickroll\Video.vbs"