@echo off

:: Set values to be changed, stay inside commas
:: Leave blank if not changed

:: REQUIRED

:: Discord App Id and wherever your vlcdiscordrpc folder path is
set "newPath="
set "newId="

:: OPTIONAL

:: VLC and password if created
set "newVlcPath="
set "newPassword="

:: Spotify API
set "newClientID="
set "newClientSecret="






















:: Step 1: Edit config.js
(
  echo const platformDefaults = { 
  echo   win32: "C:/Program Files/VideoLAN/VLC/vlc.exe", 
  echo   winalt: "C:/Program Files (x86)/VideoLAN/VLC/vlc.exe", 
  echo   linux: "/usr/bin/vlc", 
  echo   unix: "/usr/bin/vlc", 
  echo   darwin: "/Applications/VLC.app/Contents/MacOS/VLC", 
  echo }; 
  echo. 
  echo const vlcPath = "%newVlcPath%"; 
  echo. 
  echo const richPresenseSettings = { 
  echo   id: "%newId%", 
  echo   updateInterval: 500, 
  echo   removeAfter: 5000, 
  echo }; 
  echo. 
  echo const iconNames = { 
  echo   pause: "https://i.imgur.com/CCg9fxf.png", 
  echo   playing: "https://i.imgur.com/8IYhOc2.png", 
  echo   vlc: "https://i.imgur.com/7CRaCeT.png", 
  echo }; 
  echo. 
  echo const spotify = { 
  echo   clientID: "%newClientID%", 
  echo   clientSecret: "%newClientSecret%", 
  echo }; 
  echo. 
  echo const vlcConfig = { 
  echo   password: "%newPassword%", 
  echo   port: 8080, 
  echo   address: "localhost", 
  echo }; 
  echo. 
  echo const logUpdates = false; 
  echo. 
  echo module.exports = { platformDefaults, vlcPath, richPresenseSettings, vlcConfig, spotify, iconNames, logUpdates };
) > "%newPath%\Storage\config.js"

:: Step 2: Update path in setup.bat
(
  echo @echo off
  echo cd /d "%newPath%"
  echo npm install
) > "%newPath%\setup.bat"

:: Step 3: Update path in hide_node.vbs
(
  echo Set objShell = WScript.CreateObject("WScript.Shell")
  echo objShell.Run "cmd /k node %newPath%", 0, False
) > "%newPath%\hide_node.vbs"

:: Step 4: Run updated setup.bat
call "%newPath%\setup.bat"
