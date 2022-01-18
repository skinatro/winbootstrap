# winbootstrap
A script to debloat &amp; de-spyware windows and installing my choice of software and dotfiles

## What does it do?
It disables stuff such as meet now icon, disables defender, telemetry, removes bloatware, applies changes settings like theme, dual boot settings, developer mode and fractional scaling.

##Usage
Run `Set-ExecutionPolicy Unrestricted` and run the *main.bat* as Admin 

## Which software is installed?
You can customize the software by changing the winget packages (choco support is planned) 
It checks for Winget and if it is not present it installs it
**This is the list of programs that are to be installed-**
- Brave
- VsCdoium
- VLC Media player
- Discord
- 7zip
- Bitwarden
- VCRedist Runtimes 2005-2022 (x86 and x64)
- Steam
- Zoom
- PowerToys
- Oracle JRE
- Zoom
- TranslucentTB

It also downloads the latest winbtrfs release which you need to manually install.

## Privacy Settings
The Privacy and debloatware settings are taken from [privacy.sexy](https://privacy.sexy/) 
You can use your own settings by generating a *privacy-script.bat* file from that website by replacing mine.

#To-Do
- [ ] Add Choco Support
- [ ] Sign the Script 
- [ ] Use O&O Disabler
- [ ] Download the asus drivers for my laptop (Tuf fx505dy)
- [ ] Download AMD gpu drivers
- [ ] Add Some Taskbar and other small tweaks
