#Script to clean windows and install software I want
# Author - Skinatro
#License - GPLv3.0  

#Add Admin/Root check
#Requires -RunAsAdministrator

#Make a restore point
Enable-ComputerRestore -Drive "C:\"
Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"


#Check for Winget and Install it
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
    'Winget Already Installed'
}  
else{
    # Installing winget from the Microsoft Store
	Write-Host "Winget not found, installing it now."
    $ResultText.text = "`r`n" +"`r`n" + "Installing Winget... Please Wait"
	Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
	$nid = (Get-Process AppInstaller).Id
	Wait-Process -Id $nid
	Write-Host Winget Installed
}

#Enable Developer mode
Write-Host "Enabling Developer mode"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"

#Download btrfs
Write-Host "Downloading winbtrfs"
Start-BitsTransfer -Source "https://github.com/maharmstone/btrfs/releases/download/v1.7.9/btrfs-1.7.9.zip" -Destination c:\script\winbtrfs.zip

#Enable Dark Mode
Write-Host "Enabling Dark Mode"
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0
    Write-Host "Enabled Dark Mode"

#DualBoot Clock Setting
Write-Host "Setting BIOS time to UTC..."
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" -Name "RealTimeIsUniversal" -Type DWord -Value 1

#this is broken as well    
#Change DPI / Fractional Scaling 
Write-Host "Changing Scaling to 100%"
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "LogPixels" -Value 96

# Install stuff
#To customize installed software visit - https://github.com/microsoft/winget-pkgs/tree/master/manifests
 
Write-Host "Installing Stuff"
winget install -e BraveSoftware.BraveBrowser | Out-Host
winget install -e VSCodium.VSCodium | Out-Host
winget install -e VideoLAN.VLC | Out-Host
winget install -e Discord.Discord | Out-Host
winget install -e 7zip.7zip | Out-Host
winget install -e Bitwarden.Bitwarden | Out-Host
winget install -e Microsoft.VC++2005Redist-x64 | Out-Host
winget install -e Microsoft.VC++2005Redist-x86 | Out-Host
winget install -e Microsoft.VC++2008Redist-x64 | Out-Host
winget install -e Microsoft.VC++2008Redist-x86 | Out-Host
winget install -e Microsoft.VC++2010Redist-x64 | Out-Host
winget install -e Microsoft.VC++2010Redist-x86 | Out-Host
winget install -e Microsoft.VC++2012Redist-x64 | Out-Host
winget install -e Microsoft.VC++2012Redist-x86 | Out-Host
winget install -e Microsoft.VC++2015-2022Redist-x64 | Out-Host
winget install -e Microsoft.VC++2015-2022Redist-x86 | Out-Host
winget install -e Microsoft.WindowsTerminal | Out-Host
winget install -e Microsoft.dotnet | Out-Host
winget install -e Microsoft.dotNetFramework | Out-Host
winget install -e Microsoft.dotnetRuntime.6-x64 | Out-Host
winget install -e Microsoft.dotnetRuntime.6-x86 | Out-Host
winget install -e Oracle.JavaRuntimeEnvironment | Out-Host
winget install -e Valve.Steam | Out-Host
winget install -e  Zoom.Zoom | Out-Host
winget install -e TranslucentTB.TranslucentTB | Out-Host
winget install -e Microsoft.PowerToys | Out-Host


#PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './ps.ps1'"

