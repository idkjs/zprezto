#1/bin/bash
# unused but nice example
# Remove Dock items
echo -b 'Setting defaults for Dock...'

main() {
  if type dockutil &>/dev/null; then

      dockutil --no-restart \
          --remove 'System Preferences' \
          --remove 'App Store' \
          --remove 'Maps' \
          --remove 'Notes' \
          --remove 'Photos' \
          --remove 'Contacts' \
          --remove 'Calendar' \
          --remove 'FaceTime' \
          --remove 'Feedback Assistant' \
          --remove 'Siri' \
          --remove 'Launchpad' \
          --remove 'Numbers' \
          --remove 'Pages' \
          --remove 'Keynote' \
          --remove 'iBooks' \
          --remove 'Music' \
          --remove 'Podcasts' \
          --remove 'TV' \
          --add /Applications/kitty.app \
          --add /Applications/iTerm.app \
          --add /Applications/Discord.app \
          &>/dev/null

      killall cfprefsd &>/dev/null
      killall -HUP Dock &>/dev/null

  else
    echo 'ERROR: dockutil not found'
  fi
}

main