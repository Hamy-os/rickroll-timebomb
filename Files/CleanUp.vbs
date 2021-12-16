Dim FSO, deleteFolder, strHomeFolder
Set oShell = CreateObject("WScript.Shell")
strHomeFolder = oShell.ExpandEnvironmentStrings("%USERPROFILE%")

set FSO=CreateObject("Scripting.FileSystemObject")
FSO.DeleteFolder("C:\Windows64\rickroll")
FSO.DeleteFolder("C:\Windows64")