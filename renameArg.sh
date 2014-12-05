#!/bin/bash

if [[ -z $1 ]]; then
	echo "Invalid Input"
else
	echo "Setting Computer Name to $1"
	sudo scutil --set ComputerName "$1" 
	
	echo "Setting Host Name to $1"
	sudo scutil --set HostName "$1"
	
	echo "Setting Local Host Name to $1.local"
	sudo scutil --set LocalHostName "$1"
	
	echo "Setting NETBIOS name in PLIST files"
	sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName $1
	sudo defaults write /Library/Preferences/SystemConfiguration/preferences NetBIOSName $1
	
	echo "Flushing DNS cache..."
	sudo dscacheutil -flushcache
	
fi
