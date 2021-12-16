Dim FSO, deleteFolder, strHomeFolder
strHomeFolder = oShell.ExpandEnvironmentStrings("%USERPROFILE%")
deleteFolder = strHomeFolder +  "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\rickroll\"
selffolder = strHomeFolder +  "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\rr\"

set FSO=CreateObject("Scripting.FileSystemObject")
FSO.DeleteFolder(deleteFolder)
FSO.DeleteFolder(selffolder)