#!/usr/bin/env

# ~/.macos — https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &



###############################################################################
# Run All osx_ configs in this directory             #
###############################################################################
SCRIPTS=$HOME/dotfiles/scripts
echo "configuring  osx_* files in $SCRIPTS"
for file in $(fd -a osx_); do
	echo $file
	source $file
done;

# ###############################################################################
# # Kill affected applications                                                  #
# ###############################################################################
echo "Kill affected applications."

for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome" \
	"Messages" \
	"Photos" \
	"Safari" \
	"SystemUIServer" \
	"Terminal" \
	"Transmission" \
	"Twitter" \
	"iCal"; do
	killall "${app}" &> /dev/null
done

echo "Done configuring with osx_* scripts in $SCRIPTS. Note that some of these changes require a logout/restart to take effect."