tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"
tap "homebrew/cask-fonts"
tap "schniz/tap"
tap "heroku/brew"

# cat replacement https://github.com/sharkdp/bat
brew "bat"

# https://github.com/AlDanial/cloc
brew "cloc"
brew "curl"

# https://github.com/so-fancy/diff-so-fancy
brew "dockutil"
brew "diff-so-fancy"

# https://github.com/zquestz/s
brew "s-search"

# ls replacement https://github.com/ogham/exa
brew "exa"

# command line fuzzy-finder https://github.com/junegunn/fzf
brew "fzf"

# https://github.com/whalebrew/whalebrew
# Whalebrew creates aliases for Docker images so you can run them as if they were native commands. It's like Homebrew, but with Docker images.

brew "whalebrew"

# Find replacement https://github.com/sharkdp/fd
brew "fd"

# https://github.com/cli/cli
brew "gh"

brew "highlight"
brew "hub"

# https://github.com/ios-control/ios-deploy
# brew "ios-deploy"
brew "jq"

# https://github.com/jesseduffield/lazydocker
brew "lazydocker"

# https://github.com/jesseduffield/lazygit
brew "lazygit"

# https://github.com/mas-cli/mas
brew "mas"

# https://github.com/defunkt/gist
brew "gist"
# https://github.com/dylanaraps/neofetch
brew "neofetch"
brew "neovim"
brew "python"

# https://github.com/madler/pigz
brew "pigz"


# https://github.com/BurntSushi/ripgrep
brew "ripgrep"

# fast node manager
brew "schniz/tap/fnm"

# https://github.com/koalaman/shellcheck
brew "shellcheck"

# https://github.com/Canop/broot
brew "broot"

# sed replacemnet https://github.com/chmln/sd
brew "sd"

# copy ssh keys to servers
# https://www.ssh.com/ssh/copy-id
brew "ssh-copy-id"
brew "tldr"
brew "tmux"
brew "trash"
brew "tree"
# didnt register add via terminal
# brew "awscli"
brew "thefuck"
brew "vim"
brew "watchman"

# Spoof MAC Address
cask "wifispoof"
brew "wget"
brew "wifi-password"
brew "yarn", args: ["ignore-dependencies"]
brew "yarn-completion"
brew "httpie"  
brew "youtube-dl"
brew "z"
brew "zsh"
brew "zsh-completions"

cask "discord"
cask "iterm2" 
cask "font-iosevka-nerd-font"

# MacOS Automation Tool https://www.hammerspoon.org/
cask "hammerspoon"
cask "firefox"
cask "brave-browser"
cask "charles"
# chrome without the tracking
cask "chromium"
cask "imageoptim"
cask "licecap"
cask "little-snitch"
cask "micro-snitch"
cask "postico"
cask "postman"
cask "postgres"
cask "sketch"
cask "visual-studio-code"
cask "vlc"