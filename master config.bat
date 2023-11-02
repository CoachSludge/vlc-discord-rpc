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
  echo const platformDefaults = {^
    win32: "C:/Program Files/VideoLAN/VLC/vlc.exe",^
    winalt: "C:/Program Files (x86)/VideoLAN/VLC/vlc.exe",^
    linux: "/usr/bin/vlc",^
    unix: "/usr/bin/vlc",^
    darwin: "/Applications/VLC.app/Contents/MacOS/VLC",^
  };^
  echo.^
  echo const vlcPath = "%newVlcPath%";^
  echo.^
  echo const richPresenseSettings = {^
    id: "%newId%",^
    updateInterval: 500,^
    removeAfter: 5000,^
  };^
  echo.^
  echo const iconNames = {^
    pause: "https://i.imgur.com/CCg9fxf.png",^
    playing: "https://i.imgur.com/8IYhOc2.png",^
    vlc: "https://i.imgur.com/7CRaCeT.png",^
  };^
  echo.^
  echo const spotify = {^
    clientID: "%newClientID%",^
    clientSecret: "%newClientSecret%",^
  };^
  echo.^
  echo const vlcConfig = {^
    password: "%newPassword%",^
    port: 8080,^
    address: "localhost",^
  };^
  echo.^
  echo const logUpdates = false;^
  echo.^
  echo module.exports = { platformDefaults, vlcPath, richPresenseSettings, vlcConfig, spotify, iconNames, logUpdates };
) > config.js

:: Step 2: Update path in setup.bat
(
  echo @echo off^
  echo cd /d "%newPath%"^
  echo npm install
) > setup.bat

:: Step 3: Update path in hide_node.vbs
(
  echo Set objShell = WScript.CreateObject("WScript.Shell")^
  echo objShell.Run "cmd /k node %newPath%", 0, False
) > hide_node.vbs

:: Step 4: Run updated setup.bat
call "%newPath%\setup.bat"
